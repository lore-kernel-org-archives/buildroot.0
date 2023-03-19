Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED04C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 09:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C6F81453;
	Sun, 19 Mar 2023 09:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C6F81453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1A-aUw7AYOQL; Sun, 19 Mar 2023 09:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D8E80D6B;
	Sun, 19 Mar 2023 09:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D8E80D6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11B721BF2C5
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 09:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D826660A98
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 09:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D826660A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSPapAIKWuCH for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 09:28:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D323A607F1
 for <buildroot@uclibc.org>; Sun, 19 Mar 2023 09:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D323A607F1
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id C00D086B6F; Sun, 19 Mar 2023 09:28:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 19 Mar 2023 09:28:39 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freemp@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15456-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15456] New: No more login on Raspberry Pi 3 since
 2023.02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15456

            Bug ID: 15456
           Summary: No more login on Raspberry Pi 3 since 2023.02
           Product: buildroot
           Version: 2023.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: freemp@freenet.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9541
  --> https://bugs.busybox.net/attachment.cgi?id=9541&action=edit
Console output

I was building raspberrypi4_defconfig with systemd as init system and bash as
shell. Here's the config diff:

$ git diff
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 0a59ab42a9..2940ee52fb 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -1,39 +1,31 @@
 BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
-
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
+BR2_DL_DIR="$(TOPDIR)/../buildroot_dl"
+BR2_CCACHE=y
+BR2_INIT_SYSTEMD=y
+BR2_SYSTEM_BIN_SH_BASH=y
 BR2_SYSTEM_DHCP="eth0"
-
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus
bcm2710-rpi-cm3"
-
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
 BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3.txt"
-
-# Required tools to create the SD image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y


The resulting system image does not allow to login (entire console log
attached):

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.92-v7 (*******)
(arm-buildroot-linux-gnueabihf-gcc.br_real (Buildroot 2023.02) 11.3.0, GNU ld
(GNU Binutils) 2.38) #1 SMP Sun Mar 19 09:32:14 CET 2023
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Rev 1.2
[    0.000000] random: fast init done
[    0.000000] Memory policy: Data cache writealloc
...
[  OK  ] Started D-Bus System Message Bus.
[   11.490042] random: dbus-daemon: uninitialized urandom read (12 bytes read)
[  OK  ] Started Serial Getty on ttyAMA0.
[  OK  ] Reached target Login Prompts.
[   11.591252] random: dbus-daemon: uninitialized urandom read (12 bytes read)
[  OK  ] Started Network Configuration.
[  OK  ] Reached target Multi-User System.
[  OK  ] Reached target Network.
[   12.040785] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl
0x50

Welcome to Buildroot
buildroot login: root
[   16.761152] random: crng init done
[   16.826639] audit: type=1701 audit(1671560156.029:7): auid=4294967295 uid=0
gid=0 ses=4294967295 pid=189 comm="bash" exe="/usr/bin/bash" sig=11 res=1

Welcome to Buildroot
buildroot login:

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
