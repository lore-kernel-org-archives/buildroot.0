From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:40 +0200
Subject: [Buildroot] [PATCH v2 11/13] board/boundarydevices: rework and
	update u-boot scripts
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432628382-16799-12-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those scripts are executed by u-boot in order to detect the hardware
configuration (board, displays etc...), configure the bootargs and
device tree accordingly or update the bootloader located in NOR flash.

This update is necessary due to the kernel bump to version 3.10.53.

The rework consists of replacing the binaries by their text file
equivalent and generate the binaries from the post-build.sh script.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 3207 -> 0 bytes
 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 186 +++++++++++++++++++++
 .../nitrogen6x/{6x_upgrade => 6x_upgrade.txt}      | Bin 1465 -> 1393 bytes
 board/boundarydevices/nitrogen6x/post-build.sh     |   6 +-
 configs/nitrogen6x_defconfig                       |   1 +
 5 files changed, 191 insertions(+), 2 deletions(-)
 delete mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript
 create mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript.txt
 rename board/boundarydevices/nitrogen6x/{6x_upgrade => 6x_upgrade.txt} (92%)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript b/board/boundarydevices/nitrogen6x/6x_bootscript
deleted file mode 100644
index 05442a6b0eeffafabdf8857fc57fed73b5b6cbac..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 3207
zcmd5<&2HO95H<p&fQTG>>1|37=%JEKGO{YfAW|oB+yL<<0g~Q?C3h(;Omby%B~vwY
z=u70#C+exUK1ko7vr8^XF^XZghjuR_IkWTo&5yo&{LP2o|MEY*|Lxa5kB**P9M$LR
zN8TTgAANNc3L&A0a=wy=)cbw%Tz%j%IJa at JO9Y|#MCEqHcItr_SG#8(c<#(q2iE7=
zW-Lnyry!Rsvj7jvHo()B$R&(q%j(2DVFmw%Su81-<}8?0%*rZ~FABU#!i3Fl2$%Cz
zP!@<dwqkBsHDks~8Ho(sQ_JFh1e9&SgHsF5Rj;dDgbdvB#5Lv&`Wl=@*M?Ijg0zg{
z(7CMz@1CK=U`bOx^!%Ay{@}ZpKTh2tkArs?FZ_vR<i%miQn2+;;Lk4Y(~4BCaxg|Z
z=HYwrDwhW=S_-g7`amY&r&pJ6AQc&xB1aL*Q{$H3cgmgoE2k0~4&T0dG5Y!9tafKQ
zomvBooMeRr+qGfDuE7{xr*m-7Vb9eL>ooQ_5H%_^yCL#e19V6Wcwksw=ZqB*Nf;pB
zRtedf*zBkI>8y!}0)X;kT!39FH$S4EHUt5_IxCW~#O{040O3B6P|?$fK-gctYayXy
zIKYBpEX!FDD4rqmScCoGJY1RUPs%AOyF(YU43VV@^M9O3gOdY}#`2_er*m11+c-JR
zqlRFcJ49i|RMIg0Jj{vYBD0$`-%Cs9X3!O*<5Z=kUx$^6AjLXb0yY?#izH!9N$$gL
z@&(vkZx&=9a;@DpjsyFt at 0R{#4 at 3S$b&nb^4dctVXJ at 02AG+15*i1!ryXL(B9MPdu
z3;&;1J(f*5nYq21zggncsC(3;LWk*57+xxxmV5wthg&?(6dW0M_9diKk+Ej(9FXnk
zK4%6~!(g|`KpYh!VS$ueoHE|f^G<x6n46R&iHL#;7PrEh;t3OyT?H=WI0)77vvCfz
z9j(+dR|MxNHng%ql~Ss{23|EeOe-&lR6qpV4DPmo`s1);uF at SG<NP}=C}}j})plH~
z;okI_brBv`qPV)}AL%p#bXk}e^LsCeX&QyemAl$=#Yn(1Qp1+YFe51oY at U`=EU#|R
zr|;ogJwBq<x(%SYp+c+g?yg65ga)6}3ZyALUAgs83I)k&D_6e;1qpMOU^i5^J{RZQ
zYPQ`NNooV?Ktv-$(S@Wu-|b-pKLp2$a%_ybd$&WB>fNpt=hU_|VwYsY at LS;3g at o-W
zrgBaw&2j(oyh=h-n~JvNizU+H`qUed5o9bglc1~|Ql)Y;&qNk6(kSnzzb!eev$@*d
z#v)6$bG)Msth&AW1TW9eaNnY=04<qOz->}*VQO7P1nlAMA&PJ%HQ=iBq0yr+sv81X
zQ!XGSTfmi-#4(E`qi8 at 4m%B4$w(mAW>o+M`uqH%ZXgGC at _nXH+0U~X;^L7OF2qW-n
gK<Md%_Er9!=efv1{XyW_0<Kt&OBSyEXoYS44XUZ}y8r+H

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript.txt b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
new file mode 100644
index 0000000..ac86fe5
--- /dev/null
+++ b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
@@ -0,0 +1,186 @@
+setenv bootargs ''
+
+if ${fs}load ${dtype} ${disk}:1 10800000 uEnv.txt ; then
+    env import -t 10800000 $filesize
+fi
+
+if itest.s "x" == "x$dtbname" ; then
+	dtbname="imx6";
+	if itest.s x6SOLO == "x$cpu" ; then
+		dtbname=${dtbname}dl-;
+	elif itest.s x6DL == "x$cpu" ; then
+		dtbname=${dtbname}dl-;
+	else
+		dtbname=${dtbname}q-;
+	fi
+	if itest.s x == "x$board" ; then
+		board=sabrelite
+	fi
+	dtbname=${dtbname}${board}.dtb;
+fi
+
+if itest.s x == x${bootdir} ; then
+	bootdir=/boot/
+fi
+
+setenv fdt_addr 0x12000000
+if ${fs}load ${dtype} ${disk}:1 $fdt_addr ${bootdir}$dtbname ; then
+	fdt addr $fdt_addr
+	setenv fdt_high 0xffffffff
+else
+	echo "!!!! Error loading ${bootdir}$dtbname";
+	exit;
+fi
+
+# ------------------- HDMI detection
+i2c dev 1 ;
+if i2c probe 0x50 ; then
+	echo "------ have HDMI monitor";
+	if itest.s x == x$allow_noncea ; then
+		setenv bootargs $bootargs mxc_hdmi.only_cea=1;
+		echo "only CEA modes allowed on HDMI port";
+	else
+		setenv bootargs $bootargs mxc_hdmi.only_cea=0;
+		echo "non-CEA modes allowed on HDMI, audio may be affected";
+	fi
+else
+	fdt rm hdmi_display
+	echo "------ no HDMI monitor";
+fi
+
+# ------------------- LVDS detection
+if itest.s "x" != "x$lvds_1080p" ; then
+	echo "----- 1080P dual channel LVDS";
+	fdt rm okaya1024x600
+	fdt rm lg1280x800
+	fdt rm hannstar;
+	fdt set ldb split-mode 1
+	fdt set lvds_display interface_pix_fmt "RGB24"
+	fdt set ldb/lvds-channel@0 fsl,data-width <24>
+else
+	fdt rm ldb split-mode
+	fdt rm lvds1080p
+
+	# -------- LVDS0 (bottom on Nitrogen6_Max)
+	setenv have_lvds
+	i2c dev 2
+	if i2c probe 0x04 ; then
+		echo "------ have Freescale display";
+		setenv have_lvds 1
+	else
+		echo "------ no Freescale display";
+		fdt rm hannstar;
+	fi
+
+	if i2c probe 0x38 ; then
+		if itest.s "xLDB-WXGA" == "x$panel"; then
+			screenres=1280,800
+			fdt rm okaya1024x600
+		else
+			screenres=1024,600
+			fdt rm lg1280x800
+		fi
+		setenv have_lvds 1
+		setenv bootargs $bootargs ft5x06_ts.screenres=$screenres
+		if itest.s "x" -ne "x$calibration" ; then
+			setenv bootargs $bootargs ft5x06_ts.calibration=$calibration
+		fi
+	else
+		echo "------ no ft5x06 touch controller";
+		fdt rm okaya1024x600
+		fdt rm lg1280x800
+	fi
+
+	if itest.s "x" == "x$have_lvds"; then
+		fdt rm lvds_display;
+	fi
+
+	# -------- LVDS1 (top on Nitrogen6_Max)
+	if itest.s "xhannstar" == "x$lvds1_panel" ; then
+		echo "configure LVDS1 for Hannstar panel"
+		fdt rm okaya1024x600_2;
+		fdt rm lg1280x800_2;
+		fdt set lvds_display_2 status okay
+	elif itest.s "xokaya1024x600" == "x$lvds1_panel" ; then
+		echo "configure LVDS1 for 1024x600 panel"
+		fdt rm hannstar_2;
+		fdt rm lg1280x800_2;
+		fdt set lvds_display_2 status okay
+	elif itest.s "xlg1280x800" == "x$lvds1_panel" ; then
+		echo "configure LVDS1 for 1280x800 panel"
+		fdt rm hannstar_2;
+		fdt rm okaya1024x600_2;
+		fdt set lvds_display_2 status okay
+	else
+		fdt rm lvds_display_2 ; # ignore errors on boards != 6_max
+	fi
+fi
+
+# ------------------- LCD detection
+setenv have_lcd '';
+if i2c probe 0x48 ; then
+	setenv have_lcd 1;
+	echo "------- found TSC2004 touch controller";
+	if itest.s "x" -eq "x$tsc_calibration" ; then
+		setenv bootargs $bootargs tsc2004.calibration=-67247,-764,272499173,324,69283,-8653010,65536
+	else
+		setenv bootargs $bootargs tsc2004.calibration=$tsc_calibration
+	fi
+elif i2c probe 0x4d ; then
+	setenv have_lcd 1;
+	echo "------- found AR1020 touch controller";
+fi
+
+if itest.s "x" != "x$ignore_lcd" ; then
+	echo "------ ignoring LCD display";
+	setenv have_lcd '';
+fi
+
+if itest.s "x" != "x$have_lcd" ; then
+	echo "----- found LCD display";
+else
+	fdt rm lcd_display;
+fi
+
+setenv bootargs "$bootargs console=ttymxc1,115200 vmalloc=400M consoleblank=0 rootwait"
+
+if itest.s x$bootpart == x ; then
+	bootpart=1
+fi
+
+if test "sata" = "${dtype}" ; then
+	setenv bootargs "$bootargs root=/dev/sda$bootpart" ;
+else
+        if test "usb" = "${dtype}" ; then
+                setenv bootargs "$bootargs root=/dev/sda$bootpart" ;
+        elif itest 0 -eq ${disk}; then
+                setenv bootargs "$bootargs root=/dev/mmcblk2p$bootpart" ;
+        else
+                setenv bootargs "$bootargs root=/dev/mmcblk3p$bootpart" ;
+        fi
+fi
+
+if itest.s "x" != "x${disable_giga}" ; then
+	setenv bootargs $bootargs fec.disable_giga=1
+fi
+
+if itest.s "x" != "x$wlmac" ; then
+	setenv bootargs $bootargs wlcore.mac=$wlmac
+fi
+
+if itest.s "x" != "x$gpumem" ; then
+	setenv bootargs $bootargs galcore.contiguousSize=$gpumem
+fi
+
+if itest.s "x" != "x$show_fdt" ; then
+	fdt print /
+fi
+
+if itest.s "x" != "x$show_env" ; then
+	printenv
+fi
+
+if ${fs}load ${dtype} ${disk}:1 10800000 ${bootdir}uImage ; then
+	bootm 10800000 - $fdt_addr
+fi
+echo "Error loading kernel image"
diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade b/board/boundarydevices/nitrogen6x/6x_upgrade.txt
similarity index 92%
rename from board/boundarydevices/nitrogen6x/6x_upgrade
rename to board/boundarydevices/nitrogen6x/6x_upgrade.txt
index 395f13faee825d22c4104d91af785436f59a745c..3f1b96ff3401219cc8a9606a9adffa872d3401f6 100644
GIT binary patch
delta 8
PcmdnV{gG><M<FW!5O@PG

delta 80
zcmey!wUgUJomDdI;@(At!9kmDGcd4LGC%=OWoj2I6B|QPetwBUadJ^+K?zI>jb<$b
J32Z221pp@&4|)Iq

diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index 2b43aa3..f68fa0e 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -8,11 +8,13 @@
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-install -D -m 0644 $BOARD_DIR/6x_bootscript $TARGET_DIR/6x_bootscript
+$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+-n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
 
 # u-boot / update script for bd upgradeu command
 if [ -e $BINARIES_DIR/u-boot.imx ];
 then
     install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
-    install -D -m 0644 $BOARD_DIR/6x_upgrade $TARGET_DIR/6x_upgrade
+    $HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+    -n "upgrade script" -d $BOARD_DIR/6x_upgrade.txt $TARGET_DIR/6x_upgrade
 fi
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index d04745d..71b01f0 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -6,6 +6,7 @@ BR2_cortex_a9=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.1.4
