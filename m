Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B9DC0219B
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D022A42C33;
	Fri,  7 Feb 2025 17:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZpvNhq--nbu; Fri,  7 Feb 2025 17:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA7442BEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA7442BEC;
	Fri,  7 Feb 2025 17:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3007B1B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1534741831
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVz2RljN-rCT for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22A1341824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A1341824
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22A1341824
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mBQ-1tHJHQ2x4O-00tSHB; Fri, 07
 Feb 2025 18:15:12 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Fri,  7 Feb 2025 18:14:58 +0100
Message-ID: <20250207171458.1127620-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207171458.1127620-1-fiona.klute@gmx.de>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9GCae1wu5ywwtp1uTH3POLpFCgl6DNyxAm6EKqOnDysFOIM00bp
 1OcbUP1hTNO+STp/0Rdg+DSDwDwGAPM0h85wdy59maI/MsNn/UmvuCaAq3qk0Hy2VVN9Oe1
 eyeNqyfMQXRWOnj6hFssItOaYRw3+FElwjL2Z2m4AC21Y3Vg7020kVa2nzzOsdfxI8Ksovm
 s8fJHmivu+8zpN0h/n4jA==
UI-OutboundReport: notjunk:1;M01:P0:GsLPfqW7Xzs=;f7sKsfUIzTPV3CcF37Mr81p+0aw
 B+fRjkmUDW93K3/N5kvjuS2P7qwGj4VFgUGFuwJzQ7NgdLFWza5hfMneHoSHAF3kbovFlX5+G
 F7wOxLGfhyX0M6M6jqApof76FnRd47nVn9bkSk+gLEDoyuP3XU0+GAprH/4pgcRqKslvgXhcd
 3BiI5X6O65vc6fCwKb1HeV88sndFzNqrd+Yu/UBff+n8sgPfrVmfmE8RVvElZ1pUx8YGTDoQ4
 XX8leDDyuVOP22CP4RgYpguhHYWU/1GDY0jd4sWp4HLc+npGq99WBaCrHrCN1UwJKPQLlkqpn
 yqC0luwMWCL95DaKoXu6alg/jeWDHUK7fVQjsUFwoo6ZZhnrGbTQg0nstL9HBb8C1I/In7jxm
 ylqGvL9XQ4ydryTPMZMBKdODUNOMi2NKVOZXW8bqwdaU/L274t+yp4k+qgvhF/6s5dxx4h9ey
 UFJSC6OLwEQJH6ECu50dobTJ+TGu/sG9HpJbUcwmYVInHsMUwULIp0mPb9U4x5jC5955xUnPx
 xRPzLp++vbxrBhX6qG4ymb44Et/WczOr9S3Sdg0KVMcXpr19Ng1qIE18r2GMEU1dLwjFqppGH
 EpZcvUcHBD6QxqBeFSjpxex51JfY3rGPkdiGJ5MaEhx51Sb/VzfmXbXvmYhVftVN+gQouSp3Y
 SZSDcMWBAA1NeyJbFSjNzhh+LM4KZBIGeTmnP0qMVec0zf60mwuQthmgRL4ETfFGjWa1uPDjg
 sg++KBBbMtiN9VbxCRrSU5eIdyIsvcfLPPZyg25p8Qz77CZh69T329O7UewL01FOqnCtENQis
 tudRPInQsJYjQV9lXLSCSY48UTHnmwhwa6EXEJtskd/HArFBUfs1EplwdZqMPEujbsAI/nWjN
 3qy+CcXbu04lE3ibZgG+3wnh30zCicdAxVrD48jw5rhPEXLSZ3RYcziIuEQdj9Av2sltqdUtE
 o88BA7ve28GB6TllWRw+CRhyN6El18mp4Y7pI/+p6DtUPflohdgTk09i+bX0ySh0q+1+SubS1
 4JOm1swJdKpqziSMHtPW6CB7vQzGnptHljNZFVJA6mF2hDrFJuZsc/BCVw96f8SM4/fKXdSUd
 6t8Fb5D6MRG7zfDJYiRct6oENIO9cEtQrt+m0esCH6Y64/zdOeBPNuIjWSHuAvyrHHdS2Zix/
 8U9TdrBwYPwHv1aKrTlHRUP6T0T2pzMPy+beg48RNKFHJtJdU5GVpXJr/QKVymgztfbQaGL2r
 cimwt/X51/vGLlmyuBFuE6rr8U9BG/c5X/oCGv6GV1GE9bTJRqqkYCfCzfIuqmndMeVKP4LcC
 //gHjw3huW2TRBBDQG6C95E+ybJAJXolmXnExI0wXIzEn/dOa6FMVWqofcb0t2R46cpUwt9Rs
 4RiOMWf47l1FOsgBeXPMU8UauTITz6jyAkRp/9liwpPMhJ82Hc9NKjBww1C8IjOIrSx4NCLSN
 sjdnQcw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738948513; x=1739553313; i=fiona.klute@gmx.de;
 bh=2rMBcvRLegg2hwwgmujDda9t0yEfKoNfU63jsJJjt1g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YlQzxubab/B7cDTUd6mjExr/P8lys4vAyRDf67tOaucPDYGYGwmE+B8SgdvQZgSq
 SoSCRPH4pIUPEFnC2RpGLvWAyPmOLxlpsM31fr+H9M+2xHlMt/HW8TXySZs46O0BY
 2XjkvAXWnPmBhO+pm2CwarWw1OJIYnWirhxRFdDszvBvGCFeczlUUyxkBX6Koajfn
 JpaKmBkdHbOLe5b/H9iSoahR/8lDkx+XXchBGtn2abpAomm2wg0Bk+R+5cwl5WnNK
 uzy08WpoURJDXk5zTdagLcFcYXMYebVkPxrXd3avvx2JWPxAIoB2obyrqnepCVZgs
 NJZ9kuhpAFD2Ze+W9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YlQzxuba
