From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 31 Oct 2014 16:50:51 +0100
Subject: [Buildroot] [PATCH 2/2] docs: RWD website
In-Reply-To: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1414770651-23358-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

This patch migrate the layout to an RWD one.

* Fixing the layout of all pages to be fully responsive
* Adding panels around "Recent commints" and "Recent discussion"
* Adding fonts for glyphs in buttons

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/about.html                              |  13 +-
 docs/contribute.html                         |   6 +
 docs/css/buildroot.css                       |  14 +-
 docs/docs.html                               |   6 +
 docs/download.html                           |   6 +
 docs/fonts/glyphicons-halflings-regular.woff | Bin 0 -> 23320 bytes
 docs/footer.html                             |   2 +-
 docs/git.html                                |   5 +
 docs/header.html                             |  36 ++---
 docs/index.html                              |  55 ++++---
 docs/js/buildroot.js                         |  11 +-
 docs/news.html                               |   6 +
 docs/sponsors.html                           | 207 ++++++++++++++-------------
 docs/support.html                            |   6 +
 14 files changed, 221 insertions(+), 152 deletions(-)
 create mode 100644 docs/fonts/glyphicons-halflings-regular.woff

diff --git a/docs/about.html b/docs/about.html
index c2e963a..5d7cee3 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -1,8 +1,12 @@
 <!--#include file="header.html" -->
 
-<div align="center">
-  <img src="images/menuconfig.png" width="340" height="220" alt="Buildroot menuconfig" border="0">
-</div>
+<div class="row">
+  <div class="col-sm-6 col-sm-offset-3" style="padding-bottom:10px">
+    <img class="center-block" src="images/menuconfig.png"
+    style="max-width:100%;"
+    alt="Buildroot menuconfig" border="0">
+  </div>
+<div class="col-sm-10 col-sm-offset-1">
 
 <p>Buildroot is a set of Makefiles and patches that makes it easy to
 generate a complete embedded Linux system. Buildroot can generate any
@@ -52,4 +56,7 @@ cross-compilation process.</p>
 GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
 delivered every three months.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/contribute.html b/docs/contribute.html
index 91959f8..17ed26f 100644
--- a/docs/contribute.html
+++ b/docs/contribute.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Contribute</h2>
 
 <p>Buildroot is an open source project and you are very welcome to contribute to
@@ -29,4 +32,7 @@ Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your h
 <p>If you need any support yourself, have a look at <a href="./support.html">
 Support</a>.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
