From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 25 Sep 2013 12:07:50 -0700
Subject: [Buildroot] [PATCH 2/4] nitrogen6x: use 6x_bootscript/6x_upgrade
	instead of older 6q_ versions
In-Reply-To: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380136072-9879-3-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 board/boundarydevices/nitrogen6x/6q_bootscript | Bin 455 -> 0 bytes
 board/boundarydevices/nitrogen6x/6q_upgrade    | Bin 1587 -> 0 bytes
 board/boundarydevices/nitrogen6x/6x_bootscript | Bin 0 -> 1653 bytes
 board/boundarydevices/nitrogen6x/6x_upgrade    | Bin 0 -> 1744 bytes
 board/boundarydevices/nitrogen6x/post-build.sh |  14 ++++++++------
 5 files changed, 8 insertions(+), 6 deletions(-)
 delete mode 100644 board/boundarydevices/nitrogen6x/6q_bootscript
 delete mode 100644 board/boundarydevices/nitrogen6x/6q_upgrade
 create mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript
 create mode 100644 board/boundarydevices/nitrogen6x/6x_upgrade

diff --git a/board/boundarydevices/nitrogen6x/6q_bootscript b/board/boundarydevices/nitrogen6x/6q_bootscript
deleted file mode 100644
index e10cfeb0b742f401e36f0f242ca72e45fab26944..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 455
zcma)&!AiqG5QbB+9`Xj>h7#%}CA*=<(z;+3DS`p<P`xI*n|8@=wrpaol;Y8Y58>5^
z(RVTlQ9(qU%MAa_d_OY>-TgVceOq1)j$bXS^JKO0{J#6r-PyBZtqaJh5v$^}^&@v4
zYa!<a)U%OU<luZ&RA;%CoD{`_T2t&|eCQ(trHZ7~lnfCH!BlI+W4!c~qOnZT3OCw)
zBnoH&v5c~mAeh*d5zorsyh_2iCY4PRqj7~JOQwX2{SjIp`6xUIkSh{$Jv;S>|D)iB
zA}MpvE~nGM&3ra(2|*D2fk<M-74b)*i&1Dhn<U>#9WkiR182iTo^Hn&FdCscz^lLI
n-Cd|?!J*%8PE+6Q32?g9&^tFq8>m4dTR_T9#wCb)sb||C*>#HV

diff --git a/board/boundarydevices/nitrogen6x/6q_upgrade b/board/boundarydevices/nitrogen6x/6q_upgrade
deleted file mode 100644
index 2f20efa2e85c761b09da7ae5a935589280dae5eb..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 1587
zcmb_c!H&}~5Ur33YQ=>kx6x9GQ>!#AEU-634;)ykT><CBo-|gIII`V#w`dRi1s}ti
zpW(<4Ft(F6?IwFb_>jiwy!XcQ#`C=Y^vlo3Pqy>^k4L>;|4*-4-`Bss_8&a##Zns3
zOo`Iee;xhyf7=hpQVAz4MYe>`<9CEQf%BnAVDv4~x0#GM<T;}q7kYX7b_&xla0^yr
zt1*d10q0;+EQa8gXH-bYQ6e(bVv7*p7}Ss`nZwn4V3Fch#sf%9Cr~OGBTOMYtN1I@
z0R?$V7s26b{sAsOeca<6izjia!Syse^*IKO6b_Q~%Jd{0%gad&7F8)X2=*svhg%+>
z-Po_Hh_FVbg)B7WkzwgkvJRDLtO{VayXDy~5P40tDi<o^*ur5!K7Otw1?50yOasu!
zWWjX@B9RIT8~Fxa!x_ASmv9O%Af)04WF?nvX}SEI*2wzZ8KN`9l9+09cjvM%ToyPS
z>>WiFX;CaX@}#D)0Z3T|*UnI4b?9ecHWIYKQiGAyI=IHdK&%8?5?@n-n#L9;zgK3X
zgdv$m2Q>SpNk_Jd<ffbKU)!)Q(|>5knrf5M<!dzOQ9JPoDAZ`LyS02ktMV=k?5?uQ
zzjfJ-9Zg*4;G6T(&H`6C!6HMqf_zm{b=YpPiD*;2SItY!EHNEyY$pNP1hd)v?y#uS
zyDM|}rA_cq$BVdOYiA`YKjT_ecihLcO-fM+Bce=f+mcTN-GDvX<1S?FtjMDULLyfM
N2P$%7(313U_!p)>ak>Bi

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript b/board/boundarydevices/nitrogen6x/6x_bootscript
new file mode 100644
index 0000000000000000000000000000000000000000..dc9eea481c03145d16959e5ebcc47120ff3cc2c3
GIT binary patch
literal 1653
zcmdT^!EVz)5RED|Qv3sm+sLwt1dg(H(-1YXMA|~B)LeQf+^V%bPF7j(8hc3{Mfnas
zf+HWq5AYGJ9Xn}4p+dR9Ue at -^zMc0x^IjZ2zy0##+xX`E<@ZLTdD5uXv#<8S;X$+E
zOQ|3WQkJMXw6izc#fJ<PiWwB?G#zJvg8Cfq?kQ7uu?*3ZQDjs}0&^8e0c2npEP_cG
zvk(;wKuu5>tz9T<4LZ|#(u?yT@~uUMvOEoO<`o#W<Mv7Z+9jhmJz}%SySY4byKB72
zk1+<b+&s5GG6$<ro}^G$WYrI^z%h_#XtXexNHE*w0wLl3#pnuRDVUO}hKQKv;0B<J
z0JmUMyd<gg5lBwDdy(RyZ(m=WwLe}CD>}Vi&uHmO6lMxcVnQ1~L0xpMUoGGkVTY82
zSDdyptVNl*v~`Zr(uB(JU&`_>Ma%-q5ki(FoX%@)wiP+<@2!YK+-}|@5C8JND@$GM
zpH=DZsY(#q=hwqw`@`*j&?$XF@@}8(C~`kxx_4H6eXRRh;JUAM$Aoe{#%nWp$`-WY
zz!M{`<DnF2)W-A(wpGr?FA3)6cI{-D<mf3i*UseFj&tG?0<)NME(5QtI~A%NpHngQ
z2&CF23uiP-|67sHsG=r#U|Ne%%@bUjznzo^mlsH0N1IP43#p at zRIXKdsQCz^&5<|`
zd_E;fc}~y0HiB%)B@Lmjp?F}~bb0E4L-dc+3pxd6=krxe#|TG9rRB$)u&$tV%(rPO
TQz+1w7{e4(fgD(I$TWTea_I@(

literal 0
HcmV?d00001

diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade b/board/boundarydevices/nitrogen6x/6x_upgrade
new file mode 100644
index 0000000000000000000000000000000000000000..cd26b616b0024424764e95f4d54d917c626d36d4
GIT binary patch
literal 1744
zcmb_dO^?$s5Ur55Qu7bEjh0F)AzG!SD<paYD#2lwsw+4kE@?bztu}UKyI;%pz>OmZ
zeh>eEpM=CX&R4tXN(g*toOI^BmwDsK#o6PJgReh-OkO|z-DotwH?no{>+PqrN6p4m
zN&`AnJTduSN7v>z`#_^Xu?B6JTu}ll9xR`&XMu;|T*7%c$8Z53I<E-s9EM&NE~AKc
z;BN=M@9_xQUn0F<%7D?1nO%Z=yWx7Vf7ydx-%l5;I#yMe$6L6&`@0+=lYlWUW-tUZ
zN8v%boJfV1IO0px{1#!lGpHd_GKQNs5C)1_<t~A=>If1gr)V`)_n*C1dEbNni%fMj
ztnxV1(IQ- at A_Zk|Gkyn?_g5ulO6+)3q5ihlr?Sz4c2>ty`@!2e$@ELvVVrcQRPdsh
zRhZ({>(ecc)7Wt<GZfaSG?zj{9GGx^BstAmYRoEUZ;R#7t`S)dwMu3xU|54;lU)2*
zNeYUA3%I0K3#DNCL_#DL2p2ej=g@~98P8;$mQ++q&=!Tyh0<c9mxzglsl#AWpw}wB
zL=|XiwiDv0Yit05PljBkP7Yo66EGV|hY1r6MpB>Q8ij$W;^Bhusua{Nwixk)G#kYY
z(Uh*&bW9bL4CT at 8G~~avVP4Ds(2hCOW=^NJ(ws-_#JZr6CJh;3-EYy#eC+%7j$l&j
za=4=_o at n1Z%(dmjj*ql*JPZt-2Xa?Qb;5j`8}Yg(dXUXgjVv&|QpZjLvI$0`@%>?u
z%ezl=_ at s{TkjIgv-vT?GQMs{L%UWO`!&V`=;D){s{I*Vf#OZXE*)H!|=AQC6m?1=R
NB^XeVE3=uX{{YL7tK|Ry

literal 0
HcmV?d00001

diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index 2f3c464..1dc5643 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -1,18 +1,20 @@
 #!/bin/sh
 # post-build fixups
-# for furthe details, see
-# http://boundarydevices.com/u-boot-conventions-for-i-mx6-nitrogen6x-and-sabrelite/
+# for further details, see
+#
+#  http://boundarydevices.com/u-boot-on-i-mx6/
+#
 
 TARGET_DIR=$1
 IMAGES_DIR=$1/../images
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-cp $BOARD_DIR/6q_bootscript $TARGET_DIR
+cp $BOARD_DIR/6x_bootscript $TARGET_DIR
 
 # u-boot / update script for bd upgradeu command
-if [ -e $IMAGES_DIR/u-boot.bin ];
+if [ -e $IMAGES_DIR/u-boot.imx ];
 then
-    cp $IMAGES_DIR/u-boot.bin $TARGET_DIR
-    cp $BOARD_DIR/6q_upgrade $TARGET_DIR
+    cp $IMAGES_DIR/u-boot.imx $TARGET_DIR
+    cp $BOARD_DIR/6x_upgrade $TARGET_DIR
 fi
-- 
1.8.1.2
