From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:53:59 +0100
Subject: [Buildroot] [PATCH 13/19] hotplug: remove package
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a75d9e89eed87e273def2da837b25f8fcf717a5d.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package has been marked deprecated, is no longer developed
upstream, so let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                   |    1 -
 package/hotplug/Config.in           |    7 -----
 package/hotplug/diethotplug-0.5.tar |  Bin 40960 -> 0 bytes
 package/hotplug/hotplug.mk          |   45 -----------------------------------
 4 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 package/hotplug/Config.in
 delete mode 100644 package/hotplug/diethotplug-0.5.tar
 delete mode 100644 package/hotplug/hotplug.mk

diff --git a/package/Config.in b/package/Config.in
index 8c11838..1d85af1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,7 +169,6 @@ source "package/gvfs/Config.in"
 source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
-source "package/hotplug/Config.in"
 endif
 source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
diff --git a/package/hotplug/Config.in b/package/hotplug/Config.in
deleted file mode 100644
index 48f1d71..0000000
--- a/package/hotplug/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_HOTPLUG
-	bool "hotplug"
-	depends on BR2_DEPRECATED
-	help
-	  Plug in new devices and use them immediately.
-
-	  http://linux-hotplug.sourceforge.net/
diff --git a/package/hotplug/diethotplug-0.5.tar b/package/hotplug/diethotplug-0.5.tar
deleted file mode 100644
index 80886707097c1a5bd334c90966e5e4f2f3854c56..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 40960
zcmeHQd3PH(lJ~#lr$Fe~reso=&#_~_ktN#ZTUpZ6kxbT;<u=Kt)MK)n+fC|-<NfUW
ztHRMhAEYG9*<?ccJ(&#@fI?NFE}+4F;7?AY$#^(DX|An2S-tZOK5O_qd-CKC{#$?c
zWX=Acs_1iPeeLnnr_b>B(c?R7>yOu-J-Q>Fd;?r^T~3pU7YlL63;TYY_+bt}70jzI
zYxf5)?`Qb`!TaP7f}ww#XcL2<J_cWl`M>dK{aJ?pPo6w_dPl6?CK6?R{l)ozS7?rl
zK@<y19IDm3;?SRn$*GU3;V?Q6!V@ux#D7oXssDh!jUX(-6MersJvs5ZLtk{K!LYxA
zmOH+8=A&(ph=e*pvw=5E(2j-~$5DUUn*>oPris5&-EO@(ekWcD2BCr5192Hmg%|rG
zo`xZf?1^3+C5h-oqcH?DZZO2iyA<bM$RqGT7!mC;UJ{L<+Nk9yLN`G;@nb)kpr9d!
z0T8cw@u)cr!s$h`wjxBE`=h>Odo_+YOT=_*7<79LOvjsuo)?O)FZxmFi&JzdyhNP)
z!{JJG>tOHj5VN?uI!)r$;L-D^s{3h=+H+|)2xW~dYgV_m(Bk_#w_Q5v^{Sf(R)H5+
z504Jo`&LmhiGy*Khy>D!2hF|Yfr!SFU=;l7F-3!c at XowoNDOHRA4F%!=H5niZ~v(M
zq5YqmNA0~`@dD$1PELWkKog*_wItA+Xda4YBv$+W*=jgNW%HtEJ-tpVHeTOfe<}W1
ztyCZ*q40aBk*J}E+DkdAF4(AvmtqinsaAj5JlJjTzB{C`n?HHf`A^BI*N at KW3ntc^
zG$9+4XmUCBlj_#noy~WL4_`IM!Puu615YU`5Gy~V3HFIA82p?#BEo1Qm_7nRrikKK
zgMt4)qW*nd)_h;*E|!)WB*#nDiX26Vhr|bsA(3KTG*3ixTaMV=?!4PQ?i}tNA8fU%
zm7Q(IjT$w78aA5eUK}<dGNUN0R+wd5AGX1 at Rbn^|1hNKU&+nZ39Y}RYt{Dhpl^9ft
z#P@ZZWk6~Wje<#Y5PKuPIgVJUfnq6Y;N~pszOOT?=of&^*dIk_elziTWxiSgHGy`n
zm}co?mH1&l7(fug#uq~Q5Y?*sVoFwe)ryoY{AHRgfy|10OS;`kk7Q1Ff(Dv|2BKQ+
z4Sg?sQLV%y(ToSs16X^ig;-ws=taL&t7Te#QC>m;OX0KsrwF>zD}ldB at ofA5^a=TV
zuK)Ms*`p^5`+pN!U$@Qba#bwrWrVdV_<2*D!5Jp=91X;3LOM*ZG`4|IzocqCk at R4U
zCM&AhRy4khgOk&VsKb_Qz}*w?V*f<^M;v*l&G%kB8Nqn|aDuYGf1<J#=#tm6apj17
z1t|X$=r)0`gV^_B#0L|oR{td%XEMF9-w#NUcc)NJ0dNTWt5Ei%2+HUZ1?a6ZC10K$
z7uft!LX#jb2KrmP^Fu%OhGKu(9R@wI6ZHHL1`;-WOeHXfebK!naO&tS;c%#M5N{)N
zEN!eN&xY<>b)+bfn at oyxAD#$fa~h4wL4rqtS)2#3h43n1(g)LF1AY`w<fr!0`@Q2M
zvAO%RfMq(^+&%jFC4dpKO(()XgW;oz1*7pW0OFuj4FBa4ND=lQS_fP2(PZ;Yd#8Q$
zGugzq?W5fmoRqhF2Vzs~Zyp at Aw~lw<a_k=;?C%}6;0GOI%8FXlNeRKoi(|j4?@!=s
zBzodM!)r@`-LNlC$pei2o*$e6H at I(*4o$9EtQbbHiWr%u2~1L{cuDpja@P>&aRBba
z$s<I|nA8yMu(#5nuAV-70zVhd<K`J$qAhRKjf4IPzJAygYa8p2{?-u3hnrfA-+R4J
zz<4^Q5n|u#^Dt*#97NNEByBqMla=L>H-=Y(uOx%))`EK&jTro9nq0n#E=ZJGaqvlO
zs_0VupySBD_oBW(j{M0=6rZRyuu5(nyoBMj?~5P&I1Zzg)7Mr}GU*5TA}>D4f%W}C
zt_)6Swk(DRk}11PhEb+$8e+-yb8xF;4{J4FJe?#V{1d9E-UT87JmsDCZfmEt`|jwy
zc)tF(4NP=(S+v-NQ(Pt4hnRqxkpASd3+j2}@esko at +wF$5bITh>Ju#5UKA$q!%q>n
zFRKSYc4$m^Ts5VsYA-eXSrqh1p~X?$86_umyM59SXI=*je<H?9)z8(+U@)8}r|=c~
zSYk^rQ7{IPCIc!#7Y$MSXGs6<B`-v+K`8RT1bLPPMdxEwe5v{uP(-0%M7rHhDJm-~
zD~yCe>17q&dL7D9OzPu?NO+vIy&8dF;EvU4v@(Qij7cdf9SCLz-awW*-x{Tge-TXT
zt$(zSI&U}IJI4ntiKpVV<lQ)(@l57{Q39Zl0{jglq8<dNo`_ek#2Q@v3ciUNB%@-9
zgQg)tE++;G>@6bZz2si<&k&qPGuR<Utd74+*Cu`Wq^?MFs{=g;OAZijWyCIp|4L at 3
z9n}j4F5zhT;vFIGh%Y<-#i@sE43q$PB+G;;1262^EMJTec0|2;68!3S5cJ_cxpHW&
zFOMfA0~QFFBSqmmR1u5qRcNSDC!Mmql*NZQ8~c+fRxn!Add}bi8^Or1ur5bK1f`{T
z5h751httCik$9JhsI><SO+L>Wn-anv57NWp5L`ui9P3sq(0Wn#Ux?C#EQfuHw8zw6
zsR^-7h7pbhr6(F>j(Q$^9EByfm(w9#yL-H|L+Bzll|gj)0Pcv&s34+8qJ$k5&U_$O
zL)us_Dv<out2J@|zQBx^#Ai^Ie6~70fnu6uGyon!w2EYlrk0@-LDS;99o}e*qs%~O
z<ON}c{#5U(h!x8g$tRIayU8WwZ3NT>KDK5NWK3RiG3k^#Tx94+WSy2oowy8?zkriU
zBnbpYvorFO#5?gtoeSWe!IQIl9gN_+(Bc-N)A1(Ci|uqoz251-qZ)aWP6uD5#p!e!
zVxu7*Es<)mMoQr9O*)Uxyx|nShpVsACFQqh{4RLj5YsRTPC~3HDq4oEL!<RZ6)tkV
z9D@}VKPno2;~Na`j?=@M>ZCj>oM(=c%cg<b*)a0@9qGBb6q9Azgj-aeCf$zWxna3g
zJ?;gwssrEm;Z{D*!5D{Vb9=i(Nsirjm73S@*G$Dh>%-oUEmJ3xGBt9TR<&r$jMO@L
zMR2cVO3d~WjSE-NE&AP)x)d<DEN~Y|29YoO?27Hq-n$O>-GF?)J>K1-JR!uh23trD
zF66Tz?%t&ymR^c4;`|iuuc*Va-j!Lbxx=|_R04 at avp1e*Xa#4CRwZ=hE<#Po3aIu~
zE>-Gyjg>LA5B<qkweLs0PdDyBnYNrXlGaH at _~S3INpe!3MGXQ}YgA~4wkUl;xPlMr
zA%Cjgmc+DPOBg&6A at qZpK?(=Ls(x$|r}ZG5s<%m)))QeAfI}k#!3KmULf^y}R*b|F
zTLH61gxDa7F8y|VKl}I#nQWRbX at 9B}- at OtWY)T-oqF$SZpTg)o6ybE#MMRG{9#B)t
zJ|^VOY7?_AHT4%QFk=e!pm-;7G}KX|Q4As(`@LX5@iL+_#$){#Hfw~560EH9QD6=D
z6gEqN1MC{dGDj4Lt5q)s(~xth3CAuf1ZuZhE!GJiHjlR6cYbW`Ztop*+S`@23)&eo
z3LpdbVQ;&&LtqkaqYUnFzqQqV+is;@J}v|Ov2}2Wm92VwUPYk97E$A`G$l;un9RCu
z!c_Rn3KI-)>;=?A at 3b=*dM8P?3Ym&NqOYKzt$_aZhXv)DNkwf`@&&Zdnb9$a?qo3C
zHCZ&X<$^-kbavuQ6@~vDtWc0b8h$0QZ`(U9VR}Gqhf)Dj4iz<37%bHPPMzsr*&m|x
zGQ>K*gpMevl#S)m8OQ#aGG#KDA-Ux$LV+BYj~_PwvA=or9s&0+R!i)4`5)6j+^&-S
z<tte=Bkcvf4;0C%1%+rlTCr0atA1b2Z%O=s7>ndZh6l8IQP1m?W4v{6g__D`ny9c^
z<BY(16$y$}iAl10FVSCDG(CU;w4Kf_#6I=|5?^&n_|z>xW(R0FK$b16TZ6>4r6mdn
zNm((rhy>Dj#)Ja3EzV()4^BOZdkKct-I$5+e0oG54mX%U_y)5?6J_&QADsA;q)xPN
zSXmJGXi8aV*;yjxr?HX_F*9rpX5*E3aQ6Yi7V4Gs8a6G75m=cR`r$(?Dw at AU<TV98
zj0sPVnyBZ8uh!Rq8uy|{x0m`WaiM+lg6an1Xz)LxOh}owSb~eG2M3XOq#05z9%42`
zyrzH(XK2J;*v74MqlQ?!>Y$hy2jCQC5Gj%bx#EGMdhH$}tBZRVMSp7Wh2_AU*3(b-
z8G+_&OQki0E;Pz42d$J at 3TmsdEVNQ%%=f2;S9V}puc_5wF9G=I$h#%H-A)4X0<yWn
z83}sQROd*HC!tGHx#3t0e$}4bHTH!HwmFEE`EBIj0<3u*I?`TxpLW`@Qwe$E%<c~D
zoC_I2VF#R&wf_q?G+@h2jugA<$j}dyh?`OW=h#h8$R_^_p+2}j!d!e6$HrXYu>yuB
zq|H$p4Z!5SBUV*fZ*q>Ty%mT~;@)UnmzBu48TH7Nl`4r=L0W+&YVrq at 7&=omUV2D6
zip2pk-Wy-m(>73mEFlE&rCQPQ!DTx2m_pl{ZqOS>iJwzW=;({KQlw_nB}Zly%GC<c
zQi*dTG)KJLDlJ{w!=e!+Rx}vg90YJmmrGyEi~;K0yFf}nxk+S!RgvnGpJ?F_RZTOu
z1=6Z=2MN<;Wk?$a^#D!RkjB^1kt8Yk86SgRR at 4(&4Xq1biiZyaUK<k0VHACWTnJ<%
z?jiMLEl-0~Wq$9p63d`cABH&Xm=#M`GP)_KxGyqZoAK_JkRZWuhW(jN4Ebor<^d+^
zvm~$08yI=N_X&q&VCMVa5jDAYVKi9Dj7+Cm|Cj=rAhFQV3^$*$?SRgiwIf@Yh5ekJ
zyIprP3fMhpBG_fOOb6v%&mn<cOU!oOYt2qvL)?(-+^3#yx)=*M4pT6I8SV=lY5I=y
zdwQ{XeOhen`;<tRwPuNoQm<ewItiDnwWYNt+bd5;#bR1lk*LDH(|@W)hW~|16e$&z
zwowXD`p!!B{qRicLRp#$L#9HJ4SOpJo^&Ut{AKfEC0$ULjzA$0O(D~ixutz;tsd>*
z1Jvbq=?p++xRyW-fwECI<Ze^<>3{@aLE5WS16$LyL6snDDAtAc at Y-Gd?Ki1M>X|`v
z_0Bk|)>7`HAVD4)${lCP!m}WbLW=Z}vy20Imd)!%F&*GrA(RS(f1}$l518-?oOp<V
z3_j6kL#4adpXSKKM$R;GW|C{A=HZUP93)9`z?m5=F at R3j0htbiSU~#)mbJ~<P9^S2
z@F?S;qFcvrkeNbP>an!tfefTk()2zue_nVg4 at dG5#usqh3leL380GM%DHJmiQ{*JK
z(%fbm=5%O9nxv7F<g|d)91I*MmzZfPu~c=Y>?UZPl`cHaz{u4gzuU6C$+=A}+EU*c
zC{}p#Ny!PxzOL3{4GS&XX}Ohs-dJ`OmvgBno`*#vLv!E;SpbVE_k<ipaoTBrtKGr*
zkqSO*7X$S%DIZEcre2szPnIWq3N#lbb_!G)j*r4iFQ@?eazPf?mA2~*k<}|`!{u-x
zlTX)42xaEI>^?)+auh<Pwi4#8A14C@2zam8Oa8cHrFkE>ykM&R7)NR14$dHXvi2{U
z5RycnoeQ!UgLVJMO#@kY{=OL?SK2@$ll*aOaw!<MdREHEg}gzw$L)ZIN)tUY1P9(O
zkUPpXvq5Qw$V63AIch)JO#!8O9;vmmP)60IfG8@4Wi^(<rCQB&YOQ{jl;<W$EY2B$
zE>KO2bkUzPT_m~3hDF+W%jIK<=j?;Dq?C%!Ws5SK`Ki=Z+}OhsQl}S3QZsD`0hUm+
zfmfVf%DD?tta0XItil;5zabM(5>qT}&O&K#A$_*$-6T{4Zz7S?0dHEj;;*t4RAgt|
zPDC*wWeV?xIVc#RnVn!%nNi6 at Dc&Igpj<SaF_;A^8|704<b}=2j+Avv;RZD)REc2)
z>7aa5#e}OMpMokz7`-K#uj*%~Im$55Jiiw5Mm#8kHkbGgw0X#~z*JnD3#O$dx7VFc
zO5>|cCxyn?#Y{03H<^y?(p`Ib(c*J(lIwh0jm~njevoNhoNc0`W~s)22B_!7K(_cV
zUWNP}tEgZ}%5G$ozzfpq7ebKk5=fbpy%PAf=g&=X%z?s{4r#hVUh?GUXWjDiy;8z$
zZnK-_+A>C{B+Dk}j#P*pr3C#nji%CWd;l*kou6DQiiy5aoXNI==xE1(U?rE!xj-Og
z0<K=8RoC9u=>#ku?2FOFG9ZV?Zw`Mxv>*+oGJsn<n}>(GJ5IdmA$9g4O}bfw<tnZI
zZ$01Uq_*UtL~|-oV%rewPvO!^^MWr*)krSVtT>~EY_FT(A|s?zW|@9d%BsFmV7fOt
z3v8l3W{<$60ohH?&(Nwofye90alG{4mdevb1|6jgwD7o-&1CbW#L;`0x0%Ru55q_z
z(!p06%{-N*@G1l~BYVg7g^9aLC37T<db&!^j@hU4ZE2SK&zH1w2n+!rZmWbHj`bBM
z?2ZrL;1uSM?X4CRMaMoYrVebSN5zUj_Yd~AkGGC;$Hj_ZF-&J?Pl2Y##mYe6w-xAf
zbF!=qlognSUSFFF4ZSEE&{4RJ`S6(I(caeH4j+koJR82fd(^S8c|IT7#s>L at nb=eB
zHa2+aaVETEEcSzo2q$-O#BX>REiVF!uQ+R~&Jz{^5kv8o;Ja4I2$JC?BT(i0_S^wT
zFgJI%aez^tA}pMWoac;z7|Xe1b=tdcA)jSKNXB9mx`co}Wi-(&y#lD_=4{-E?=x^S
zLN{kXg1aJawxlhY{5>5GcJlYPaauFz|Hu&`0zxMx5cK!u#U0s-Zm+-1epqLSm#*AK
zY29g%tCOv^WNJUtPSzbxyR)i+&?M?bILeY~-KP6K242rEZf&Yd`!^8j5LZ8MnqkYb
z`>eMYsFdAHd_n%9;DD*DxZd`HJ65{A;FjC2d3tUM{t&$$N8S_r==#LtzuAdWN!HmL
z2o~u<l|SwVf`#YryMf@!6KG^M5Zs#F27+5XYXiZBbW{7BP?&dI)a{^T1HlDyN4fC^
zLb{cZew(wYV4Y at 5Hv+USHroK|<e|~UDQK!`hfx+htvd~@7MA|awQ%)su8~%Yxpqcz
zvgWngnF_6Q%bV)XS)$kFD<Pzmig!A|z{O4n-o*NI?sQ1*74LNL(zF6@yc&sgJzn0t
z!j6Xm&Fq7ig)nF9f^A^I?u14_Zcmurp#JD6rb?yLDP+bIH+g8+NQeLS{)4M|ZtDyz
zPFUMcVWwNqBVWxV<~MhMCg(?I0wKj(=8_{inCtbM4FJw;%^Ru6r<akE+Atx-P|x?G
zHD`LVR_5&0sU4Z7DNFAb5J~r^nM{--Z(F^M!S)Cz!wH)k&r1h+^3ZVU#P-!HK;~Kr
znlm*mqa|A^g>zF~8p-_ at vy;*1Y_6I0f=~i)6q!e7f~J&!va at _GS7Kfu>{jl=ymdaR
zP<kdCQ*=%Pfwy+dbIDWzm7VGjO6$y;E7|+B>vEaRp8_WFlNyjt^O}>u`N1-K64VY!
zPP||Mt>_#CzEV?KJhC}5!#XuA3xK_RdklFrH45FzAkP6?dlNhk>$JWMOM4VyW{d`x
zWvl~|p+&`5P#k4m-Db!E%^tS>s5{dpLk*Y?tpWbcEJl$Yr*%SUl&`l4)Dx%q=BO9T
z<0Zqu#CH~)WL0*h0hH}~UV^(;k7=g=n`jiBDZ0`WwUbS=)UxGFR2Sy7%G|l?u6c)7
zQm|aF+}IWpM@=$rwkDM<fC=MON;5WVh$Tyzd|i0`8SAduJW5qiKI1>VCe`P at 1Dxtf
zRVkiiMok|5S!mO;chCy_E6YOOlK)+#O?6WG>$R!LU(ZoBCZykD1B-=s3kuck^c(6_
zJNtgsiE7<<t7_HESoi*IHLJ6gFk7=4%(Mo)RppxN{jaHCOODaNTv4tgJs=~G&CuQ0
z*|NasW^?KWMWwH*=}=Z?`pfos$isH(Oc+tn&UUoRtF_Nj4xw#y0Yo}U>7$v8791o~
zC_NY)ZA1vU*`$DaObI9<Gg~v-7q@r<X!HJ^ire*x9nB&e<ml)9mab=?$muF~awqNL
z)(`FwCEW8h<}xu0Cw0I^iwg3%cFNg^0tiF>(Ts{u^Ki8uF7+m4`X$ZhrQ=w`+;Ei4
z4QZN`m=P|NP^XZj6N3yiVXw=y#H3JKH0Dl|y2;PdUKOHlKk0+3bpD3L*%VxPNTw{D
zP27DS`gkLpFG`3$(aZ64meR;KDkA-UpDA=sr{N7!*o4->+s!RUMl;Y_NI&a0-%LH<
zSBM`Az}39`(+IdjkZx|m6)1#EM0btRi-zSdZfeqHSZ4+xbQS;7GD$bZ!n8Q0=>4?t
z%2X|8WZIF`J#?X!?G4ji8M+`HKP}4)Kl2P2Et22yWlkCnD9f8XN)Le%)T~2b7Sit9
zo6aFHetnZb|5B&G9125|s8e9alK?k4URtNXXc^0U$>_!veOb0)PQsU--~bujGVPp<
zL;;me@PjOLsVB}fQo0WJrO8|SMC}5f7nk_d<Zac#$rQhaBIp`%=n879E_9^r2?Ay?
zYJj>`W}7phdyAqRkJmuqy_4McdM4Ml%%vMTr^e1rcRCpO at kgAZvTvtareoCVk~jO^
zR4U#`UnHs5)Vz_aq3fFDleXMsp>(}cWai*$Q+2LjLR<->fzge;^+=+I3<^@UnIfkj
zt(C_C?&_dB#G#4@L5$mO)Gc=EO>3SL9EAI7&U(f?DU?fGrFB&oEv|E5M at TY7Huzd&
zoS0MhC3JC?1TVqz_Du@#;Dx?9O4mzrVh9O at 77rgP3af7*Dyc!4Yc=3>I8Rnc)~!n{
z<xBQ*7W(KcT|TNzrpzGAYBXTZq;qzFq?iy;AM8_u*!)XpMYu3EVE+_Xab+$}EzvK+
z(5+o3QN*`J>IAZ8vC15y8Jss}4u0<>!sQoN<Bp`1qR;i%V(9plWCz=6%C}5*>eV9q
zh9<kRR5Hcxs2=4sUP<+=k|tUG6`!l>AN;%%KDezEtf6)pHDo+iTOUY4C|5%_y#Cg{
zS3oV+g at U?81+}_RP}s!!|5s41VR`V)*z)@-Fn3nBXg6?wO8h4>8;`z;*`Qu6vq5)-
zv+LlR4a7mXgZ}I8^Hy4zx(d`F_E8$+B-3%1;w$8|cZb^oE$_}mKB^u2jdUlVv?g%)
z)Q?AyN2I3Z45mVvI;NgFO$rcxB{}<qw6hUzTP<sE!10Bb`O@J>aD=&Eexl1jaZxJ&
zA`{vns_gpeyso;U81?)!1_HlhAm3~zVo1~&WP`e(_i|*JyTLD;NGHu|uBMjYmPfj`
z2z38cmwSo)%K~foRW_Qs%tg?Jj{GhsZU?8Ejc|P<Za}5qapYp)%s=r&FLzQS|HALl
z6;_!^@jc~d7+3+}M?%*0lXhfz@OpE7NsTY(LfENG@?^e&M$t|1?u0iTPE-R`N&wQ=
zb;S0%zooT+Ur=B{fdvH?6j)GTL4gGY78F=eU_pTe1r`)oP+&oU1qBuqSWsX=fdvH?
z6j)GTL4gGY78F=eU_pTe1r`)oP+&oU1qBuqSWsX=fdvH?6j)GTL4gGYeh&)#9~+}2
AQvd(}

