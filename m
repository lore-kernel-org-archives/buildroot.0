Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA99C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE33560730;
	Sun, 14 Jul 2024 16:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkjdvbLkyO4j; Sun, 14 Jul 2024 16:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B675D60792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B675D60792;
	Sun, 14 Jul 2024 16:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 584281BF4E7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53061811CB
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lXVr8XVbXmm for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14E5E811CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E5E811CA
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14E5E811CA
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 04B605122E;
 Sun, 14 Jul 2024 23:05:22 +0700 (WIB)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 70298323E1;
 Sun, 14 Jul 2024 23:05:21 +0700 (WIB)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 23:04:54 +0700
Message-ID: <20240714160457.39434-3-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714160457.39434-1-foss@athaariq.my.id>
References: <20240714160457.39434-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received; s=dkim20240121; t=1720973121; x=1722182722; bh=TfAhwn
 5Lu+qUG/wN6bhb/lUB2pz16yoCfqPp+4QqUDg=; b=1wtG8ZWYeBosM1CB3XcTRK
 obBdYUhRxhajFYijKX8sOuV5YdNfgSo8XVpUDZcWpHp0hsmwLRR5ffdMhaaQ2XOz
 0+6avPk0NHTkKyPE8yEPCAMqlyfIucwYbOyxT5bdTuk43geoNCDQAZaXhRNtLV0R
 YHp7dZv3Vj2tnzQhLiR62Z+Ajr2grQSwv+HCS9ESNdj/nKyQBH+/SwgVxLs2JMoP
 ok7FuoFAqOhqZ+X9wnlmiGHWCxUFuBLMWbuoUWgGBAstaMCZZgf1cqJkc/VtLwzt
 bjZrNAnst7wVCPjOn83fMxikEYjkkrFKFHPz9bCod+fwTyUJfT4VN+8HM0+1xdgQ
 ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=1wtG8ZWY
X-Mailman-Original-Authentication-Results: mail.selirafood.com (amavisd-new); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=athaariq.my.id
Subject: [Buildroot] [PATCH v4 3/3] board/raspberrypi: add support for
 Raspberry Pi 5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the last Raspberry Pi 5 submission has no progress, I'm submitting
these patches anyway. The newly released Raspberry Pi 5 board shares
similar software structure except it has less proprietary API.
Therefore, rpi-userland and all of raspberry-centric GPIO utilities are
no longer supported.

Keep in mind that RPi 5 has no native 32-bit support due to Cortex-A76
processor specification. That is the reason why I did not add _64.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing newlines due to terminal issue

Changes v3 -> v4:
  - Rebase to master
  - Drop 4K page size, until we figured out how to run 32bit userspace
    on top of 64bit kernel
  - Change back from commit ID to commit tag
  - Rewrite the commit description
  - Fix incorrect CPU from upstream config, RPi5 has no LITTLE.big

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 board/raspberrypi/config_5.txt                | 42 +++++++++++++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 -
 board/raspberrypi/patches/linux/linux.hash    |  2 +-
 configs/raspberrypi5_defconfig                | 17 ++++----
 4 files changed, 50 insertions(+), 12 deletions(-)
 delete mode 120000 board/raspberrypi/patches/linux-headers/linux-headers.hash

diff --git a/board/raspberrypi/config_5.txt b/board/raspberrypi/config_5.txt
index bbed19fe46..738c2198c8 100644
--- a/board/raspberrypi/config_5.txt
+++ b/board/raspberrypi/config_5.txt
@@ -9,6 +9,48 @@ kernel=Image
 # To use an external initramfs file
 #initramfs rootfs.cpio.gz
 
+# Automatically load initramfs files, if found
+auto_initramfs=1
+
+# Uncomment some or all of these to enable the optional hardware interfaces
+#dtparam=i2c_arm=on
+#dtparam=i2s=on
+#dtparam=spi=on
+
+# Enable audio (loads snd_bcm2835)
+dtparam=audio=on
+
+# Automatically load overlays for detected cameras
+camera_auto_detect=1
+
+# Automatically load overlays for detected DSI displays
+display_auto_detect=1
+
+# Enable DRM VC4 V3D driver
+dtoverlay=vc4-kms-v3d-pi5
+max_framebuffers=2
+
+# Don't have the firmware create an initial video= setting in cmdline.txt.
+# Use the kernel's default instead.
+disable_fw_kms_setup=1
+
 # Disable overscan assuming the display supports displaying the full resolution
 # If the text shown on the screen disappears off the edge, comment this out
 disable_overscan=1
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtparam=krnbt=on
+
+# enable 64bits support
+arm_64bit=1
+
+# Run as fast as firmware / board allows
+arm_boost=1
+
+# Raspberry PI 5 won't use UART0 as terminal out of the box. We need to enable
+# this through config.txt
+enable_uart=1
+dtoverlay=uart0-pi5
diff --git a/board/raspberrypi/patches/linux-headers/linux-headers.hash b/board/raspberrypi/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/raspberrypi/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 8d43c25151..fc7338d0d0 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dab3052783c68c46a5bc645b1c38d9705da995ab42823566518b62eb1fa1ef97  linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz
+sha256  05ac851ea9b720ba44c66eb88cdcb7cbd280401b1dd1fab3391a3883e4719197  linux-stable_20240529.tar.gz
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 3c88ce46cd..0517fcd36b 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -1,8 +1,9 @@
 BR2_aarch64=y
-BR2_cortex_a76_a55=y
-BR2_ARM_FPU_VFPV4=y
+BR2_cortex_a76=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 BR2_SYSTEM_DHCP="eth0"
 
@@ -10,9 +11,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,stable_20240529)/linux-stable_20240529.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 
 # Build the DTB from the kernel sources
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
 
@@ -45,6 +45,3 @@ BR2_PACKAGE_KMOD_TOOLS=y
 BR2_PACKAGE_XZ=y
 BR2_PACKAGE_KMOD=y
 BR2_PACKAGE_HOST_KMOD_XZ=y
-
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_GLOBAL_PATCH_DIR="board/raspberrypi5/patches"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