index 09db24b..7138abc 100644
--- a/docs/css/buildroot.css
+++ b/docs/css/buildroot.css
@@ -14,23 +14,33 @@ body {
 
 div.sponsor-main {
     background: #eeeeee;
-    padding: 2em;
+    padding-top: 2em;
+    padding-bottom: 2em;
 }
 
 div.sponsor {
-    background: #eeeeee;
     padding: 0.5em;
     height: 12em;
     display: table !important;
 }
 
 div.sponsor-description {
+    background: #eeeeee;
     display: table-cell;
     vertical-align: middle;
     text-align: center;
 }
 
 div.sponsor-description img {
+    max-width: 99%;
     height: 4em;
     margin-bottom: 1em;
 }
+
+div.panel-body p {
+    text-overflow: ellipsis;
+    width: 95%;
+    white-space: nowrap;
+    overflow: hidden;
+    height: 1.5em;
+}
diff --git a/docs/docs.html b/docs/docs.html
index 9ddc059..c44ad8b 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Documentation</h2>
 
 <p>The Buildroot user manual is where you want to start reading if you
@@ -41,5 +44,8 @@ help:</p>
 
 </ul>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/download.html b/docs/download.html
index 88efbe7..33da838 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Download</h2>
 
 <p>
@@ -83,4 +86,7 @@ Because you've only been granted anonymous access to the tree, you won't be
 able to push your changes to the repo. Changes can instead be submitted for
 inclusion by posting them to the buildroot mailing list.
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/fonts/glyphicons-halflings-regular.woff b/docs/fonts/glyphicons-halflings-regular.woff
new file mode 100644
index 0000000000000000000000000000000000000000..8c54182aa5d4d1ab3c9171976b615c1dcb1dc187
GIT binary patch
literal 23320
zcmY&<V{j&2v~_ITn%EQDwryvUOl&(7+qP}nwr%T)@#Xz))vdaxYSlh#^~UKsfBJOq
zc9j<s0|Ey68QNGt$p6_qf&bzE&HwKZ6H}1|0s{8?QStu6AJzU_aS>6mA1(8T6a0V(
z7zzkXUYUXEN9+9I!ap!DFOd#1wlTB=0s{G=z_>rwLFyJd-Ppy62nY!Dzg$rNAC#b>
zW_IQ_KN{(eU)_(Nsd6JjiMgTUPb}E#|M~#|A(>mdoBe3JKtOVEKtTU^2nd*oEldqf
zfPj=PfBaZ}zy at NZ@n!KN0s$!#{qX<lkisy5AzIitx&3H7KQ+*PYCQJ!AxB%=8vppI
zDEw#@KWJr%QIoSVbo;5R`tcL at Upx^A7;x at iLmN{dAhn-dzyUw&^jfS*yRx%&bOHiW
z&;8*7KerOpCRS`|=V1C1tF`+RNB<vc?`hCnO^trmtc~=;A^w9#jneUt1^xlhByaxA
ze|82A<NkjvG`-upv4M$!!7iu~Gz5}?kpWo0w!kFF@oyj?_)=haAfW%Qn^~G<_V$kV
z_D>Et`TP45!w50c8!{TL10RAG)dniu*zrR^LTrn}O+tRb0xd~0E&>H($0brSGJ*iX
z8bUAs<d}-%mmV-c8osevmk6I%5UC7vh0-by)a at 7&y&?k3<Z9wTgT)U|*lKsVAQ_rM
z+&xXPgm8?(&&*sD4SGrU6V}DU^V<FD+WbVgCL;-D+8{ONP3x|b(K?Z}FqQyDA8lEK
zfxcR(LOT*zcWBYweqCi%t<h2v=dH4k#a&-ac4;gT#=k%#pf1hx|HU#VgeV+oAC)04
z6<?!EWj}**203RT=#5@wm77PFeIX#u<?oLuhz~4>lphEzmTHiWB72`anLv4VuEY~_
za}WVZu^zT;R-~y&T~BYSiJ>00^O~gpl9q$zHI%Y>Lhsr-MaOrb%y%q|(42pX<4bce
z&%S(EIYGx}q8~@4pX*EKdS?h=SI&tEv`GGM8)AScL0;U}brn10v;~p2;1NOn2Um$W
z*U=i%VuwBRz at Z11qKr(qgO8vr*&X5{?12dd{6*l`Yp`?k3MDcih%qI+g!qV2n61L{
zS-80y9H-NmrN`sSUC*p$lut-w`?nyb*goYXni_zf3okCBA{zrCwXDq^$DQB5U?DQ*
z61o2X9r4;yA!5sN`)f6pe9e8pguH(cK5%0-vMf9<azURFgB@qsO9$RyPqj}Vz6C7p
z88I>zrWWth^A{_9wXmH0nW$}wo9hf at Mt&V*5m2_W0Zac{Bwl*3N0W}7D6V5mO|AbT
zMePe7b5d1qntWOB)2(kfH3+1h@`qd<P;-YPKtLo%n{Oc<r-es;GO8GaLQcSg;XK+L
z`zjQ8l|UKpl$7E=2x)>Cj$7%?Ws`6C=E;z?vBmFy(ZuU>?ZKAjdKnE_$3iyZHlp%_
z77-FteGS2x>7s==RC=EgNc20pi}B5ZYP?<*;Yn$7M)<7;<>9ljc|Q@}q1HAXA>?XX
z{-<=FYU*8Yx_bmPn*eq|(6}#S=KV{`|BZ*Xn#BSEOxT0n<2%3UJglM<ldqm)p{Gvk
zznudH0{;F6LUdd2>Vh`FJxT)N*_o6m(8iH0h%=F{CzZaZ8j3d^x{KT0bRC__^79ko
z=tr+cA_{hBgbop+gr}pTjdh4lR9OGJYID{f-h7TdFVsTYrJ)sVL)@`Nes|mRJSCBQ
z1vY;D{cTS=MK<Mm<GJ&`%?mft_#5sOZl&KYvbRt=XbdhHJlmT=n+fO3rgpNfb}W&D
z$GUgGv~Lt2mll;L8 at 0fQgkpGOlooKs|D9&V`DBLsjvB%!T0F|Im%_-jFit5WR(FD?
zq*|$&|H2%85^FR{eO*psA`Lu0CUbFjSWp%~dpsCGD^gTSTR7NCSqLNA&)akG3eyQy
z61~KRD9@D}JvRXa5Aikku9YS#v)0d;<>u(Wy%|e~Iy~QIi?KJEB~oXKHbERbMSWb}
zZ$4oLo6Q7!JY7E&nSn99sadal3PMV~{548>MpAHY2H1T`ZcmF;%7p*Gd@)Z2X$V%V
z$1bYU`a7{N-&8b(7EKxaD_#{2yNI&{t3rygLIQh8i%wdtQ^A4QWPw at AUkIZjStyRy
zt6gfVP}$xz$w}4TO!~910gWc?ujr|I`%rxo*~ZRJj0)|c2kf0tb<J$b#5f=4c81x(
zZ%7)E;8Mka7RH<jgof8lMaE&{G8Renh!ku+hV5hxuca?UHbk792|7)*r{|fpGvXD@
zr9iQI*zKu>H}jLi*?h7#a}r#3UcIh%=Rq+9Oy<}9gOY2vy$@K}ixTio-4X=M1@9qI
z^=K!qz=h?boc7!Dn&O<!kiOq#v5G#>o<J`XvhMyBD8Vy{aO<O>iZq*aBh4h7*kXhO
z>pcXk->0DSLp`H8gAy`9imj3RrTwYMLn%~ax2R;y6z$S#bv?dXh$n!f{I%|F6CUzH
zNglJr&iX(OdhO|M-zijiorLRikL!4b&v<-I;cb2U*9AhJqg6Km0|C@3UPi3VuIeHB
zE<VAre{dbMO!g>vJkk^d768V;-U<9n39<fS4Z!%OE6P*)w|cf~z&NJ9q>OEzwHebV
z^!;=ohVM{+SKmNmc(fHuOajOg)eZg4gP9Z?_0r_5C&wd<_hxoo_+<48kwZJ{Y3kdj
z-euRxbNtS4ORoUDw~*0{d?YbybVf*Z&j3f0Df|p6wtg}#){z60vHIVDYyvXYiqt<E
zv42ntRD|g6;QriC<grTFp5B)Lqd3|98*VJr$rST6j1b8XNyF5`p`cVWJdx#RkA#3e
zK~fI0Lv34q9~2^ftGRpUzt2|_Cshs_!#Ws{m%d-|Pq~eGfxM2-tNOYQxA)ybo&tPr
zy}D*~4m(FY$#qBh{JlV|hcVkn-@(3qcZ{-=R5EM+SZ&PVI;!a`!xqz&hp{B8=wre4
zg1>w5fLstI@;wPh+Bd5ldW?|#AJXDCfR%eUYew_;&(+g6-=ThC?S3>8w7??8cY at rx
zXANRWBOACbA6cC_l4+aF!&NSKMmj<F50TeM^11=0$IbOguWx+Ry>mK4PZoF7UG%C5
zf)X%cLC&;>^$NdUhi>}OaeOh-03Qt>c;rBMl8FXlh6u#+T;)aNQAM7iYm9MwQAwQ$
zauN?iXC->xfF|9A>Yn3rfOkVpm+8&z?LmtUcZTECdVP6 at K8N`=NVn%wvgYT?wv(~@
zRQi1syDn_w+iAw6*B2j_C#*4Oa=3>>HsxLFzfc-lqHiBWPsG=v_Rqfna_4v6=XxDj
zbWvX=bCj4jf>-mGLa)^qT)yEMN*AOa6}Y=z5r^W#5+eB*=NMYFLlxp|l;Umkrykmm
z>1Pb@=d7ZMXh-p<@vNTD{%C%$y%YYN-VTD)5%>5QvQP<I{bfuNJ!2gb6l~c^l`rwM
zG@=4mWTj39^|f+JZJM_C@N;q3-yGkk&ndIcW8)lqt|q(bP^jigG875^*m;bm5S(E(
z$scq?l);fG6I8|J^XaOU*kozS)~ZEx6&%b`;&S$?N!6A6W0Yr^`&HBn^<lmo8Nv=o
zMJdt0^ta6G+d8Wp)b?~K^PkeL@`F0Q%ID#3aMVNUrKFwpt+ZEIc$W65Mfb)<JY5m5
z9hQ^`z!Rom0;pCOcWO9>lpLYJRS<O<9_~I0F{K1kixeF)9XlPIeCxgt2d7r`-nbZj
zV)f_UpvRSv<VKp8V;I}L7M8^*W*G-2O~g{`@yk|{KpW#s@*<feBo|;ie at Dy@h^~n9
zcXmk8`Eejsb(PD^B+KP{f!^mKl2*&37|ImXnfS?UQsmh2f$0zh3&po%?~Jsp0Vuc<
zY&a(MHfx!m`u|Nc67f<TbZ2r#v?aF1wZSg`kqVyQ73C}xE^A2 at l}b#uo+74`a;y&e
zyp}n8Wa#y=YHEB-rd2RUD^qqLUP$wQU9V3RS`bj0(gNQ2T$&F6yqr<n_!(!|23*0G
z7g_zCF_U&x9^cc!B3idTC9Nw={eJO||Nee@i&YT}$l8sH{Mwl|zwkVqJFp>mulc?J
zubo~#6g|MIS#tM^y?0~C`jU2#a#T$VEGW;6HZHFWLEd6C6gfhTw6Hw56Q8*V+~VWN
z4AL!NdF6?QxaUpsR*ZThZ22BrG(+5-Ud8j`|8n^?HPZ7*MH$Y-GdTEy_<}Ip%UH`%
zC_ybkuvZT`(*5-7zTSgt1y-AX_=4Vq{_y1PK|t=n8Jsz8N`x^1R#L(Hf(SZ(R}et=
z20=K0`i!{GTB{~I3$HZ!fZ7PE0K3mgrlOj^=HLjmlzB{Q!INjU2`4JhvkVArhWI3g
z2BFDRMNusx)0QK>n-{_BPLkO*tH<t6Dz(DCVw{(pWg4$U6mjW^M?!b)K>?}~b^*t2
zL|B8 at 3a#it1GzFLG>-jntCpno1TF0OMs-3&ICPgAm$awK{?_0%(W?W=|3Ym<2B399
z6?sOv=odFeFq-4ZH~dK}*A#W0I_F%hOcy3B(B=(oS9N?rZK6R)u8SFgYl67%j$Vzn
zT2com)G;k5ej>5&f(ldAjf;DQ6!5hOSn{C{3 at HGgJ<Y#}SD=GkOhxTYRR&WZgTQhx
zH_d=VT<?t*N+>fyHHbCwb;JWINl)t_@@KmMH+bk8Q`tU&fRBnQ(#)4NSadxDOZI(w
zdDV`IZHTev{l3e|YJOjG)!*{Qd3Bbc-oK>W2LbR{;`&r7v=uuYN}Q!j?bR6qQf6%Z
zD|U^HaP=Duw&<9^4wcHPM`Vo0d8#?cwduvt)W!CY2}SzBBsBVDmS^qNq)C$4z-w!v
zu|}GDNU(nCqGP?m2nGh>so7Y#2j<s;oMD)xzvzC at oAEg^IkE-H)aIAdPE&ddbR{Kv
zz?P4Ls9REPf?_nP3Y37utt$xkK1mOG%TcYwRL-8$gEJXuB&z{Uq<|?HBo6KK(Wj?J
zn7?lpO((?e at oqz1L?HE1V44tGAJ;Rlb*G73(-gvZ*QVV})sDeYktz#OLucHjCa`iz
zj#G{XAhW at jqDko)(_*u1&v1QghF|w-!*B71m}pm0C9o7Ths?<4GzUCzkEOtcFd(N)
zR-NK}WafFMD|Yn9UNLQQ#p?BeUtWHSIeazWv%Sn at qu9vfc(%jk;7a67g6}2v+3{N;
zI#9U6dr!|U1?vC3mcwzx51E-7&71_sTc6<u*&Iv5&S5s0A3kjCeY4qE&Z)P-9ToDY
z@_9tA!RpL?j<L!GKSn6V8){pIS^jF=rlmzMlWF_4kpk+RR|Z2(PK_Q-&yhW*(1AYr
zzDum*tfgB7Ha$=|AChj#IVVPj1`4-zEaYA&14_4~dhTC!T{*9<db#Fci>SAF;UD3l
zTWTJlAQB4XoWDz=q%Vn+jEY#AwT at 9A52;uB*W>Xje?f=`^s2DJ+s}<wE);O8ttKAV
zVVdi0E%z=EH;#44EW3V7YGseH0SU3b=c!pSV1J2X(*4xe=knCMiuVMhF)aRUm66^B
z<_q!fn{|~)S7uEH;JoWOJ2Mrkpw6zyi(3XJqtBEoaErvHIYp}H*j`(3Nrw&~`l>6b
zZHctO--vJs(vA6u2D!C~MMV%ZF_OWKERqY*L7bn~pu>emnX~};w>xKsx+HmlModD*
zRe7jxvS`Tr6uHz_O`!|yld+VyK0FQd$icoJ&6I5J_C at tYl{!GM>wg8ezB^sMFG{SP
z+~tO=8DM|68>>8kL{vLa+9stZVE2&^q(j<a=P=MIUQl<~6qs3Whk!U)8BaM7o#vWf
zHIdjUw~C6@0W0r*n-~|yri;{}t?kwlaip!a)eiKO8x;G(J1BdM^qkFm{(cS&@ZJeE
zxe6sLm!E`;yNen|^?a%|FO&BQD;ZHCIurauQ%lG@$_T+Qi*}@{)lwgXX9S0l#4L=D
zD0l8gWM*QRXx!cyo`47GOFBNpDIXnyIo80RMDX+##KZlh_6}*oYs<#lM{_E`*&a|0
z9?IH-SaET>&WrimlxADG12>h3l$)M<qSLSC7+dyn!#^5>nnoG~F+Q9%u&_RYNWV-S
zu8Zij1T3udO7yF++y7qK8?@Qy;j&>d29gBr(=CZ4lKGZq^?3#ajS1CkdX7~BF>3+>
zYZVG#qpmz`T?l5}q at jYe4}&tAuC*{c-?JynbwY*R0wc+;hotR!1CBsHEV}H{pEV_Q
zQbs{v@#pEsI<-g|xh#rQJeXH}di`N|kNqjL$UE~3So5<F@?4q5Mb!nL7@lG`&~&MU
zulIpEtGc%l)tznBy7I1aI$su^HayiY>Z0bsl-UTxtBvq=J|gu+RP<bZ7mBGQ#%SN3
zgj~!&&tvvZGu|rTA0DRsV8TQU-kP&fwaU!0U7k$;vNuead<VU(pSX@nojEX>Erd8o
zq%Cu)1CPBz7A=EEzAUR|YC=IU9%hvt-M5s$vP}yYbrS8_xEfnDFCI~k&{z?<!G1!E
zK^iZQe+bHf`7!IHXQ83rJd#1}5)~%c_&+uxINN4BK3{JfWuezYs-XMRHwoBD>w$lx
zkHl$$>l6w9E<=%h&m}p0DcU+fGPM`d($iGo+S3fJhaypcIE2yU{5H<0HCgoFK{GLe
zCVD+P9e_etX_H9_t6xc?c?>7 at pb;TOf<dm}8%_nHJ)`I(F}c!$ODTK9uZilbNw2u_
zeb8C*HyGMNBey at 3QUre)`94+`W7q(zLbH@7+)X-{T$!=p$K>6%r&2oND`VL682Y at H
zo9cs|v@$?BZbm;;TeI&1a|hDjryghe`LAHHYtRh=V`G;8&hH=u_R(Y1pv%n=LH^3^
zFkvIs>V~3aP^2c9bjt$HI!&KIsHF;<6GGV<&cs3&h&!7&F_0TJrW*V^F`?h4z4b9P
z)shrVOIq;gnBtPE8xy|c?B+5Qhe9v=A{q0$_8i?gn>U-#3cMhdDV#r)gg$jBSHuwk
zk}gryawT5)H|i8gP1CW0tGr3sKVvSH=C;mKYmExi&<#lKQbxbVfh72pcQ7oRvXB%=
zj1OXzBoz0nqSwe)?dUE|N0dA`Jm0((=&k$p`<hR}4eiPswo$9aPyxLO4i~!g=mnTx
zE>L1c)=>Mo*a}LJx~+>;2tcjSh+G1pg5Y6PO}pj8+;D<i%(EpdjDHzVa5^P(H!aRN
zDG9aJ;;WOiOGzB8X)Nf8hRU|IOjcSDRn-2j)z^c-OzLsWd>LXc4La-kzxi{dPSiJ7
z8<GOI{i~RF1BpdCtTs;#S~FBa!Y7@=1{d(WZMJIG^D(UJx_Z+Vv+cN7VVIAJM38F`
z&w!hdCl8g+wz9NpnB>JC>pyci_t`xsI3_*zD$W!<hdW6$Q9Ua-zyo25I&FrlHu{|_
zYp#0clvH2Ks-Oy?Lx!n}E7joN)Q~0cD}!}Wrbv<rv_aX<y%W!&1%8=}Vw|(??+{!<
zGGpBE^MdtcpA><jqcoA=99>*$<4tXVP|Lyd;LAI{(?h2Cw%dD@_;lH-jHe9S+i*4E
z4mm+=yxP3;fjmRcM+tj5WK$Q-9_(!w&4?Zu{~+v=o|o<F@{wDx{!G^tmVmkOV5uOB
zh$QgAFD4CeDn>`vvKeY_m&uw>iUOhrn)3ws&_6vxHpM+hCYx}osCc0Y-Tyq0z<hZX
zfpCQ-{8OvGpZwcW^f)}Lo+>_HH?lw9s=QM+-Q{gQx~FocK9j!8!mtbNX&zBR0Xt$l
zvErya$XNJ at m2B@ie45(Z(19?S0|j at Eej=zw0gE??YVlwp4LSl7VHUHoo|LraFf00W
znbw<}e@I<Hbw;);W7UCbDgM&wIGk*$E`08I8>Uzes(fu}n<{VdSNo|T`)7axnJ2E3
zGN-K>ywjN_qvqSYS+3(Tift}Ac+Th~V)w~#F13j;D~$iUE^?zyrm7R;K!FVAfwf4+
zgEe5#q65&2_ at 2P9Xi0@IzKK<kAr!<DPjQ=xFOaLN-rrtR7gc3RK{~fhjwdfH&csKj
zaZe1M4|b616oGh|PlK!ylqSbV+%BkUfh6LMQBPDHedW1RPRNBs6bBoa-b;N6+{mbS
z!$ND!ZmgFWmo}hTfxvinE|g{AU`~8Q0za+=Z8c0n=;zija<Evjk@?80M4rrT#ZQRO
zrBy?VgD@Zjk%XQb5U2>B$Mr=t77zjDw^ry*`L~i%3hjv^6l}?gMTjnmHPNyRD!RE?
zVzeC>gkFuW>V5P|ms&5GT4O at NM-mhCx+a!f0)LQsDAs{!i(cE9Ov8j9Ot~S$SX^Tu
zbvv@~cen9fE3YI>r2~|YyQVnWpZ-X~m^M6OE$L`m&MG`G=33X8DprYlBgvrAjN>#)
zf7F5}TO}Od#i%Pvr08HxB1L|F7Lms;vt;^z`LYoE^HAlcM$*80N!_Nc at Z0C)>z37!
zB*8pC&7s#0b$L(fb6zzb_{hxyz+_iYonkQLn|M^r48oOlXXt>e7{zFo03wLhcxL@>
zruxmZD;ZM5U?3RR7ni`br#{#)H87#K at FBbE7!;=-Y}c+8!h3d5JExlz2JatQJ+?rH
zEiUGqC0jaoW>(Evnh`H^?>C|E?;wdM>7y!8D4dVkC<+|T0zP?LNZT4#$T22k5m50<
zzoALNpZ84Yo=WEiK^k;g##y>nq*73%RqJFJOX%P{Sin)USV69lwgt`-QDJjC{IgNf
zBW4`*siNB=F5h|FpHc}mY9&H}jGvvlX!|~~dIc_J`?;(WsSic(jU>39iqS|Q7u!DA
zY&kA%G at cdsQv^FWgQ+Nx#A;({7tI>&nigS1N0T`xz+mg6 at _{zT%;E%P(``j&bsETN
zs(q(bWF8KI1M_eY6S%3}4I-pbgJgDL2EYIzP<M(+c_8ONwVQS94>p(Kd(4_CqWI0N
zt8t_kb+H2&h#4kT$#q>Ac%Z2bj at 0N+O;y at sWv$8hU9Zv at p#uT7sP~{kG6820-K~jc
zzx+zAW+=CEi%kufkYzrAXi1hFg5D^8VfWJSQx~1y>x~0bBV$33&FY`a087m+i@@r#
zv~L(PphOgimWm81wL^lXk96(eK$#U=hQ}pu<-Srb at X)RzEK4@vVL9cwNBv&D7`P0@
zqV@&7+T19`yV}oc>o1R%dLPHOtgykfkQ$mBKeZU*==5=O;{`t7RV`&nOFus5HWa@{
zXbhx+TZxRv=(Ko|DZe>7Tjhggvxn2ed0umrYSl8cq1^h1GLxv~Ovi$ld?|yHWQbL0
z!Ivh5s&TPz0K^%VfE05%mJqQKs?A%Hu%Xt@^>Aoa$L6|fp<>G;+%>slePPEnR_yRL
zj;yc0lCyoP$Ic|g#bX(o<$00nsg*!S33aGHMx(FL1IZKmm2(3;)8v<UYB+5=P6wsg
zSniF&#fPt2L{XsG-fQTT_#$ivPp_t^(ahKd(Rh(8Ou|TmUnGJfHU<g0KoA^t>{BEh
zq+0};_3dYnO)g&8rn2p~Esgh&5iy4}Tc`s#l(NQVP*B`-s(Tsgb%=E*x!`vNJk-`k
z+fm(7Qcae_0=zlj<0~2F)s}a7tknTT`cdo_)g;9@CX6}Sx(tZ<L{_8e_IXE&8e26V
z;CLS(t^T)iM*3Q*+_UBMm!L%|#-JZ)!8T?7qZ1fd)9%>-vBXh9eV`-C^l3uT_&kk_
zy!QGr?i9qmGaJ`03`VTK^)eYd43pD#6!NwJr0B=zjQz5pDVIxqPspfGxc527cKuN}
zM+02tzw?((Ojfsh0mh)!EsE8yz$@B*zv5LC{@~DSWie_CKtd_%3$Mw8a()p(IDD|g
zE`aGjSXm`BggX|S0Iz8=DQwWq7Y>nH=l2gF6&gHY9=4{U@)*&>a5Lg$i6r`O!H}dD
zW;VLr?c at ISTZz-X^w-r)NsJz*7Ik*4Ly0i!Bq{Zd;rF?m8fkO1OM@>WW%j&Gv#v`$
zQmZ$kLeIBScr38Jb at l%c_PQ|;xB~H7qh?jaoofQxl!Mou$divTfpW_5t{jt5n6rPK
z!vRqg8v?Nc`M^e6lM(@2!!NA&BnKun1vVjc1z9YJv06oEUF=G;UtEZ%aSas1z8-O2
z9BC#xzszD?1bF!myHOXw5=A=9o9- at Lhm!h0YZ-|@A8 at Y(+_Z-DK5aN{$p1>cump2t
zD5Y<$oDGvcGH&@I&=`_@&z9%lM_#_W8iyXJa<&`Ydn;~#brX*PwN-j%3h<fB>f05d
z4E%>Bj9t_c-iGDTJ%p5oMe%gVzvc6bd`PTb9cQF~$q=bA787VjPi04Chi`i>W<+{G
zV&FRA7KPur^W&w!IseMOaI{i>RU}bnWQwl$BQA-{N7}-t4=-KVk!vbXQ}zLtKK~Vb
zh}Ni+HS~8TjiAhC5SP%}5)++t1N`_`^O*%;^P^`Rj#KY=<U1<4iRfgcC$Gn}AMb1M
zN?s6PT##cH6iIlsJTd~6{wMa#z>G1%z*MAySF&MiUH~wJ&BDU^kXcQH6%9!xbzqRA
z*C;FT!ttCmLLmGAVU95En90d_(qX5~%fa`pstx}K4cq`D|L4WUM|^?pXIDSM7j{_`
z3G3~Fb+5YFcta__mAzP+vqYM1(W%@8)d!*dz-)tf at tMWp!rn*|T0x9DwQmg`{~HF^
z(&{06L_~x$VO)QgY!}xSiz9L|mX<F;xlthCD7a~1a at Gs3cyPn{grQxByg1GOXdc~g
zC&tNHba*q4{u+aEh4(Vc$rrXWAwRiwf_2gno6<9!ufwpdCfLD}U<ho-u{69IiT5KA
z8$Az5fb@wbUgN&CY#$^xNtXax7fm*Q|0*Y)gFOLDY4DfWRy#SN)58U?zu(EJo@?!k
z`g~m&={E0ikHy-t=>(gredtzS?t3cy_RjmTIU(u5dB$Pw+b^CLxKo!Kal-ql57<b|
z#z$iOz*q>+p#JJ3zg*_!Lh#CTQlhLZaSdUpir$y9?7cH^D{5SFz4E4#R}~cZf9Y7m
zo;9Cm&MV)C>%p+!bv-*M+$WJVT;|<w-@zHzJ>RqRPchoQ_7BbK-|yWM-<~FecpFY<
z*+V%yqBEN@TuW|VvPKxu;wzn6PE#vLx(^m2Npl0_=R`(f{eE#>@hhO=C}MNbxWW_v
z>i*?56p5poIt)%$`T(F>Fbvwm_u72fIj{*&-QjYl(EG&}&x2XCp-|gm&6LNw(*^~r
z(;e^7)q{$HCsydP(lnZ{CMFoZw`Di*O0teoyeuOUSTp1qVs*`Z9<21;EeAe2nsvN~
zRC6*s$3cgHx807}TdF!K-J0iGN^SO{w>QZ;&Y$k3Kg?6j$YHFGxQg*a{%}-aq4xqy
z&jBywOH07(H!X%N)*9k*pouLg-u)|*fP*&bSExgq7b56vts%pZKc$!0Wz)kTr{n^c
zH0~1dFP!u<3h8{HY$Lt50id%$jqN@8k8{VALlSz2UVh`a-#R#>zHXSNNR|{7e9pN>
z7TX5KSq#wFmVO-1xo)>HN)vR#Rlnv;&}%R75X^KT9xE{?m|>iz_BH-9O;l0+ZPl<=
zgateSH#Dy&8cL!Z-sT5hq(D<^FoqY at mUzl=C-x$<T+(cfwtvuiXjK|(NH0Xn9A|_8
zN@Q$ctLyk|VnTqJ<NKw#hx8ix=C`ZQ=y`SN17CnncVUIa8w(jE!LoMo8}(k9DHQHI
z-g&fb4KwDTDdi1#zx9j#%q^`6*=ori8}VKF8$0S2b`R=}fw6)b=D-v}<oUJtcxAX^
z5yb{cj{=L1IfI0%x5~<*u#%4nyRE74AKhkNb*K1%B>j>?y7nvAexvXwZ#MsHgqBZp
zatbN4V_H3K-L2vU at +EGATIm6Ap`GU7lnAV|6g`8C(61y*zDel%2}VNAy1~`blPHN=
zu~bPszDZI<LbFNp<XK!85Ox6XIee9uyf^$d&821GmFd;!#5u!KAcJ}-GvLVn{Rtzt
z4zjdT6ugS_{As}g_ErL5f<PA_xGS&hN1g8BpwToJRatyg9x>*Nw<W)=hPmW`YgJD`
z=B+8j-?sG+Thqq_vo3^H8CG)Xn#qUaQ;fyaV0>!P&qvtzvpA@&tGdJu;DIn1jLdX;
z)t`xZwPI`TdB?s+nt}J71mU}hawwEbPnX$OL8-5nO5zHu%kT?MIW=*XjkB-H;p1>i
zcVuPz(G&BP?D09Rzm-PH5sJ;n5|jQEen*(AWy!9%8%FrobT2yz?d&1r2KSS&4>U<6
zI`!cdm9dC1Hqn|R>+xX&B?|~3hd5zh)13!mfVsLczdYF0Z^iL|oZ=M%0c8`h0j{;h
z%1hkP*~06j7+rI at eA;#HV5_3yPVSKp^*V2eP_Sfgqg3u-*%?R0LP3RyTYh<}z$74T
zm;u}KQ$iP(LarIp;*m~l_iNZU>-f~@+~!>SGMv8xF)qs2Y$b}ymmJp+*51+kk=cjL
zmrRQpnwbhoGj^9~t(5N((?x;Acs$~9zAnWpC^CsfbL2PPH_JB*;3Rr>5>gypdKu}@
z_u^!zU-oM)A~Rv>w@^Qe=A>t8Iv^I5(_hL|C*0994Dztje1-tP3-Ei}#z%jPDdt{8
zyj~NQD-NaTJp#iw;$eW^b71W?UD at s5BzgyHwZ@1vXRIB(t^Jc6R_Dv)Hs|F8qoLtu
zkC$6KPc3aY4^Z{pf-Y8+AhHwBfE}WYF<334Vo!l}AXb%trV`AC8!T6My>xRvk#pm3
zHHM+JX=1+RLngN;k-3IQ<#A5MJ7DB2=>^LqD<l_g_~$luZN9^63q#scdK0 at f)9IOw
zA&(zw%*8yaBSL&uLmjAs8KwkiSI6xl=341jC97;R1@1QVV~D(vZNyy8Xl&h?Y?;E!
z9Z1Dl3|0IWE(K{uonkZ1LcQK)G$v8J8#|F7>b1%kc#Q5A6%d%>IN;UIK4n-`2>D{q
z6jHM}#0~z-%3!K9 at Y#+aN0N<0nV7!}Yjdma*li{=yZCa<F`-5NNS&=0#|ERXw{Gy_
zeoZGR<(IJJ^nA8%&J>;H1McT5{GWCXe?F`+{8IZy5lj<y+5J1!-z#B+u2;#MN>QQS
zrTFrqEl5LQ6y%wNh;`4Sr5J9RFfaH9Na!?n-M<k|Af+EbiZ7QA?2xsPhD^qz1z5x*
zO2?bs*rPyYgwJ%?SXv5v2bAex_t4(hJro?l(T((Jv!`eG90#&V04Z296VLz}5!%p=
z^(GEIK6V+H*Gx1sQ-NMVFsf|%1QmoudyaMWuoK5xSjasUxi`JT<{9<3W^0G<T}b~E
z`7*D)r(1~cq6nI2K(`WfW=CoL3(B|r*xoq&GdK<UP58`oRb~tO+q|^w^G at xp(RYjw
z%T+~^DCV2*3+QV;IC_*m?!z(30jGX;JG913#sV23j!!DHsAG3$-@h??7KUB0F?)DT
zL<*@-Ew>FD%$2Vk4(|tbc=g}P52_RgNSWcn3t)I333gCka0q_DoXC$EE|u?la)3Hi
z^Oqsl%8F|h!W<CC1cZi|dVYNdge6i>fxtA3&}E0KOg)%}(*;8p7JP~oIr7x~qr5ZS
zt}-eG#D;|kb-q_a=YwMke!SFlTUXIIIyhgBr at r1$`M=v573zGUZ&Z;ovB#T+9BM0n
zr7D53GV;cMPnitw at 6~l#XLgD-r1|n4y?bO!UcEc(qc7(MCKr0=6j!>Gfu7UOSM}Wr
zrxrvQMB^yRGbu2{3OLrjP=6`>V`nK;{YAu2$`B8FPF$7gZq2ZawtwRV0kK!LeuHJz
zBRuR2nG8L&T7&sF(BmF^9-`K%l-a6BxnQhEsSCcMv at ca`7C+N|8~^)`NY6R>9&v-F
zrSt9am3)7()<FA2XNl4(@>aGkIp=6JF|$3I0`=vgS2}W>J>gIe0La)`lZ<Dt$gm|Z
zcmtk}6gR;1VHh5K&H9jg^Mu1{S46hfy;3(K4aO|1iR)rdSd;@aWuSB9|J|<c9zMPs
zQQ}@)X*RZjpDOe6J72Ol<6K(TDwoQ9YY<M;G6T1Cf=OeoVA$=yl*-788E&GT<ruYO
zrdKCMK3(HqvlZkq4EVz}e4!vKUZ*=zxyU!Vj_tL%aT4{w?AG%<67P#6akCSh6N>1P
z{l;udc}QmIM(7D`(wZl?Lb}i=W9(rVd}caMm3YX at 2^XEe7&6ov>SA_Ul!YAv^tDYe
z*R}KK;n3W|(DgTksHFp3 at 6t-fBvNI)YrjgMY^JK*K9SzP<OUBT4KSew8yLe$5W*qA
zp;CX{?+b-;vd0|07I6=L94UCseOgaTWXHY;oyh|qfO@U_$}@a42Kz*l1%^?a25)hR
z(!!u($BZqmb4dbO!itc^ir)ZkvFR6f%i`1~9mCrC3g8!^_anuZrWSW1{>;OKf3rVT
zZIRx%tWtOEFkX+LaNh*i3kxphn^$o6AR{?)Vf=48wJF#hmJAL{4=%^PHvR5{s~IP{
zw at K5SuH&}_b<P?45;M%vM|WKItmW$i*#LIx;T|TI!fog9o9dfmNLwz?_uk!f9oJU=
zkASy<oJ+j~W?bIs{-`I_U!DofGwqhn%T{bbAZ;{ST6%B9(`nM!xcs5th-Scc*oqiR
z(dpW%$L&&qjA#+NtQ?rD=3<1hUG|=)8qnT2wT2+I0raTkVTk&t#>#waDN at Dr*1#;8
zj3>L`zy2mj!ymgpko;mUZsF9%+di at q6&^JI&CNM|2-W!Zeqx=@JCWw~Na&^Xr+cBx
zD~Z_rhQn8JeQezgl~_%EHY<}DHhMelQ2W>38M}*g^5Ct4+hNyYc-PQrKYdKg5LHHH
z5W7c4sF^;~J5~Mpel;s1wg&NA+sZYw=yb=+oocgx at pdsA=k7k;S&^0Ye2PKV+jA=J
z%kv8!s;L>%L)sb~z5JD`X-KkMJ5d1~ffCHpybzHPuu8Wkh9i;1AKMAU1s;ZClWgMl
z9P`0tCm%NxKJ+&MOk+0dFd)syx<+DEDBOC1G?twC at TmJP@Pf+(*wj=;G#0iQZJ(iJ
zhG-xA3G|5*R@}e@#7hh_*PQ0J_Ka#hcc~Q+8mb_($57A2Z^ikOt#!vf at PA|k3?1E5
z^UZ$&A+KqZAMh0`O@?fzgWeM%dCVoQ%|~*CFOh+?GLu=z8cs0Doi&=R*WpzS47aux
zHba&$jRt-gFb4(L at D#uGjmM|c$++VCtQCqFUas=KKW6lql}beIi}Ay+xI^LtKc@0l
zdkQ#o-z()ZN*r?{x*<<JW4l}CpTW9Q_N*te=v;@R3~~W9{yt=@HH}X+|9pnlXLxLz
z)^z<1tVpW9e>KqloOm<s7_-#Oz at ZD~a284&Nu$B&TjMIZ{LN9)-+<N8;u)c65uo%b
zUIOy^2D{EDp2^ktTwcMcCa!aMb5@-&$^M8T%-C^BXwR=?{gZt#86BQpyv$g5GEk7n
z^ti?x8Kb-AY2T+m+kB|Wy0%u{Ip5gx`9O)vPjjB4$p|ox*}0N2OJM$NSj8>bT5w&V
zwbjn3a$Q(Enfrp$2j4p_eha~MoJ&}&iUWxSZ!8q_P97wWkI`RGWaL1RonK|Uak^P;
z{w86F#atZuy~}Jq{ejU<W at f?ZQ9AnNRoM|10M`+?c;7@y?Yd#8W_(ZS;3zI8sla(L
z5Y1sqI2Hf+I+b-4RHIg)bq*%?OlHs?+HaANHc)#etx)3C-BRPX4S5~|gZhYGh(ZFu
zHj&U_G|CAMuwW#Q;G<Y;^tte;A3J-9I0qfdJ(*;megylO=I3B-bnzlErBveR_4sIb
zYki7~$Fyu&wS3BcZdi6}>dkdpr)fS;-)D&h^{m;kRv&q0P&gY>_Wn_t;WSnIeQ`eb
z%#)mE*~XX(4i>^EwvF2`&wtc>49nS`qmL5rVz_ at uPo?s)>dW#p*sb5eNQ$qmB5fE7
zIKEk*|9H&Y!}-D<?r#-H;rn-P>4T&BI9rH|YQxZHIugY!WQFWiyQn?n9k3;PL8)U<
z#A$~V3iae6z(8e(o%*Jz6x-yjLA3G>j at cDD{8TQFa@~$UQzl;@bJcoH%=3~W6|DQs
z<e{K1lyude^*(aF;ojwvJEwmPp{rB@?BY+HmT_vDjz#dxh$p$yG$M+(=&LYn?J*Up
z_-N)AJ0hc2Hah+{n4KeggFlt{?eo-9eOmIL)Za1k<3<QF;s{f3a=BvZZ%PTPXrQ?E
zcGdA2vv7vk(gf1jyABAdI<Y)|>(HWs+Dv4k7d(U{^^k~iOA&FEyEHm?ov{QGSJr>~
zNBu!tDZKyZ{}g5cj*I*BSypu7bHuIB>1sJ{JNP717@@1r>7Y4r23)bUfoFRm^)9*)
zCp9u|gQ?d{lA>+D7QCSr-=sytp!RCmlefdPbI3o?<*$WGQBXkp!Cmif{c*L*AGg&b
z?7DWdx+ZbqK6&wh=w7UbYfJvH%6U0zyA-;}t7CBq?(%dq3th6bFl7)PLYI4xVL;II
zyHxo?4$HrM`P6?8Tvl|24X-t54n_i-h0-n0Sl27fDZZL8HpAEcQr6*yVHCb~N7E27
zmK=cCh>pD6WTW;ikgkvgiM7ROCf}QC3cT(BH$oGu-0t^8PgZ6MX?z=8Lz0ne4T4^V
z-thAcyiPMh&#zu3J_ES$FBkO~$SuMt-s!u at 48@57H?*$e8Pwbi2Yrp3CQGtR8@!yj
zUk8<?1<K6e*y=Nk6->vkyy#dDr0sf^D6wod7j5Ylf6w`wCmvcUyN^|w?dyUD_KL31
zE~V1>J!2e)z`E#xwN&7d0=DYa2DB6pQ4$wj;@8aSM at 4AZA{vjr3qxAHqrY=7T1`94
z_r7;6x{PXo9hdnJ!N8{tBM9uaKE8=KN-T_n=P(rOra}Vi)`j2v%gIZ{7+g3|lAtj*
zB}}a4stt3~a*NENyqPR5c(%njgkzR6v4J&RA53RN_zXRj1VRWa at ng<k!Qa@m6fFa`
zYzyZkjpB6J>nMMCvLZvQ at +s}}=U?P|DLxeem<(Nuv7p63NlkA7!CE10D3wO$!ANw9
zObXX`YL=R6%2TeGd1?xrLK$VEwP`qN7HPlo`MM}dK3I_H9Mzu;W}$)%JINEGUpF90
z<gvB7E(zrOZxcP#6{UX~`yp&i;NQ9R%e4utineLnt8bPaovVl{U<?4W^;QtD0q6x4
zi@>#}mTOLB17SWhL}ZMRGTaFgmU`2O4g(>;@kprlF*Cp)kpy38(i>~14$R3s?6^?3
z(HgVQFov4jM7QWqadph`*vm$aIIXJNNcy|m2$G|ntBgb!GwWC48iMztD|o=(>;15q
z{$%3Oyvm9 at O`4JoB64cJ6IF%XU*;BiuoJW(Z#j^UH$l#9HR{Mm7GhSUp-f9TbS(>+
z=TBhELjbeJW#KE%-tr3Zh`nd{*Z|1O0F`(MTCf5%G2HfRAaIr0SmvO)Tb5xAR`)IS
zDJQ*_aT_PknaBS3@{3I7may&O+zm8(y_ea0+%G2M5N-*A7TFy3Ev_pPhhj93^hy2p
zsf~STscg0VHv6)-suJJ_HvfhYQrC_Zn#OPKnOTJx<X2^otW&`+!NnGf3aSt3yp|54
z+yQPf*!ss2Q(Kpt?XAz_dj6}O?~?T=!sj^5(-A(8x4!Bf+V_L6PhXv<jB3ax*7njB
z(ZN)fN?(@hO&2KRV~x^%E70YK<#LQLS3d(0I9eOJyQ1uyeG@@(Wb^n;QV}xx?EYO-
zdy9$(39dUI3(6v&26xINoAl#VyOx&L3aF5W2yuk1Xqz-X9i2;xi(gqo)d?+79qn>|
zt$bef1E2v24uA^CoX;uvbNr#<^;$Bn%#1V#=IB2G9-e7<Y@mLs%DwUC)-Hx+BO`{b
zhM$L)vLPrd>lqg49ji0~i?uStqONO;%fa+^ReCL3RZjio at nXo^g1nNPbwp1HNQV$>
z1 at gTfZyF)87$l6~%5yxJnEQ+ie9+G%;f-}&?6HbOe(kPIzzE$iqX`vfok4&ai`W-d
zwC99WD{QBt=6MXVD;D962#XX?i!3ihIshIg{q>fXgAMys=@kLkS%9d+mfwd@#_C~~
zWK at 5#ngAyP8WOs%@7M-tVjQG={`OIT#6O?~USMV}Aqz>h#^!wFb!x$Ak5eY`gw_Il
z+T)(XzI$10nIxlz0YQ2v4bhDugbSQ_y at s>>rHp1+Svi2 at -tSsqlpIzzPTyUJ4&6Wg
z8t%*#w>(z0UiMXQELXctsZ9~k5wCOwHVp$8E;=11PHAtA3;??YDwCu|jO0#YA&u$Y
zH5r8Whl=eb)AhDqcB?eTs5~8M?tF{1{8~NvkvAAqv1XpE at W8WAi4NlSL<2eyn*gM<
z`9H|9_I|T^m{J0!3b3`LzciFAtd2LRu7s*s_Jsb0!7S+S7aJc*lt;`*gA-fKO8ArY
zhA?VR7)jaRX;6nU@n|8Tf?%{mBM3tZ{xr8|dm^KZpSP}F*K>^y1+c#*N_x*PnQV4j
zHXXs6C)_oV)=7T8wRg}#7y$*Oxzi|WxACj3t`$g+Hqob;^h}z0MYNO*)*)W%TP2K^
z8+E9AzoFgl+*G|4FIloWVp$TG!&6mGHAR&+;NTh5J^p6y6{5nltCkJrWQ|oU6qW*h
zPfOY$qZTp;a(A%n4fddVdJyiB=7!MR^#1%L6Aw9d{;jcxYG!qJqe2pMrVyVhg_AWH
zCaVB55F%KKa5^A)lmMTPG=x(hh32&U*SA$xDMyd3{ZPxizi!QSz5K)*82;WGBaTay
zHDeWU8ME{rnLTO at q8U-xW(Oe4ST5z)w)yoW?X}$W+<N7V69>~i-yIXAq7T_olt03#
zG2Gu}eml^<1&ha=qIj=`nCg>Wm_0+Cwd6oS*LRkQkSgAw;gvpLKW`3noP`D1=r5(`
zPz>bAt@<5_%*bgTP#IghY!XJ=NFJ98zDt@(K^*}B$ts!PZjYpvq%tq5kYKLcJ at r)h
zpjGeWgspjG<GafDL_GP^8o5K}%PZ<VzL7lT5HNT1e$4Cl)*p6*!d+KArn*qU&~5?<
z=13dW+N(1QRo+4<sP69GTD|<}p1FF83s<#E<LG!Ncw!3Yh<M|eOrXGqtYl$!`uRHo
zz|PwfS$tzTC9KQlG}_)o;2jyN7L+2h{pBIsO2B3y2#z@^!j#!`va-UfgP7FS5lX6|
zkTc4APIj4o;nQ_e$$Q at 60kkMgThl2KUwA;KtM83s;LumjuG=zc0Q1I@+Gq_Ckvy(&
zZ*)V(e(an?7r9!aT2>$}U5I3;E(wFu-T*ttBj99nkVSJy04B*>3M>M=4CJBW{W+wr
zmo8Lbm?dVE#ijL><;n9dCt|#Od|9HFF4#}Y<2rV})IKejs~q4`MWlQNc41Kjp$r;F
zAUY8dDHmc{hLF%=Kik+j1W{WEZP4aaE0T_9G2k3)50J+n4@!F~;6Mm#3~zA2!(uNW
zD?3~9!k5Ez<bEJKo|shg=HV_MzmL2RhEsG=wqr%^(7TYkCpz}~z1~}mY0ilUA<weS
z)oL-t+Op{}(shbk+iI?PS$EjzuRODJ-<wi~q__QZ411Qnz|CwinBwX at hTW%a2)?WC
zIbFu*zA5 at EHzSgLi{%}#LSZt;N*lTsfT(My2Pv30h+)9h?|TVl4Q7f|Q08qJuo2uX
zl$ta^3L?dsNd at N^YyvEN6wH!xF1;5SN~1iS2ue=X9E!fnhmiRJu8*<Z$wxJX?vPlx
zqO@;G`k7HShV_drXXjA=3ilc at ZC*#bB@T<vQI!MZ1kbX=INO5Yk7P$ZeKyvH`!X8T
zI6=(PDN{2mwv7!!Xy^%QXCKLnw^$0*e)3fE(~C^T65d&ZX7Hp`$;j0u970B>u$*P;
z0Z-5cF&^e2ZT=G7;H2(U6=DL_gI^{}SNj?dg8|^Sxt0p`cq^jwVM;7!Xjm8d4}Ns&
zKcd#kpeC&YrVPU?^63<(P>{Ui+6jp;gFDhm^1pecu3C8b+kR_Tdy{IMWKB?1fmzJA
zRrWbi2iAWJf`OWX5*Mgp>n7+MnqV+8M&DPEmPa?H%ZJ7^zBIqoh9?*U3kCchz3T<(
z{o=DphBZPs)&O&+xL<}PTrSUw at BBJF-j`J7B at go*T)LO-j{0ZZpPSq}+fSEg4@}1L
zZ8|B8jgb2gyHh2Popw{~EdhN#pk1m(0#ygca8F4f!i2@Brzr~+t!U)sEME!yD(7c}
zH<p^y$`^Do%eXFLgQ>IM`C5Sn4OHuPfASSw^KEK{5G&ZKT-udhQ|yIrv`02n2nEE6
zJaaj=cYtkxDp%*vn;v7!mw#(ERHUI8&%?XwWWwd<KpDk(zORy8V*vJGdJ4n9x6cKw
zfd*LCF)T_bQsEZ^g)LOAC_~c&_(PViw7 at Nx3OEp{ey=;vVhe)=`~fkT72CG2q9Dcy
z8L~9Qav?TpXuW14gRE?o5^+S7io#dEAR}0`65pC{WVViSDYVM%n&<QLfgr;B6o)rv
zTIb6}hLPs7#OGq}s~%}B#cV9lGRx);Rdk6gx7t&ilp$ilgyv0LB at Cu9KvHdOt8WNU
zRKE)Jmffi^kZ1~E;OK3djWI^Fpjc~Zw8H9AKhg7Hm~#E+7sc04Yv at z#YVE2vr`%0h
z0#-i0Nt+D*ywDBSwdR0Zq`4t^JgxPfRRm83TuXWye4%JX;j%9Ar})cG729R5bu8e#
zyFXy9Sgt5k3m1GHQhvrqBSebv3B8uXLOW`nQDR5wndp=soDn~pnVZ*3Y=R5Minq-=
ze;L<YU;KHO@o%%GB!`p^tto`v-d)0h^XuIi{>^?J-?@A*9kw-cvd2{8XJT$}8H$!5
z(CR70IjoaC>DD~Sdvbq8(GW$Ab&QVq<a+b~w99k=9&}6LFT3*KMEP01Q?{#*n~r?C
zvt-+rN33S#(1B3y<PPt=Wu3o8HQ=_wp9MW85HGf%H?)vfFc0`js*U>s>5qM-s&(pM
zPqqe9RFj;kYc-8w?^V+V%7{u54k`7Ve?+hh+r~`oRnKXVB3p_X{b-SP*}HtZ{G!PA
zYJH&DPN4_-LI0Qq?XoMhMUDvc#~1H5z9hRdmx!A;m8^?6m~Y-#b1hlP<)Eq8U>?U?
zbrG~tojEl{f3~|C?x{5NaaOUOJ;yJ2hOz;`4;z|OgBGHrpdB>_F3<8WI*%OHZMd3j
zy2oRMzZ)xk)fy^F3L0R20hg0paZ$rdG{I|!)H%|BW%n4OCnFJO{@5hlKEt@{ZF)bo
zm3&_P62l@ToZ9vsZl7rqgY|j&J=M}0aCXo$QWJ`uVjhB(*uS+H^UDM}9<dRkDnlc*
znAM;mGTO}Ao1UY|3y&UBgw?_ap9soX+%OBoMMb88N+Y<dHS*nr(I!;0QO8(LisB$V
z<!{@?<-<+;>(ER4+JpW&Q9Bny4m*?YQ~L|5 at IZr?xwVdan$7a%9{gv7nROdai@`14
zG+-^|Z})4_OtE~I#aE~AS0(LCtNXU(!?C{8pLWYD$$@TV2HsDljoVJZ)B}69$9)?5
ziNy=R_Yv5a^;<rYaG7BE09?Qz657Ti2c;I2FS5a)kV2poDVF{gnp}ioiqH at FhH&lo
zNh7nE#KPz(LINNl@EqXFJCTKeE`|_&iDZq5N7~ZwLyi}YDdrNHX}?ShK>THLpxNLO
zy{q2MTR&jkfAcY;d3}8rjNG3Cyi-4GYlGzJkoOXtWoKd{@;N{&Tdn at M?Y}BW7UX`*
zGLMt1)|BC45~;O<iG{uDYNd+R7zlyRioO0-GzLFjJh!_*Fra|clo*|^suLEj*rJ!F
zkIi$_N71d5nHQ`UZc+L*F}t3Z*Ccwat;B|pP|`48_exav-A};rgp-YxJ}bS&pN)<>
zYEbYSZ2{~+yv)QlkAVg?M_pjZ-!GCpjqn>zMaydQ%*lyE0`=2E_1o>1!sJ380i_My
zB})!KN8vNL^sR*WbvXhjt`v!TIljZl+nd*r_Ksa?e3=XQf1O-aR2;mzg<{2Bixzj6
z!AsHN?hb=%ahKw5#bL1GFgQgEgBN$VL0hCa#pd##a~|%x_wD3M@@21Y<s~o4TG at Li
zKvvuZRmC`t6i7fS^4={cls_z;u{+2QrjY^QMeFKzNuY5V$E^Or1}_&O4u*=0RhIMj
zPfa1o)WSIp2R)SrIdRH~T%FOUx*gJk@uA7DqTX{|<N+71#BcK$WWROSv$&%-U8mg!
z`C`id2GkcYkNkAQK`V~WxR)I#9w_!s5*&xmjKSJ1QZ`librtCu7f&f5*2so$+#Bf2
z4e;JKW4ueQbeXAH-j0<r^!2__bXa}kZ)_3OroSCU^l}_?!>V9+3{YvzBcTXYf<5#f
zw@nazWj_=%=H(>O2QSy at P=u8`{8`_bk}x;!P%>I-jlqoScuG}=Yua=oBl+#ICF~F+
znS@$6yzx^4vw5R$n+4Gep at PYrOxf{U!b#0SW0W|~0Cd`pg<Rvo4*OxzaYeP0>H+d9
z<CT0ieN&>HF2Y}rq%oV6;IeW|n{J_U0dOcSD`AWh!D^dDYCb*c8^ladlx6e8v=7}U
zpGCJ-DErivDK7O9PLYZ!KW$fh`Bl7Ghke)_A2^fB_mP3$@dtVOu4PdD;J9^%pt#r7
z9aUCSF at MAA8f69~*msmp;gomRMsbEyIuir9mRT;mS7@#2U>)4Yq%WOoTL5&hULy8K
z>kDnMX|3fn-RNuw(0Sen*8dtIY+Cz>5U7I^6VXeO{2jLdd$q><>Xl&1Vu0p7fs&1|
z$PbIJ`zdYzEI~m!7&#%G%tX&h5*}N*sl~^UqaR>nhk<lr{hTHXZ>NBS8AZM}wh=ZX
zrjv;)`|w%_y2#qZAId_YsddV+wJ2*du<$W+5t&FUFZk{rEi3ntr&SUnt|%1C=Jd5_
ze_<yanX6 at z147LHKx@j@TnwK7aynuRYD8{a33Sf1D$a1HOjlmEEBTsOo+Yh^|Ko^%
z#z20MgXKL|1u#y|Zpseh+BP9sNZlb;3yv@~@Ov0{>CF4u9zeMdmT+erqTwwyjqRMS
zXmyK_a6D!#O9m>R+q5u*q)F~4F&iq;iKuj7YDjg=gR!K0M at 3p&cI+#a>do7bc+EFf
zp}{hAArKj;X%SHZ6D9Rz4`|SSmahv#VAGy11cXaX)Mt;d8M1&}1|-hAvZVNiXA6o<
z6cfy5!JL;QBlt}Ru*oAMLs~|FY5`ga72TPzIc9tZFpU~37kdem-*}k9(J*PIpJJ^J
zsSU)i+YsOesy~Wy%t%w6zMqz(_qC;@@v>^vIJuyqXhxU}irkNHR{VlcZHy_J-_{`!
z{(i{Z^`o?+;-T}NH3_eik^=@7nJ{&KH>NC>I8$+d06Es1h|Pqo^o{1;)^}_EW(|57
zyJj+53*y)m6e5F~AR#?Ia_O;t0+cCf at _;lqd9@>cWM%$cNkbgsDZ7Cp`OsmBv5a<U
zjh^{aGIUo4i-y!0T=1g3w9$iB8CV261F0G%lg>=TQADA0^??l-fO1^j=fqzmv>$Ik
zsF<+b%&B*pk!HX9Wifnau{En>S<+**we#g+tIq++C!fFshl@IZ%_AS&j%yNkj=w#j
zV1zL4>BCBv?8m!_A8vU5w_+jRJAUa*K$Sh=>u;o)@%gZm(Hl#>>H9yA=VD<p@r1Rd
z>eWW`zerl}&-1icy~%Cs2WRZT1JiK;)SUZQ>Vwq?HIZ#4y{7%`Ht at uU9-2mT?U8mz
zC94OXy-c}dfYYZ at TnK!7OnYwUnU#=S)k-Tj1Py{Y_*g>!$igUn_8Hg?Yd`YAZ|<hh
zk~N=8h?1_pr*6E4d9TU>zO)ET;+xY)CD|&4M8hSGJ5rwlLozN)`xJkphmTWhnkH7R
zp|GN?8<bnBp;)ahkVscbCR7;QM!t_lE8kzXl={MGio#(UZs0#}ScXhYD&vDw7yAHy
z;1Wl6l%nBSxH3Wb;2jNP!5 at sLiaK}~M&FPvTgpw^zf?p2F<tcN!h2T<sXv6B_`}ck
zq|uwu9pKSt;s+j3OlaNU+o2^T9))uOl5t=Y1ZbT<U@kEFYicx8UxzC<pXepzVaI})
z)n{JDWYpe$bp>6tSl;KdX2OoQGhRYBxMNYX at MpSn5D7F}DSPf1*q`Ib#*a4Jg at qHh
z`7qyVkKaMCcRemWNY651aHvi)D<vKqkvwl1p<meSi&(~-=)zFH@IDQaI7VtC`hZoZ
zq;&+xoxe4EbjNODw&HE8CRyV6QCTwD&RXY{f_q#{hWG;yvo%}$YL8BRA0h1o5KK*O
zXD3rjd>t;N!*0nRH%gv3csv7=?{>O*|2rMzztJ4FC53iHh~I24S*ZN8u3B45qTO2k
zV#a%<aCGQ#Wan|7k?*UJ|IW?bBFS}!^|`1$gTuL|(_JODa-|cXMJH)anre2(uEuqy
z${k#Ws8<}?5mj|d-F)cVG`Qp8-~37TJ8B|MiCI&p^uZT?;hIgoU1@FM%YA>2-hio?
zIFEIohf8EYWRDv0QIK6XdRv9JD+t>+-4?eH^&08HLs(EaIj}>ufdPG-&FK`ox(hP)
zSX*Zqbos^?mzT7`kU=2R(_sFto#;e1-jS!3{wMk2OMcoJ>~6zIk%mvT-Jh7Kvbt$B
z8|rO?J^g2Xr^H3M{Vu`P<)l*|Vr*E1X<+$j`p8kgt6ScMbN952xjmdzc;`Uu<QHf4
zl~+TX!1`0?ucVcQ&IRAQq=}Km!mS9OlBq@0VWTPwxEavR`#bgV!0ScvE>BmU19zH1
zdQm<7)we%}!ruutZS5wmd;bx?EJ416t*z8Mi{3Jr!!9It;_W3U$&c}W?2NupfPAbz
zaEvS>tF=;!K5Ao~-wL{`AaKW`2vX9W!v);+3<v!_qH4;)NV~`;e`*3LWP>Ne%UcVx
zb;L=lm)%rYtA=x^cwa at f^IsmG_fHBMF!yLCJ+BFOHR>7stJd)?=Nxz%<lP`F<7F6i
zl(Ho9v=s6I2a&Xf0<qVjc%moSjV*_;&?jyU+`ZB>8iP-Ve6eSZD~t{%G|HvhpWj*;
za3=~ov&HyCmD2vW$N+mUE$10$G3&6M?QY&iR^o`>Vh|lw=YCxOOE?w`X@(U<9Y7~6
z)Fcq!<`YOUk`P*#e17Azvnu6Onjf2;iYsll!t!`CbngkGOAaC^m4^RW((d+S-n)L~
zTM!mauKzQ?74*h_S1<vmr>@6)A_2|}RmHj8#A&~vV*Vg at W*Y<^Q_2%(ZD@hdlKyCe
zl)xetJ8!pZ#}qf;Cj>*iNq*>30qx?euIoKYV8uSrbVuX;KB~UnQ#KvGL+w`BNcSS1
z;U~2{1T}vKDOh?GjZqA^@8P+OEsh={qVYmQ$vY&4jYp=IpNGGesr;aBWx6o41JoSQ
z(}BH4cv2?sB~?BFm6;E1bvk7aC#n*P%Oi?dG5L^1-hlm5(P&r2+cnG+!{_XV`;L8<
zl|p)Pedy^d3gl4Zq{eg%;hsN&<yB-qP%*JDx-dYQv_c*-)yQp|O~sa@A@qd80>VW1
z*YjjpggMwY-|~3Adr8jW^cl at Ov{4xMvHHP;dHlW{U@^uuI}B#!zEBT+oebadmu;(T
zo?I5REG^zcKLB?tC^&z^j$_l$2Lu>djULQa(#{(k8C0 at jcH@Y5plQC>XSdZR<%2Fn
zC1CnY9?x1zI at i<LQ@m?QRaFCg8bH71r7>^uFuX5uMtLaq!#%??TkQR2I!ifI;x}j8
zfr`BP^Q6sA8vDu}yITqBe`9jn(s4p+U at XAi4YXGwT!~ej6K_%!Fo)U1FJx5?IX7s?
znI|z&$~=$$T+LNGw at LY9(K6|S?R%;K9(2@!slJPxmJQWG-*CpPI!DGkfnTM3=U`@k
zo*N7*koGrw`pli4^pJpjgSMLFVm&}>!aSM4cPn7hzsL14QkK>UK(EW*q=T~B>6G2r
z3kc0PU=Gmf_i1!^$IwY;XsZc*z39uQZd1T0?3v{XK|jR#Tw at inoudHrzw!~8x`ZUL
zP>9mhb4GJ95$7l35USY0dK*R}JR4u>ysHdTTaV{r`q%*N4gv7}Dp8PMMD8}ve;U><
zz?5tAj*Jp><IN%YdB8 at cm3jxX9*mppISr~d;tk2{_{IB?(_%J4+iwPWLW7@J_VAYL
zzdJ+ZteN4DN{i_VlbhK-Ppe=T&+r+1hx5qxl(|W?sBMQw=h7sewyaRI({(_eSk4<;
z`Bh}Gu})Q+7wA<cBygT$NEPbl#?A3U^Fk9K3l<q4HRljayEgA*#Nkrbh%gU3hN$em
zPucOG6oHlBnNr1wzDFxK_wh3}^r95;j<fX$*qk{H%6beur0}K?J%93#EZ#HsUUlmX
zCvMC0cRVC&7=A1sW)c_WZlhXii{CUwErjM2`T8?jf1<sH=Tx>e1)7Dm#5|^+uIQ)R
zX62|+|J^j_h#O};zES66?fadp5IKr-?2tmw=@pHfATcp)iM6Rfhw?q^hF;g%B>Ngy
zio;8u$*OB7`R;LZ8jGhZ+?gbNu(sYs<hh|bmbY{K;N*kL<Od%8%}u=IF69X#MV;qL
z+QUIFpOZ9=kfclQW6E9_B{Om^e5D0i-uxVg%-U+Pj$+`81*I#9GMEux<W9CsnlD1k
zn7%enEHH*A&~I37UC<en1fA}f)b*k$QY{?{{&i4%_PJsMq9n4~{0rC1CGnHUPnuuK
ziw|0M=%KfWDSpsigScFy!0PBq<YuYpAc7l;3G(_fS1<}+T`>cLxZ<bt%BXGvu)SmG
znX2o;X+a%wa9G7({6BvKi{r!*K=hl7MV_>v$G)#thMhWlfXW2Q$W_rJ(Q!NDXH0+x
zQ<!jQ;88~H34Bc(d2W+-QGOZ|#FCQ*l>3s->rPUy=JY3Vfy|$uMz(uPW}@g0hNlv$
z8ijAn!zVyZm6Y}Z3dOh3D#DU at xDFGReL@V#ku=QZMao^QT&DAIy!9<RP@~8U+%)@q
zVkwJ4LLwV=RLDq9_{*r$_FzdGgK3W-h=qmW$65GyKEm5=t>xSy^UP-`SW&!tYS7JG
zFuK6m-6-0VSp-+>X2;maXQ{4IlvcA2;7P8*nSegnv|P;nf$F9NvbhM?*;a6o)S^Gb
z(#qjN-*PB$lw~&sFU;|DeLP1Jbw(%3 at f$Qif%2~O;`X-ZWzTE(*kP+j%s0<2)Gc{o
zZK-afhs+SDT!8Ina4zgiAp9*+$_7H7)cTEKJW8+e^gJKxMz$6cypGY^89fs|HazKi
z9n3p~+HR|@$_yMOa9sUnF;{1K)uoFj5JlS{O;LE*{bHusUdI3Tf at H8^QTqikAog%~
zKpdW at gb&u4i17=8{|9yEsYL~NCnUb3#Jq@Qp#7zhik~?7U0OP-<_c7yiHiuw$`g5h
z4Dk+W4~Sojj=p;}luTuL6Lg+6F>9i|YRt#X8cuo(eUrk>Z>~;aJ7ZEaCnWA`MdBc)
zf<hNND~}u*o2Xd)Iri|0H9swb`LbSWn2cDSh0gA+o%>cc&Z3TO&v%@gFl5^ijq;B^
zvz8RN(2l6Y91W9g(>MrZChD2F_&#rCv~!<f45JT6M}OHkUN^WVXTJV^{V`r3C9l0(
zr3a_1_2aelWao5ys`qZW$Sl%_pU=?0-NJS3ApDa`^LG;=z>t_Y<!og5^sFzg=y_9L
z4Q*po6iL{|iHL<GG9-zr)%V!Mm$b;e2U>mXK2dn;Sfp`KiR*b4t{fjQf3Q%`r#62E
zj5SJx>6Fh)rVp`o2&;!MR!DuBI_q1wKrBVwev-|v at UfT;AjKp)rCR(I^k*jgDeg((
zdIc?W4ny#lvCc_WrNwMjR|zJNNMLrso)T%|FFxc4pSXieYJ+Job9`0RJB;*H!b0G7
zyjcJul}ATXgRQD at Yuqc@Nx`3oT8^GKT7Y2wB1^J~i?05JS~|{5gv0O!nY8;jhq0iY
zVPoNDo!<0;UZgQ{97H7O8$7r_f}$GyC*2ad(Cb5O_SsS6e2xlbCFI@169mKacNBKf
zncO?#D0m>Z?KHU#0TyrHUQLXd?I=E6L`*<Nz{R)&V^|S at lZo6^n-eRj%x7Xwle&*T
z{OEfJad==KTsS)DNLC@yY)&opBP2c#6`1|dhksAi^QACjV`HPU^3JTXqh9CSkNrs{
zbPLk~3wrTjRiiX&jsE@#R3YeFEL7@&5r7AT7_SxXaO&}Oqo1dq8G3{QL|mVl`#1}H
z_i1Y&T}N+jC4;*6F4;S%YhEfkbFCo6Y?pEdlkbFYnuatv{P#X>jy4f<!LT_BWAOgt
zr)Xy7YV-ipR2A)=&_(wBiYbX3c_o_X$Mw*=00Y!`>(hrAVIealGr`&NqObgCPsaV$
z8;05!V_^4BID!xGSMV_+$cnGE^*&HvV`wNmYWa_4B{2+)8oakTZumHz++1AiUv>v2
z#nF>*L#C+#6)*VlrjjSHLTcbM41+%nJ9?1D{^dNxjG)t8k0`ncWIu at OM^XynqfH0G
z=WwG`Md9|NH0e)Y7u}<yL}vTGQ5YwnxeaDb))}a~gE>|NWi1mh^%BJSW&Nd4yG7L!
zA at u}#ogp?Nh4ArWVO%kyr}loh$H1|nzQ_RWz(EfYHvCCq4=quN)z(Gd%sNZ1qRFGv
z^hc><PfVFevc;BWBCr&^9Z-@SM<cY6>BnG`qrT+|>4Uw)fXDcX!5DHZN5M4o<qhsO
zLzdMCJX{+|BxW;wB<dR2XEhr6LzpT|0)C$bUW2SI;Ggp{n-1&ei=@A&E`cvWv4pck
zhq4TPj)!H9X92nL&HaXJASaNgh_Yz at h=e5Nn2Cr}+)nIA<Xd8LO(9Gne4%nzH@EMu
zp03?cENH=x=lJ178-#ic7t(VUan>Hh9*!Q7CqcvjL}A1_)JxPVR25u2+)p?i^lS|4
zjQzB!bd8Ey${wkDsmttcR2Kpl#CSw_%6N}-o^&?yFDaL)RVk|sp31*snxmUTn+rX1
zuLX`#W=*Z`t%|L_j&!B*r;5=rQZLcp$!;nKg+9Uml|yqxGeC1j^F_la5N8H5Q>wdb
z2p1WZcd5uoTc?ikYU3_oEdZ)=wYDl{Dm^PsHT{bw%L~eaR3K8cGL})_vJVJrMQa6D
zNmp~5gOA&f#-}&RAC)+jT~aqW16dJJ!<{1SBRwNC<AvhANEk^}xl(xat;Q^JfE`mx
z<7`8Yaez$Uu)kzi5=8JshHUg~v~1=2CJm|J*e3g?4q&aNu|?q2P#**2Ah9;?6iozP
z1iMqr>-+ at s#0J0xpc8U*({ev?ecGPiyM}y+{LPI^Pz?Ji3a8#5efn?b(KWc-fBU|^
znzO>c4x)cqC;rQm)MvF;V?w20k|d9a4=;gCLFjI~FAkIXegCKr4lG7?rbLS=Ln@|L
z3$L)>=Fje6xLl#+7Nq=-S)MTw-AEsaotO9R?|`NzO}OzLB(ed{M5IYv+ZmE2)-yjn
z2;LdNB6l201nn}Usb78XPvsv(=a!oOv=Mt%G*z0SZdP*I7d0QUxQDKO-T~4G=ztAc
z at B5-Vu`Zg*ttfNbRp&NiZ?^jV+^<Um45H05gZ$*n6|^Cta*2GY^5zj0{cXrzuAxLr
z#+M=kVOt at iW5`D0L&;&B-r9BAbrh4CR?Zg(hfGD$P6d9^2;^zHrC;O7qCN)ZiplM*
zwVTW2rCQi%_%UyPDbHNdC8@sAwDXnz-G&vP(xd5%U3e~*-3KmDoj*G5srKYS&`aGS
z^~lnL8cC*AVcMgqBxt+2N5tgnWzY_<&*{OS?8Cv87Yl0Q44uY7`vQR?V=Yrvk`uwu
z^y5aU!(uWFo)z8f+vl?Elo8&ju5q3zHlA>p<pFxaXmrFs9<NRd+DqxyaI!lqA!eZ)
z8?~Q%uNIfzUaf3wyon8AV)62RZRXzI!=V!Wg`oS1+wr?S6J7_P#8e-@gRrG=$<!9Q
zu*@N>KthCKh^v*imA8R6#*MAthXKqK*C3<_ro+!3&|sV3VO#qfx35<~sF#wVm#wXr
zv7ndFub0-Mm+PsQd81c|xtyG^oTa>+{`$UVUrwz(!b9^**P7>RzFx_3TK;;vTtKm$
zGI}yV at QugpOa4lP@k+wRO1RicT=z;;;7ZanAOryr9S->N5fBdngwX<GO8}9UfJ7)D
z6dw>{r(}c7_!*5CkfA>g#46{`oCAdW=8fv-O$1Et7)?S0IJTuYb}cw|G&rE{b=#ln
zcJ1qS4C<hM&fBuiyFlk19cQT5*|y5ruJhTB$r&_=a{B}2t~uq7IwjPtU|XSJ*REhk
zzX0lMvMpn>Yi+WlZDI*ue}(LFN#t^cb$&^Ceg#i;iA!~bT6jrXc!gwoNoab7xphgg
zb%h{ti7#=5-h273_iFgwj`wgXy8!hHIC13FsTn2m{qdX#eajU}<UGZ`F;=@V<h0Qv
z;@dtr;#!^J7Vi7mCaI at F_FKI3sd<8_eMbourB6&~Cdum*g)JJey@P;F<#P|pt$Y2u
zv|ucA;JmeX?e$>YW!4kITQvWO?tT;Vf8g(x{~xTU8MmMO%erSx?CP6!SO0-5{u$k4
zCf4<hx+~Qu+W&&9CQjw8nroG(^IrBME%~b|mgN^F3Ee{`mh}xw%MK^}w`Bgc-HRp;
z^({-Q4yP@*2LFOvCjUEvm*dV#9*@K!R9pSE>#NV_{<R`qa@SPPa<G};|2}QV-OU7g
zQ2n1&-dYYjl6XjZDfw>_?ECrJF}4UgOzZ`I+?ZFg9Uc||hEIS~1iw|&Yk-GO)NhbQ
mX4Rts<LE1b2{c|8A^H?xWL6_ReJ}y*KfbXV2YPjIaQ_1m_8C<G

literal 0
HcmV?d00001

diff --git a/docs/footer.html b/docs/footer.html
index 0a555cc..9f7194f 100644
--- a/docs/footer.html
+++ b/docs/footer.html
@@ -1,5 +1,5 @@
     </div> <!-- /container -->
-    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
+    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="js/bootstrap.min.js"></script>
     <script type="text/javascript" src="https://www.google.com/jsapi"></script>
     <script type="text/javascript" src="js/buildroot.js"></script>
diff --git a/docs/git.html b/docs/git.html
index ce86e16..8903975 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -1,5 +1,7 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
 
 <h3>Git Access</h3>
 
@@ -39,5 +41,8 @@ Because you've only been granted anonymous access to the tree, you won't be
 able to push your changes to the repo. Changes can instead be submitted for
 inclusion by posting them to the buildroot mailing list.
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/header.html b/docs/header.html
index f37759e..98f6ec5 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -3,7 +3,7 @@
   <head>
     <meta charset="utf-8">
     <title>Buildroot: making embedded Linux easy</title>
-    <meta name="viewport" content="width=device-width, initial-scale=1.0">
+    <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="author" content="The Buildroot developers">
     <link rel="shortcut icon" href="favicon.ico">
     <link href="css/bootstrap.min.css" rel="stylesheet">
@@ -14,21 +14,24 @@
 
     <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
     <!--[if lt IE 9]>
-	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
-	<![endif]-->
+    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
+    <![endif]-->
   </head>
   <body>
-    <div class="navbar navbar-fixed-top">
-      <div class="navbar-inner">
-        <div class="container">
-          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
-            <span class="icon-bar"></span>
-            <span class="icon-bar"></span>
-            <span class="icon-bar"></span>
-          </a>
-          <a class="brand" href="/">Buildroot</a>
-          <div class="nav-collapse">
-            <ul class="nav">
+    <nav class="navbar navbar-default navbar-fixed-top">
+      <div class="row">
+        <div class="col-sm-10 col-sm-offset-1">
+          <div class="navbar-header">
+            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#buildroot-navbar-collapse-1">
+              <span class="sr-only">Toggle navigation</span>
+              <span class="icon-bar"></span>
+              <span class="icon-bar"></span>
+              <span class="icon-bar"></span>
+            </button>
+            <a class="navbar-brand" href="/">Buildroot</a>
+          </div>
+          <div class="collapse navbar-collapse" id="buildroot-navbar-collapse-1">
+            <ul class="nav navbar-nav">
               <li><a href="/news.html">News</a></li>
               <li><a href="/about.html">About</a></li>
               <li><a href="/download.html">Download</a></li>
@@ -42,6 +45,5 @@
           </div><!--/.nav-collapse -->
         </div>
       </div>
-    </div>
-    <div class="container">
-
+    </nav>
+    <div class="container-fluid">
diff --git a/docs/index.html b/docs/index.html
index f5c0ea7..36075bc 100644
--- a/docs/index.html
+++ b/docs/index.html
@@ -1,33 +1,46 @@
 <!--#include file="header.html" -->
-
-<div class="hero-unit">
-  <div class="row-fluid">
-    <img src="images/logo.png" height="170" width="170" style="float: right;"
-        alt="Buildroot logo" />
-    <div class="span8">
-      <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
-      <p>Buildroot is a simple, efficient and easy-to-use tool to generate
-      embedded Linux systems through cross-compilation.</p>
-    </div>
-    <div class="button_column pull-right">
-      <div class="btn-group btn-group-justified">
-        <div class="btn-group">
-          <a class="btn btn-primary btn-large" href="/about.html">Learn more &raquo;</a>
+<div class="row">
+  <div class="container" style="width:100%">
+    <div class="col-sm-10 col-sm-offset-1 jumbotron">
+      <div class="row">
+        <div class="col-sm-9">
+          <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
+          <p>Buildroot is a simple, efficient and easy-to-use tool to generate
+          embedded Linux systems through cross-compilation.</p>
         </div>
-        <div class="btn-group">
-          <a class="btn btn-primary btn-large" href="/download.html">Download &raquo;</a>
+        <div class="col-sm-3">
+          <img src="images/logo.png" class="center-block" style="width:170px; heigth:170px;"
+          alt="Buildroot logo" />
+        </div>
+      </div>
+      <div class="row">
+        <div class="col-sm-offset-5 col-sm-7">
+          <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-primary btn-lg" style="width:100%;" href="/about.html"><span class="glyphicon glyphicon-info-sign"></span> Learn more ?</a>
+          </div>
+          <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-primary btn-lg" style="width:100%;"href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span> Download ?</a>
+          </div>
         </div>
       </div>
     </div>
   </div>
 </div>
 
-<div class="row" style="line-height: 17px;">
-  <div class="span6" id="commit-activity">
-    <a href="http://git.buildroot.net/buildroot"><h2>Recent commits</h2></a>
+<div class="row">
+  <div class="col-sm-5 col-sm-offset-1">
+    <div class="panel panel-default">
+      <div class="panel-body" id="commit-activity">
+        <a href="http://git.buildroot.net/buildroot"><h2>Recent commits</h2></a>
+      </div>
+    </div>
   </div>
-  <div class="span6" id="mailing-list-activity">
-    <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h2>Recent discussions</h2></a>
+  <div class="col-sm-5" >
+    <div class="panel panel-default" style="min-height: 22em;">
+      <div class="panel-body" id="mailing-list-activity">
+        <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h2>Recent discussions</h2></a>
+      </div>
+    </div>
   </div>
 </div>
 
diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 55e5eb3..03c3968 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -11,17 +11,12 @@ function load_activity(feedurl, divid) {
           if (entry.title.indexOf("git commit") != -1)
             continue;
           loaded += 1;
-          if (loaded >= nb_display)
+          if (loaded > nb_display)
             break;
           var div = document.createElement("p");
           var link = document.createElement("a");
           var d = new Date(entry.publishedDate);
           var data = '[' + d.toLocaleDateString() + '] ' + entry.title
-          // Ensure all titles are the same length
-          if (data.length > 60) {
-            data = data.substr(0, 57)
-            data += '...'
-          }
           var text = document.createTextNode(data);
           link.appendChild(text);
           link.title = entry.title;
@@ -29,6 +24,10 @@ function load_activity(feedurl, divid) {
           div.appendChild(link);
           container.appendChild(div);
         }
+        var empty = nb_display - loaded;
+        for (var i = 0; i < empty; i++) {
+          container.appendChild(document.createElement("p"));
+        }
         console.log(loaded);
       }
     });
diff --git a/docs/news.html b/docs/news.html
index ee2e9c4..2f1b168 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>News</h2>
 
 <p>
@@ -1314,5 +1317,8 @@
 
 </ul>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/sponsors.html b/docs/sponsors.html
index a1eb0bd..4c47e5c 100644
--- a/docs/sponsors.html
+++ b/docs/sponsors.html
@@ -1,146 +1,149 @@
 <!--#include file="header.html" -->
 
-<h2>Sponsors</h2>
+<div class="row"><!-- current sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <h2>Sponsors</h2>
 
-<h3>Current sponsors</h3>
+    <h3>Current sponsors</h3>
+  </div>
+</div>
 
-<div class="container">
-  <div class="row-fluid">
-    <div class="span12 sponsor-main">
-      <div class="row-fluid">
-	<div class="span4">
-	  <a href="http://mind.be">
-	    <img src="images/mind-logo.png"/>
-	  </a>
-	</div>
-	<div class="span8">
-	  <p><a href="http://www.mind.be">Mind</a> is the Embedded
-	  Software division of Essensium, which provides consultancy
-	  and services specifically in the field of Linux and Open
-	    Source SW for Embedded Systems.</p>
+<div class="row"><!-- main sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-sm-12 sponsor-main">
+      <div class="col-sm-4">
+        <a href="http://mind.be">
+          <img src="images/mind-logo.png"/>
+        </a>
+      </div>
+      <div class="col-sm-8">
+        <p><a href="http://www.mind.be">Mind</a> is the Embedded
+        Software division of Essensium, which provides consultancy
+        and services specifically in the field of Linux and Open
+        Source SW for Embedded Systems.</p>
 
-	  <p>Mind is sponsoring
-	  the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
-	  Developers Meeting</a> colocated with the Embedded Linux
-	  Conference Europe, taking place on October 11-12 2014 in
-	  D?sseldorf, Germany. Mind is helping with the logistics of
-	  the meeting room, as well as the Saturday dinner for the
-	  participants.</p>
-	</div>
+        <p>Mind is sponsoring
+        the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
+        Developers Meeting</a> colocated with the Embedded Linux
+        Conference Europe, taking place on October 11-12 2014 in
+        D?sseldorf, Germany. Mind is helping with the logistics of
+        the meeting room, as well as the Saturday dinner for the
+        participants.</p>
       </div>
     </div>
   </div>
-</div>
+</div><!-- /main sponsor row -->
 
-<h3>Past sponsors</h3>
+<div class="row"><!-- past sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <h3>Past sponsors</h3>
 
-<p>Throughout its history, the Buildroot project has been sponsored by
-  various companies, that we would like to thank below.</p>
+    <p>Throughout its history, the Buildroot project has been sponsored by
+    various companies, that we would like to thank below.</p>
+  </div>
+</div><!--/past sponsor row -->
 
-<div class="container">
-  <div class="row-fluid">
-    <div class="span4 sponsor">
+<div class="row"><!-- past sponsors row 1-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.mind.be">
-	  <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
-	</a><br/>
-	<a href="http://www.mind.be">Mind</a> sponsored the dinner of
-	the FOSDEM 2014 Developers Meeting.
+        <a href="http://www.mind.be">
+        <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
+        </a><br/>
+        <a href="http://www.mind.be">Mind</a> sponsored the dinner of
+        the FOSDEM 2014 Developers Meeting.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.google.com">
-	  <img src="images/google-logo.png" alt="Google" title="Google"/>
-	</a>
-	<br/>
-	<a href="http://www.google.com">Google</a> provided the
-	logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
-	Brussels, Belgium.
+        <a href="http://www.google.com">
+        <img src="images/google-logo.png" alt="Google" title="Google"/>
+        </a><br/>
+        <a href="http://www.google.com">Google</a> provided the
+        logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
+        Brussels, Belgium.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.imgtec.com/">
-	  <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
-	</a>
-	<br/>
-	<a href="http://www.imgtec.com/">Imagination Technologies</a>
-	  sponsored the meeting room and dinner of the ELCE 2013
-	Developer Days in Edinburgh, UK.
+        <a href="http://www.imgtec.com/">
+        <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
+        </a><br/>
+        <a href="http://www.imgtec.com/">Imagination Technologies</a>
+        sponsored the meeting room and dinner of the ELCE 2013
+        Developer Days in Edinburgh, UK.
       </div>
     </div>
   </div>
+</div><!--/past sponsors row 1-->
 
-  <div class="row-fluid" style="margin-top: 1em;">
-    <div class="span4 sponsor">
+<div class="row"><!-- past sponsors row 2-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://circuitco.com/">
-	  <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
-	</a>
-	<br/>
-	<a href="http://circuitco.com/">CircuitCo</a> sponsored
-	  several development boards for the Google Summer of Code
-	  2013 project on Buildroot.
+        <a href="http://circuitco.com/">
+        <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
+        </a><br/>
+        <a href="http://circuitco.com/">CircuitCo</a> sponsored
+        several development boards for the Google Summer of Code
+        2013 project on Buildroot.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://boundarydevices.com/">
-	  <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
-	</a>
-	<br/>
-	<a href="http://boundarydevices.com/">BoundaryDevices</a>
-	sponsored an i.MX6 development board for the Google Summer of
-	Code 2013 project on Buildroot.
+        <a href="http://boundarydevices.com/">
+        <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
+        </a><br/>
+        <a href="http://boundarydevices.com/">BoundaryDevices</a>
+        sponsored an i.MX6 development board for the Google Summer of
+        Code 2013 project on Buildroot.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.fluendo.com/">
-	  <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
-	</a>
-	<br/>
-	<a href="http://www.fluendo.com/">Fluendo</a> sponsored the
-	meeting room for the ELCE 2012 Developer Days in Barcelona
-	Spain.
+        <a href="http://www.fluendo.com/">
+        <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
+        </a><br/>
+        <a href="http://www.fluendo.com/">Fluendo</a> sponsored the
+        meeting room for the ELCE 2012 Developer Days in Barcelona
+        Spain.
       </div>
     </div>
   </div>
-  <div class="row-fluid" style="margin-top: 1em;">
-    <div class="span4 sponsor">
+</div><!--/past sponsors row 2-->
+
+<div class="row"><!-- past sponsors row 3-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.synopsys.com">
-	  <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
-	</a>
-	<br/>
-	<a href="http://www.synopsys.com">Synopsys</a> sponsored the
-	  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
+        <a href="http://www.synopsys.com">
+        <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
+        </a><br/>
+        <a href="http://www.synopsys.com">Synopsys</a> sponsored the
+        dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.calao-systems.com/">
-	  <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
-	</a>
-	<br/>
-	<a href="http://www.calao-systems.com/">Calao Systems</a>
-	provided a a meeting room for the ELCE 2009 Developer Days
-	in Grenoble, France.
+        <a href="http://www.calao-systems.com/">
+        <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
+        </a><br/>
+        <a href="http://www.calao-systems.com/">Calao Systems</a>
+        provided a a meeting room for the ELCE 2009 Developer Days
+        in Grenoble, France.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.free-electrons.com">
-	  <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
-	</a>
-	<br/>
-	<a href="http://www.free-electrons.com">Free Electrons</a>
-	sponsored the lunch for the ELCE 2009 Developer Days in
-	Grenoble, France.
+        <a href="http://www.free-electrons.com">
+        <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
+        </a><br/>
+        <a href="http://www.free-electrons.com">Free Electrons</a>
+        sponsored the lunch for the ELCE 2009 Developer Days in
+        Grenoble, France.
       </div>
     </div>
   </div>
-</div>
+</div><!--/past sponsors row 3-->
 
 <!--#include file="footer.html" -->
diff --git a/docs/support.html b/docs/support.html
index 5fa3cde..c49a371 100644
--- a/docs/support.html
+++ b/docs/support.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Support</h2>
 
 <p>You can get support for Buildroot through three main channels:</p>
@@ -42,4 +45,7 @@ participate to find solutions to existing problems.</p>
 
 <p>Note: patches are only accepted through the mailing list.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
-- 
2.1.1
