From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 20:51:09 +0200
Subject: [Buildroot] [PATCH 3/3] Added quick and dirty packaging of
	lua-msgpack-native tested on x86_64 platform The patch
	includes also the source (mp.c) of the lua-msgpack-native
In-Reply-To: <1344192669-29968-1-git-send-email-wzab01@gmail.com>
References: <1344192669-29968-1-git-send-email-wzab01@gmail.com>
Message-ID: <1344192669-29968-2-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

From: "Wojciech M. Zabolotny" <wzab01@gmail.com>

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in                                  |    1 +
 package/lua-msgpack-native/Config.in               |    8 +++++
 .../lua-msgpack-native-0.1.tar.gz                  |  Bin 0 -> 7395 bytes
 package/lua-msgpack-native/lua-msgpack-native.mk   |   36 ++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/lua-msgpack-native/Config.in
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native-0.1.tar.gz
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk

diff --git a/package/Config.in b/package/Config.in
index 42d0718..736b0c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -257,6 +257,7 @@ source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
+source "package/lua-msgpack-native/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
new file mode 100644
index 0000000..3ef794d
--- /dev/null
+++ b/package/lua-msgpack-native/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_MSGPACK_NATIVE
+	bool "lua-msgpack-native"
+	help
+	  This is a native, C language implementation of msgpack (http://msgpack.org)
+	  library/protocol for Lua language
+
+	  https://github.com/kengonakajima/lua-msgpack-native
+	  
diff --git a/package/lua-msgpack-native/lua-msgpack-native-0.1.tar.gz b/package/lua-msgpack-native/lua-msgpack-native-0.1.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..70d49a47ea91c909d58eb76bbfcfc66c061f5cd0
GIT binary patch
literal 7395
zcmV<9930~xiwFRVwH{Ca1MNL)bK6Fe`MUZQW9?c+NTAG@s3%n=$4b_9jO?=I+uL$n
zERY06oFR|}fO^Ey{r2mg_Y4LkBssZC9g&Jm0zEz5J>5M$J&j?!2<q3_)jSw|ttUYq
z-GueVZu8X--}7oT8m;}kJ^Z)1zt_<J71s~VR->`M*KX}~TR$|K?Y(yQ2eS8FsVKP?
zSstW>{BZkQFkA+=>iJ*virwRXJ>MODw?1%yyPZzS`0ww*xbyLEw%Yq$82?Ti$G`F2
zC|Gj+KOg_UN69E&j6-sg<>P3!J3ZY{x2}VHYTn86G)k^A*G>E0IF5$qy&%iNG{<}T
z&2%2Tijt7sR}VHpGk2$(`i)?5M{#Zf*f^X(Ba-B^X&l$?JW|8|7EzLSJA>S-(Fgoa
zyM=dZcjV-Rv|AoIJ*EG6p1AQl5#Sp99ft!z;;9~|`7B{Q%D&aZU)~SSFV0@~&j)YL
zUw``f{fD;~m!yGQO`OlPhU#W*cX!t#lQ{@ApVSCQGE7sS3<m#sHaPq6^T)ve==pmX
zXW^3O0FaEM$;L*0KMw&4(4>n|PQGmrxE4tkT_xd|jHaOc;~)<{Hyf?aHvai?OhK~f
zw{Vb?MHY^a$*Wfc%_Jw2baqXC3)7hnGYY_cMEN~y2vidw_;}-iT+eTZi^(8ARuVe@
z at ZsHu*KaQeuRr~C@veXV(<NyZAAY<9PJZs6UyxSu;pM;IpAY(PfBxs?r;q0!-ke>Y
zkxmKJPoFM+ynOraf*h0pNDR$x3B=_;Kb)Vv0YxaoaPc1(@BVc`x}8e0-bP_lfu><F
zCLo?k2qQ29p-qFEkmNHG#PMtt<RO2!tBZOz$&BHN!^9!=R7hP60J$2lk8CKxT4U&H
ziX?>N7i44OW)_Xba79U!*JR7>p~v_b)=yCxdW~c8Rg637QF3OJ8r($wJP86MVS at +J
zL8^6-iVl1-nk89oOKR?GToOeE_5fYh4DfAlE;~i=o)Qh*0kLUxOQJS7e$H$hPF#$q
zVZKNcgW<Z624ay&QVmI3iUg^vbD}5_Tr`7pG at IYo3i=Xexo_UwMk`dp5u)MWBgW@s
zmewL*GdhWnqn#ZNgBN1_9M_|I^GgpgeU7-vKNLk0%;(@obfJ_CRz3^HV?`71E}|*{
z^7g)Q0W^*u#1lj8L+>QkXk at L(?>&dZIF?WnCnq2OUWeBs6r)g-9WhisVKl}{JMlKz
z0aZEH$0){8p$1C7VrT?l$k{GwklQJYAJ8 at f!vvq0M<Zg24B-b!6ifb4YGRB`sWIt(
zhH>~t8h4`xc{oNOofvZ*hCch?H$AF(rTq_Qvp5VAg9e{EiO6&MB}vM$7 at kNQ4*s<9
z1?&n4ZF7MWoP<azSW6$5=kb#)u7_c2u>%pp;DSCN;2)f90r2PM&cPSkX`=m0J&eF1
zPHKrqbOnTlf{!8fn&a7G7>5!78YZU=t%YdSWUclm$Aw2N_Gr>jj|wuh&`c_#F$ixX
z0DkC*4}0Q6SA5tP9}Xxsg$n%>*aS$;7-c4?1at}oMam>)+;;Gw(|>UMhfpnUS=3MB
z8Mws6>-7?C)Z$rk#sA#kq$0n2$+14x at y%(^9&LL2q}e*K?klPEYN&-?d~;j?KqYLN
zw-v2`7FNQgXqm7_MWj;b%lmCD>9 at NFYws03kBext=?ua{6d?x4S*=EI00mwVmb+-c
zxYP8vZv2)5hKgrr8KIrlVdt>B-#YB}`zz=T9r$sa1-WsJj(as~JEhcioYXESZBjy-
zNgpSWRHyQwl*$8(%H^(z%9@<^NFA0!OIZmUu#S47z7yUD*b-UZ%eb*b>mRM}MDn)Z
zb at ptlb$qjh{%kUFh*zhwxnhLK)6`zj+iG_9I|uD<=b+zrk&P3*Qf^6f1;Sh3-2jTz
zIThTg)jDPEKSt?|NCxM5m?t0#0pjK}5aSCK+|cYrjjwcAGyszc|DJeS-z8I`jPV)4
z_5x-r@lE6&jXQ81A0$bbW%^{Ncv>1>!51H(S43AVfn!Bi&M-f_31S)LXLMcWjJxvL
ze0ZOSV$sDL+{WSt=rXoGF`No-MCBGJZ<5KC9A39EJh#~-TfD7Ln#41JcO1~13nmzC
z`~_9^9H<jE4pz`2Noi_?Na-+#5=)1o5m8RCttqvw*fZRRyBTG(oJ)NItv5ZY{Fm?E
zygLFvjLSz7;K~#&p$57zj`C=hKnO^J_%^uDNS-c2avP)xKzMFZ4WA_{bYih|Vow)T
z=c$5Px*U}$Du)%`#%vvj%jr_13zB=x7dh56A9Kw9Z1?$sEg6S*U}msj!Br{Ez+KM)
z?uZbYIzVif0XU4>dt9ofTV(!KYwB at J{)Vkb({S_^G=St&7)cz=gam0C+~dQGcbDf!
z<Px8ZX5$dkSm31Ndom7DP#J;o&!-`x4$~xvNd$C+*I|M@&Jsj1n~?q@*xPOH0-liM
zNEX2Jo0O6$%QJ+_Z)ZSynrBB8DW!tmKs-S*rgx`7Hl;TiJ_Urd&*NYOLp=;ZSwjmP
zkwA--J_Bj62D2=SkfMA>X2U#)7(bIJ1^Ijp?<rY28pJZZCkxD&(I<R>L0>@m0UC#E
zHvDgNgh9snxLTk{#M30aW7ND=-(}*05_Sy>b=H=NYdi}xlFURxP^ZU7MENv8ZhWnY
zHjvmCLcLi~HW4P9hofi`jp!)xA<|plM)?#vOzJQ^F!Rk886D!QG>8!s2!^W4ILyOQ
z4gv>G1J=~1bgHfqoGRTBS6h%USitD(5<8%XDqDe(>PjeX4EzB8D$K#1)cT&e*5^;z
zAl3Rlvk3;{o|}LNxJ3S4q~A9SG#_b*k95_f-(QZoBwmhxO*VZ}18iPg>>dX+z30uT
zCi+7AVLA`yyJEhKjckK+x>bG-O$af*r~wpO2Vi1`;elg5Z2X=OA3gMFr^TjC_&na}
z;Admid(yPmg1Uo0q?5EkiWi%aR&~FxN4d^bs4=ySp4yEeJT at DL;KY)}wF>gR0`dxT
z%@#*vOw0yT<r6NQX~~atIxXjU{9SmaI|T;E at pC!WXIK?lD@96VRvIssnQk6OCp~5q
zR(={Uw5&9^1)Gk9&H53Ghvy4$hRks>Hw<2m`Iu4;jQMux_kHF#c5E48uXFSvC_T1E
zGY_KFLT@e^bdv)kQ|krkPb6j_9P`3`Jsz1x;QYkAAl;KKjh&q(ggQjeXaRR}2me4!
z-1XZnas)bb0G1B}hT0Trra!Sve`zpJhjgWHIMC7oPj(41-Lu*ugnto-pjfiqK{;=e
zzn0-!%8uFyAL){Ug<28Bk31MjWKd+;1X*PiRV^I5ueXjMig|qV7H{4>qON9 at v$&q!
z2&aTo_}4I;)36dbr*WTT+;%3`>f!sY9KLB`4c-S$Da1 at fgIOB-@Xn7A%aI-Az&)Sn
zAr9 at 1cSdP81F#H2&(XA&^PwFDU>p5UXM at X&xBVk2BQv)l_t&<>rZz{WTEBkxu77 at Z
zp)goEO_a at zplT-e%1qLhbS at f50{rNvU<ev7pMH6L{-KN*eG^O3#P_=@lf>Z_MM;q&
zyoPBQe6_{Jma=68YRMjx47RLPc_Bu8e?ZrmG0!Q9$$QIMznAdATPZ$jjx^M^XD`?*
zFnNikH%oPjEksn;r0)w8vXL3pCkm+}O;9XWIbKeuC|OyJRY0ylSe?v at 6taq#)#w<U
z6WKVN1dBMYKoYC2aUyxx(7k3urd-t4J<fEn+|?KD!mXkY;B}AOug#;H;X|e4)XQRs
z?sUxMBP}{{xoM?QDqMpA09%|k$kvuD&e=r~^kBx<Q~F{uRR&d4hPUm>wpi at o%WqiO
zpxFkOK(i#hrCT!40CE9VHW$g)WOmDo9X5^F&m?)vRn=w9)(UMh6ID-G_ at UvIYb8>^
z at 2U(d?SKgi=As$hWT at 7|vg)$Zo}vVF3Kni`LX4xUX%2!<aVVbBtE^V5*x_W6j4+sZ
zN?(s<?m2w%61s{#v9h!$@x)8<s<OoNTkmP3V0II+Hv*FZN2J*mLQ(TD7Ioa(Wcds8
zNp#)H^Jc;e=~Z!y#18IKcW{RUENPEvpCzqXXc(mT`sNLb`&h(%%jQAB5Z)ZYh~y!^
z@3XdkLksZ=HD?UQTG+c8g>ak2&nyKNvW&9sZFmWp=K2L;X>gmd6aj?zz?odpKdAjK
zhm2rRyi!5{V at Ze)s~Ey^xydZWw}%oDHhhMDnFtxg<3y-0a#nzv3mPR%pswE5r1(r#
z<>F)IeyTun=#dkmuX$Af(6kLn-(ay46Icwy>ij<Qic0cDPvTOE+J)4cPA-nblKbf8
z9hTYR+6EK3Y-K|eRXNY%vYylzswX@g;8b8K5*0Hp{QxocATumNBKZlXNmw3m65Rn;
z5U><i(PAl3Q%eOeFSr{cCbD;Jm7G{Tq%0$rq@4C>$_Ap5oSfk2iB1>jqU=sANSS@~
z0DcRLxsFQ|4{Z%s)P};l2UpN>sL^p~(80E<EK0a9TS*D?j7SS>v0Q|Ln1B(3v<wYe
z*u-EHlj)>1HCmh&kZG08OD(}BQVC60m68}SvzJOrNzGMV$&g?MN^%bB2+r<`)avaP
z`5#hms=Z%R>lSF8x#_QEwPp|I^44CL)Dg at h+knTBEESr+Ty07-30P8l#IsLD<W?qD
z$17U5XzNLUuUgpcRo0-f0!#adZSpLZA!$007+8WMS)8Kll&Mmuy^f_#v;naah^pAU
zxM4o=e3D^eucY?GIY4$*ky5ZuRUNjMnpiq><gUB5dA92>SqpMgo#`9O^ugnpwhNXN
z(+5vr8ZU$U5#|118091m(yI`6uOkc<mWjenBNrzTbGMFUSg2IWNM#S?7`-v2zu83w
zs*rA%7g{-a%#Gn2S6Pj0v*J=1xXiO at f5a%Yp21v5nQOPIGH08mWKNdB@i)-6X`$zH
zS$mGvO(<*KPF2=y>oZw1`I8J1$>r0Te2SHECdUnBTsWCM*Q!YE&oQcTQ!}axgxfZy
zOi8yPlOAPgw&?#H+Zwkt+p55$ZCaxCRkI{FgYk11e1?UM+nR+{V9+)&)2?iLD&h56
z%s$7`SlmKs<cT?1VfiS{HNtDApWC&XIY}^wQdKD(z0x?@>{u67Nqo(hRy%xM=-BBn
z=_qccxTI=IcBzbqQpRCwuS+UeOi{M6AzRST6_V}zr6p^N){rd=!(heOe3ZVHRusq>
zrl`9nxAeX9imF_;(B<7a_uVSm?^y8PZapc$F{=(_lw)g`#d~E{`vW;=G2V4B|I<gl
zvI}#kTD}AC6T$mmVbs3^-^C3{eV>ujqS7+pGh7>qLJLc`679G4^^G@@m299l{Vgq3
zJgL3N9NU8udK1=)<az;Uhan00Y_R$0Jqz9!zG-5-_qaTLB6k>>50!c0l)nj}9{{kG
z4$F4;`70|MMu#FysW)5g&R$nbv*Ugdt-wykSh0sy;e at W5^Dx!BwbIr|KworITKVEk
z6&v|s+!r#ceAD5s$`8XA+${kS&^;@?^cPct43 at BsU<OknaKS%oVGSr}n<wvi=^_=x
zcyWDwkCaOIVrpEmTTo=&CgX3w^Ri}}Pg1T$*85+oV|#ZE)Yjc~wwTYsMTTt8j?7ZA
zcT7F!F58=?Z!1XBOhFg>E$V)mP8S9H*d|y%#;>A`j3*Bp5AwS_M<hh|`Az62R_6y%
z5~dlg*q<$O>Q4ynE3j16FYkZ69Q^e5zs^2<IQzG6-1_D0y<dXJiG`wQb~Pk`!T3%g
z+AR}8e8;?9l!l|6?K3Uu=)>8+47BhakVv^W5tXqHZFR2u at 6Il@?{D6Hdfh+QZhU%s
zad}{UH)z2d28Vc~+tF at V7;FS~d)}P692oIm-Vc6!cX4_4_Tu~l-NOcN6eTg9GK2F<
z;qf5K26FUj#pfh9cHDA&S=3Mpv9Y2JnDH|Iib4_lz>Nn<E}O%O1n09swwzE`=H8(B
zNOZe7iS8f}-8?P=0w)F-gaidJ&<+D84Q`95P-iqK%$^s3m?9}CmTxYAQT0+#ivuS_
zv#WtLyH1#POM_{*oG{&v2Gi{nU`%47A~6;%k%JbCl*mDfMM>nKgu506L>E^DFzRm<
z5RJoKW2ytekUD_4r!qQpkWQ_^=+FT~-ILKF0vWEn5KHnmhsldgd|L`%niKIDTF_E^
zM=yu}J59(m^<K{qFZum<?Isnbd5elp-+XjU-Y(qWGHl%TEh;4k?oMUDvdRn65{}9;
zVIE?oNQ6I>UXanLsCy_m<I6$Fu^#Y;cXOD+j9b}k5~M2loX{|4>AXx`EZ(EHK3fO1
z2~AO at G%yoUqw%R#9JSb8n2)Gt`&4z0I#O+QJd8FxN{rUQhe=M46La#;JU at hG1#*lV
z?6fS|n~s^iU-P-O*ELyUMfjo_znO*^7#9RaNFR?)Q%W7JP?2|7xuyaj+Y4XSF5FSs
z%6Hf6r=l-)stnweeHnLwRdK?~wg<TIxVD<Y$>6xnGjLC~r6*45$Y`6MXpI^sj+x_y
zP_qd;-H;y*0H0sU&z~D#JWrSkFVK-<WdbndydC;3RrO6Zm0}6&r`jGqeB;l1hCai6
zsxOMIkg>&CTjJD26^m$~(BJ|ai{|JX6-{acXd<^kI at Vo-9Nu|4yMocm3L{Rnb2L?9
zkyUC1-D#s=2a}I5XllT}^|}!nS(1c?TXX=a?n0|CY88Oa$KdJ2kcp0!c at ORMMzUFZ
znURkG2W!e#FUQ`dW6W4sh2!J#wV2+WbxYGqaq&mYk(i|7u@$4K6Py9q at 1g;-=J@q=
zW?hGqXwso7(jzU`Attuc6?T6OHj3F&y}!~qgvt=ws*bh`S+<gKV(^#%*i;f1CRD_r
zCRB_0PF3b<3XLVs{y^4Uc%CngN?1!zOu~zM)EArbE&kyG_s&H2jlGLL4^qIuO4gmD
zuu=Zas>XOw1PULg>%PNks~M~`PHL;Br0|#r(Sb@^hyYT$+LIn}>Ka!r<#RaJZ%g@<
zpY(aKURMxmGLw(dM|!2gm_%`0pU>tmh#Z864F}w>$)?I{n$s|S4MI}|tL4>9gaR)B
zi7o?U-qr`qPEl(2=#0bX71PhF>0~yyCKqF=y_9y|%f+XDe|Z3`&nU)Vz#OO_(rL{3
zg-LLLId!&baK}Fa(39b-A=}fJ<5OPpDj`MwR+kNXkI<0N!aRK;32C?kPo%ci**6|y
z>e?;(LhYsvIW7f{I{^afSmjVPfS%czd4`Vws*B=WZqs<U1^AJI9ACJVZ}an;k6-kR
zdNB%F$f7_tTv%0xF6pS=#Lrg|L^X`W9zRi(GOPmrU3ZkT$fkucbp~{F|HX{vtU*Rx
zM+E$JMx^Ja`O^~Lg^`BoaBQ^)m!M)+p~s$FO^FImD~?KXE0WStekn9zQ7wG(kxi2z
zy`?aGkoGi4#xPri*Yo^dt+6BvOXJgCk0$2DG;F<_WvRvcPapq@iXk2^RS?p+Yj|a@
zh-wT~391cjYGVmdr(#I12G}SY&{k#EPmiEx1}5Kdt7z7^`vl)TbG@!?Pz!j~4Ljsj
z{TnBEy4<tN#7|5M*ASORJ1S*Lo93P!ahd!$J+w{va-ZgAN-^dda(e|kUR;+>Ifb2@
zUz0k$eocf4U?e6dLSuhQHx%ubnl+cbmZG(_-c2dcMEJt~<@n1H5#bRfBPw+>(ho#m
zcIDzmzp1Zq^!uhOcyLRpUKdhA|7}Kp!e|{gHw<H&fC9MJnf8(8Fjzu^#oB*|J~@?3
z|6-1;Zdiag&YI^Pc0>}vC(svv at dV)(+G*CfyS$<7r}SL#!rMh=0Y9vo?Nioa;V}nc
z)3;qpf73vkBM40kGqK~Z(D7G8g}x#ImLnzTLm&7r7|1aYAFO%o^UJ$0N1Hxf;~%TR
z<4g;KmG9!v*JP<X#cy&6wQD$$6@C?ldrR}7#Z!UB!@~K{8f7xtp#xTrjthWDiG(^O
z1+Q&i8b-<XiuI2}o?~o>zC)nXHoBz)5%|p at Q5<rmw9;TlkKRzrjR<UM_$98Tk*=?h
zTfLVqE3Ntar}OhSMqpRkFQ~w1YWHG%V at IhiLfi3+%g{H_-4k|ZIAQPEz!I0eYGbrn
zNrslQA5GO8U85;`ql?Iwc=Y$VC=p<)2~GUiuTXIk?GV&AHkL`U-6GyeqY&#ki8|DX
zI@E|VU+#J)S!@d&&xNl_R-lnJ)W}MM+hs&GD^rEL(^UzAxbtqrUk%jXURtIGPW38c
z<p+;J!!W%G$F6W?Iaw_(8soL7??70a;Wb{AdLCLF)=@_d>*(;gya%2-Bbe0ap;=y4
zrKIHunC+{q07KRrf1jy#@R;s+wF5bLM1LdJAN~f?0jV_~(;cg&z|(gt_cm6&HM^wN
zdTe*iu1_ku9YQ+{Rfk$x<LZvE9;M>2v5qFHqi*LB9d$dE$BT9}<{kpat712g8Ya5n
zy&E@WFIpw+%5EMvJoLp6*-z!+DH|QV_0m4uvd_vR^~ixbrTuU(#OC?&AqH_z_C%a?
z?u%f4B9+I5Ra;>e<B9Sbs!l5p5-;g`dZ*kku>&G1^D0W%NaHa|IM(~B%%UiUdt6`K
zA(<uS%R6FKc#rF5BD<-~4=d%X+RZ8d{Rghp_)gQ4!q;MiY~@Lab%`Gqlc=+4G%4No
zkLA)yq?}{4N3nDkIqvWpcb&zO+gD5P*q5+%L}sqM>pfx|+*d3N=edI=_2Fi+r$@AU
z at C7b)=rJ_SLZNP`_PPqEwN*T&jlgJcW!los-q8WVcWDua<6sP#lc3*pEGPsRYCWIG
z(<i>DpiqbLi$=wg=TK}wsC?SPQaR5Tar}qMxsXkdV<X4r%%`!0xmHzTZxp%8iVLgP
zLRGzXlOIx+4t?UTt=F|$*Ln>{Ntt}XjD at ZFq*w at Uuqn0@A09P?SEE0404He}7Rqy2
zX^+~cGZM6%SSD85UkZ+{K=<`$ETLdzexr5+I#KEf$b-)zQH5NPLX{Qd0A%BWWD=8b
z$cB%99yT5rJ1%*%gNZ%~94p^l0TE at t8BRo+DV|}0S;2;M-)sx}8wsYf-o8(!vn#Bd
z`9}8quD`htJbXLw5B+B20f;7(#Z}PTY&JK=37Yb^Nn7;SzVJ8l4%)bJ641ZhCjHCn
zuZtHvn;^tKZPKB@-E!dlJqod}PzSAY=r)C5e>v`zgmB!npTkZ$G$Vv!X1(l}!yZym
z98i?B1%a_vnNz2+s7XHuhrmy-5(m6d%i#rP3eFR`RlB~<=L(@*cOOrcy$(Tr_+eK|
zj1c?IEa-ZRIGnw6TBYY=<iof`V at 0M$sVdyj&RQv+%eCTEGdo{in5ZKARS<bTS-s`!
zr<0YkSK?hJhEu^?ngb9o%qS1R1YPhECXi|Q8gS7is76BM8o0P6fk<_)N2<6zAyJoG
z+t}!TI_tlEJve*+mi=PPBACs?WWW&;hi)iM1-*ZSrs7c3O<4LCnyJE*D2&H!oWVcS
zV`DdUn}ETLvYaXjWxz3S=<}yU?K+Qd3APE{1lf=%bRBd4{&(5$zXxB#Nfd|Q<u}Hc
z|NeWU(P}sN@4vTOd)?L#jpkmfwZH!T_dnwbAZ``fvzyH})JM2I-yLoI?H{!tfAk3a
z{i%QU^GA==-;!60EPaJPQXRh%zs_FIV7A6p&`iU|Fhsc7XLa+p(Oif7NA2y!$IG*R
ze{lKk{Q%6_`@fdU`dVM>YkjS+^|ij%*ZNvt>uY_jul2RQ*4O%4U+Zgqt*`a9zSh_J
VT3_pHef`z0{{{QXzk>jv007ljGG_n)

literal 0
HcmV?d00001

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
new file mode 100644
index 0000000..375416c
--- /dev/null
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# lua-msgpack-native
+#
+#############################################################
+LUA_MSGPACK_NATIVE_VERSION = 0.1
+LUA_MSGPACK_NATIVE_SOURCE = lua-msgpack-native-$(LUA_MSGPACK_NATIVE_VERSION).tar.gz
+LUA_MSGPACK_NATIVE_SITE = file://$(TOPDIR)/package/lua-msgpack-native
+LUA_MSGPACK_NATIVE_METHOD = file
+LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
+
+#LUA_MSGPACK_NATIVE_INSTALL_STAGING = YES
+LUA_MSGPACK_NATIVE_INSTALL_TARGET=YES
+
+define LUA_MSGPACK_NATIVE_BUILD_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua" \
+		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/lib/lua/msgpack.so"
+endef
+
+define LUA_MSGPACK_NATIVE_CLEAN_CMDS
+	$(MAKE) -C $(@D) -f makefile clean
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.10.4