Subject: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The new config deviates from the existing
configs/raspberrypicm4io_64_defconfig only as far as necessary to
demonstrate booting through U-Boot instead of having the firmware load
the kernel directly. The sample boot script loads the kernel from the
rootfs and uses the device tree provided by the firmware, and should
be compatible with any RPi device that runs U-Boot.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
The config I'm usually using is a bit different, including using a
mainline kernel (which seems strongly preferable to me), but for
defconfig maintenance staying close to the other RPi defconfigs is
probably easiest.

Changes v2 -> v3:
* Regenerate defconfig according to current standards
* Modify boot.scr.in so the script should work on any RPi device

 board/raspberrypi/boot.scr.in                 | 18 +++++++++
 .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++++++
 board/raspberrypi/readme.txt                  |  4 ++
 configs/raspberrypicm4io_64_uboot_defconfig   | 40 +++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 board/raspberrypi/boot.scr.in
 create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
 create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig

diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
new file mode 100644
index 0000000000..1ba733ceaa
--- /dev/null
+++ b/board/raspberrypi/boot.scr.in
@@ -0,0 +1,18 @@
+# Please note that this is only a sample, we recommend you to change
+# it to fit your needs. You should override this file using
+# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
+
+# On most Raspberry Pi boards UART0 is ttyAMA0, Raspberry Pi 5 is
+# different.
+if test "$board_name" = "5 Model B"; then
+    env set serial_uart "ttyAMA10,115200"
+else
+    env set serial_uart "ttyAMA0,115200"
+fi
+env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=${serial_uart}"
+
+# load kernel from the root partition
+load mmc 0:2 ${kernel_addr_r} boot/Image
+
+# boot using the FDT provided by firmware
+booti ${kernel_addr_r} - ${fdt_addr}
diff --git a/board/raspberrypi/config_cm4io_64bit_uboot.txt b/board/raspberrypi/config_cm4io_64bit_uboot.txt
new file mode 100644
index 0000000000..eef929186c
--- /dev/null
+++ b/board/raspberrypi/config_cm4io_64bit_uboot.txt
@@ -0,0 +1,23 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=u-boot.bin
+
+# Enable UART0 for serial console on ttyAMA0
+dtoverlay=miniuart-bt
+
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 64f0e2a26f..6bf76df2ef 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -69,6 +69,10 @@ or for CM4 (on IO Board - 64 bit):
 
   $ make raspberrypicm4io_64_defconfig
 
+or to boot CM4 (on IO Board - 64 bit) using U-Boot:
+
+  $ make raspberrypicm4io_64_uboot_defconfig
+
 For model 5 B:
 
   $ make raspberrypi5_defconfig
diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
new file mode 100644
index 0000000000..056c9051b6
--- /dev/null
+++ b/configs/raspberrypicm4io_64_uboot_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit_uboot.txt"
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_arm64"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/raspberrypicm4io-64/boot.scr.in"
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
