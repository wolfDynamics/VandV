set terminal postscript enhanced eps color solid "Times,22" lw 2 
set output "U-0901.eps"

H=0.025
Um=19.41
Z1(x)=x/H
Z2(x)=x/(1000*H)
Ux(x)=x/Um

set pointsize 1.4
set xlabel "{/Times-Italic U/Um} [m/s]"
set ylabel "{/Times-Italic z/H} [m]"
set title "{/Times-Italic x/H} = 4.0, {/Times-Italic y/H} = 0.0 "
set key below box
set xrange [-1:2]
set yrange [0:2]

plot \
     "../validation/exptData/mu__0901.dat" using (Ux($2)):(Z2($1)) with p pt 1 lc 0 title "Exp.",\
     "< cat ../postProcessing/sets/*/mu_0901_Ux.xy" using (Ux($2)):(Z1($1)) with l lt 1 title "CFD"
