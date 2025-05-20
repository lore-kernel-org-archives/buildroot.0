Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67443C71141
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F36E61097;
	Thu, 12 Jun 2025 08:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFOUR_L2Zeff; Thu, 12 Jun 2025 08:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347D9615AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347D9615AB;
	Thu, 12 Jun 2025 08:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AF71E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD6944210A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD096pX209Ha for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D876B40445
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D876B40445
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4C2E80588; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:42:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db1b8130c71cf69ce6e12b6070e3bbb7cce6ff25
X-Git-Newrev: fd5628e5dc7d8fb38aa8939421f4bf8ae8530dff
X-Patchwork-Hint: ignore
Message-Id: <20250612083828.D4C2E80588@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypicm5io: new defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6332534187366224906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6332534187366224906==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd5628e5dc7d8fb38aa8939421f4bf8ae8530dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration builds an image for the Compute Module 5 IO Board.

Note: Unlike the Raspberry Pi 5 and its dedicated debug uart connector,
the kernel console on Compute Module 5 IO Board is back to UART0
(ttyAMA0) on PIN8 (GPIO14, TX, yellow) and PIN10 (GPIO15, RX, orange) on
the 40-pin header, as the former version of the Raspberry Pi.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/config_cm5io.txt | 24 ++++++++++++++++++++++++
 board/raspberrypi/readme.txt       | 37 +++++++++++++++++++++++++++++++++++++
 board/raspberrypicm5io             |  1 +
 configs/raspberrypicm5io_defconfig | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/board/raspberrypi/config_cm5io.txt b/board/raspberrypi/config_cm5io.txt
new file mode 100644
index 0000000000..b66efef661
--- /dev/null
+++ b/board/raspberrypi/config_cm5io.txt
@@ -0,0 +1,24 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
+
+# Enable UART0 for serial console on ttyAMA0
+dtparam=uart0_console=on
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 7dda631387..31ff424a83 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -20,6 +20,7 @@ These instructions apply to all models of the Raspberry Pi:
   - the model CM4s (aka Raspberry Pi Compute Module 4s).
   - the model B5 (aka Raspberry Pi 5).
   - the model 500 (aka Raspberry Pi 500).
+  - the model CM5 (aka Raspberry Pi Compute Module 5 and IO Board).
 
 How to build it
 ===============
@@ -86,6 +87,10 @@ For model 5 B and 500:
 
   $ make raspberrypi5_defconfig
 
+For model CM5 (on IO Board):
+
+  $ make raspberrypicm5io_defconfig
+
 Build the rootfs
 ----------------
 
@@ -123,6 +128,8 @@ After building, you should obtain this tree:
     +-- bcm2712-rpi-5-b.dtb         [1]
     +-- bcm2712d0-rpi-5-b.dtb       [1]
     +-- bcm2712-rpi-500.dtb         [1]
+    +-- bcm2712-rpi-cm5-cm5io       [1]
+    +-- bcm2712-rpi-cm5l-cm5io      [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
@@ -197,3 +204,33 @@ for CM4 modules with eMMC memory proceed as following:
 - power down CM4/IO Board
 - remove jumper on IO Board header J2 to re-enable eMMC boot
 - power up CM4/IO Board
+
+CM5 debug UART
+==============
+
+The debug UART header is not assembled on the Compute Module 5.
+
+	2.23. Debug UART
+
+	Space is provided for the user to fit a debug UART connector. This
+	connector provides the same functionality as Raspberry Pi 5. The
+	connector is a three-pin 1mm pitch JST-SH connector, Part number
+	BM03B-SRSS-TB. The signals are replicated on the bottom as test points.
+
+	Appendix B: Test Points
+
+	| Reference | X   | Y    | NAME          |
+	| TP35      | 11  | 37.8 | DEBUG_UART_TX |
+	| TP36      | 8.5 | 37.1 | DEBUG_UART_RX |
+
+	Debug UART
+
+	TP35 and TP36 are a TX and RX of the debug UART. TP46 should be used as
+	the ground. It is very useful to have access to these pins during
+	programming and initial boot.
+
+See https://datasheets.raspberrypi.com/cm5/cm5-datasheet.pdf.
+
+The signals are not wired up to 100-pin headers either. And thus, it is
+impossible to output early boot traces in the EEPROM firmware without
+assembling a JST-SH connector (or using the test points).
diff --git a/board/raspberrypicm5io b/board/raspberrypicm5io
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypicm5io
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
new file mode 100644
index 0000000000..9bfde8f501
--- /dev/null
+++ b/configs/raspberrypicm5io_defconfig
@@ -0,0 +1,35 @@
+BR2_aarch64=y
+BR2_cortex_a76=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-cm5-cm5io broadcom/bcm2712-rpi-cm5l-cm5io"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm5io/config_cm5io.txt"
+BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE="board/raspberrypicm5io/cmdline.txt"
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y

--===============6332534187366224906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6332534187366224906==--