diff --git a/package/hotplug/hotplug.mk b/package/hotplug/hotplug.mk
deleted file mode 100644
index 0b354a8..0000000
--- a/package/hotplug/hotplug.mk
+++ /dev/null
@@ -1,45 +0,0 @@
-#############################################################
-#
-# hotplug support
-#
-#############################################################
-HOTPLUG_VERSION:=0.5
-HOTPLUG_SOURCE=package/hotplug/diethotplug-$(HOTPLUG_VERSION).tar
-HOTPLUG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-$(HOTPLUG_VERSION)
-HOTPLUG_CAT=cat
-
-$(HOTPLUG_DIR): $(HOTPLUG_SOURCE)
-	$(HOTPLUG_CAT) $(HOTPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HOTPLUG_DIR) package/hotplug/ hotplug\*.patch
-
-$(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)
-	$(MAKE) CROSS=$(TARGET_CROSS) DEBUG=false KLIBC=false \
-	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
-	    TARGET_DIR=$(TARGET_DIR) -C $(HOTPLUG_DIR)
-	$(STRIPCMD) $(HOTPLUG_DIR)/hotplug
-	touch -c $(HOTPLUG_DIR)/hotplug
-
-$(TARGET_DIR)/sbin/hotplug: $(HOTPLUG_DIR)/hotplug
-	cp $(HOTPLUG_DIR)/hotplug $(TARGET_DIR)/sbin/hotplug
-	touch -c $(TARGET_DIR)/sbin/hotplug
-
-hotplug: $(TARGET_DIR)/sbin/hotplug
-
-hotplug-source: $(HOTPLUG_SOURCE)
-
-hotplug-clean:
-	rm -f $(TARGET_DIR)/sbin/hotplug
-	-$(MAKE) -C $(HOTPLUG_DIR) clean
-
-hotplug-dirclean:
-	rm -rf $(HOTPLUG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HOTPLUG),y)
-TARGETS+=hotplug
-endif
-- 
1.7.0.4
