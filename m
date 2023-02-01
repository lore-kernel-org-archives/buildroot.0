Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A2DC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BE4812F9;
	Wed,  1 Feb 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BE4812F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odwcvsdyHAgA; Wed,  1 Feb 2023 20:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F6E3812E6;
	Wed,  1 Feb 2023 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F6E3812E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90F7C1BF3D0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B76240947
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B76240947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbQ1t6_0bVh2 for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 20:48:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B4B240921
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B4B240921
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 20:48:55 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MOzCW-1p09Pj2Zae-00PPXU; Wed, 01
 Feb 2023 21:48:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 21:48:47 +0100
Message-Id: <20230201204848.2099336-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201204848.2099336-1-laurent@vivier.eu>
References: <20230201204848.2099336-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KjWbJS+I/yuvTSUtKtjonnKFInjiqq1G4WHW8Ms2vGaS4Z/SuA1
 AWgS2Z+NUvHQAVHLHW71OyP5KE1at8tPk86+vVjscvEZzahshv+XDDF+JXx2SmvyiNy7GdN
 P88EbRXsI8JP7o/XLVRLAtoVcwqMBioyt+X9T7K+LcH7ToE2zwvtp/9H+8wpSKjFRm/Nve0
 BDmgCzzGm7FihkJw6tDHA==
UI-OutboundReport: notjunk:1;M01:P0:OpqTBUIoTGc=;W2npnKhp4mt9WKXvTwbJfbjWZ6U
 /0YseNGz0SsTzlvRt5emqtC/1CqQmTWmAp6ZLEQn+Uu0nEv1G2pKTIV+Mv8zjxAU2TtF48Dkt
 0Y2l3NQ5inNyY1NXYzra1fjXzfEmpyQBGREjaexC1rBAky01d6gUkYQ4bKOxC6DMNuZ8InxHd
 Gu/Hxf3WsKIBpNMhzKKdKzmNirxJhrzoF7wxEMqBcd6S2w4cEj6yFoYtkCbq6EcmFdbygrdN9
 dEC2KBwrtiEycKNL7cjHBaJc3R+CFM0aXxcZz8qo61/waAGB2kn8j9WlPLVeuu/RU4xN7x+v1
 CKeEimGwABB1HH8X6iSXcMgq0aQU//MK1fWO4P9aNQ5lO8sNF2j86cuZX+jtGjS6510RkzJNy
 IYwvVtGF2LPqBf3lMmJjxJ4OkMeGIdehWCiR1jLT3+AQbeHTGDbPMO80QDttksmzc2s88MhvJ
 PLh5gir+GD/kW3ohw57iSVDoAvUfe652ZbsakLz9K7cT/KkVXIBycsNkQ5W2ZUOvHZe5jJlvM
 SUVRoCaQjsx3GO4wU5esK4zysG7vduvFOjlXllYVn0riT5sdcwp8S9sr/0im9U+87ahLPaYgI
 y+h/5cuYc7GExj7FcEiqGpaw0OvPpypwPhCpSnY6fQTjWbbkHfsbtdsRI/tJIhamE6B916rm2
 4aBMo381aRruZeo5OFdwW8BwxNnmGhQ4XYA1mPTGow==
Subject: [Buildroot] [PATCH v10 2/3] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build a 5.19 (first version with the m68k virt machine) kernel
for "qemu-system-m68k -M virt" machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
---
 DEVELOPERS                                 |  2 ++
 board/qemu/m68k-virt/linux.fragment        | 21 +++++++++++++++++
 board/qemu/m68k-virt/readme.txt            |  5 +++++
 configs/qemu_m68k_virt_petitboot_defconfig | 26 ++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 board/qemu/m68k-virt/linux.fragment
 create mode 100644 board/qemu/m68k-virt/readme.txt
 create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index d56e4643eaf8..9db1568422a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,6 +1768,8 @@ F:	package/open-lldp/
 
 N:	Laurent Vivier <laurent@vivier.eu>
 F:	package/petitboot/
+F:	board/qemu/m68k-virt/
+F:	configs/qemu_m68k_virt_petitboot_defconfig
 
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
diff --git a/board/qemu/m68k-virt/linux.fragment b/board/qemu/m68k-virt/linux.fragment
new file mode 100644
index 000000000000..49416982601c
--- /dev/null
+++ b/board/qemu/m68k-virt/linux.fragment
@@ -0,0 +1,21 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_KEXEC=y
+CONFIG_BOOTINFO_PROC=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MD=y
+CONFIG_MD_LINEAR=y
+CONFIG_MD_MULTIPATH=y
+CONFIG_MD_FAULTY=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_UNSTRIPED=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_SNAPSHOT=y
+CONFIG_DM_THIN_PROVISIONING=y
+CONFIG_DM_CACHE=y
+CONFIG_DM_WRITECACHE=y
+CONFIG_DM_EBS=y
+CONFIG_DM_ERA=y
+CONFIG_DM_CLONE=y
+CONFIG_DM_MIRROR=y
+CONFIG_DM_RAID=y
+CONFIG_DM_ZERO=y
diff --git a/board/qemu/m68k-virt/readme.txt b/board/qemu/m68k-virt/readme.txt
new file mode 100644
index 000000000000..714b74c70ea1
--- /dev/null
+++ b/board/qemu/m68k-virt/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+ qemu-system-m68k -M virt -kernel output/images/vmlinux -initrd output/images/rootfs.cpio.xz -append "console=ttyGF0" --nographic # qemu_m68k_virt_petitboot_defconfig
+
+The petiboot menu will appear in the terminal where QEMU has been started.
diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
new file mode 100644
index 000000000000..b3497c12b46b
--- /dev/null
+++ b/configs/qemu_m68k_virt_petitboot_defconfig
@@ -0,0 +1,26 @@
+BR2_m68k=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_CCACHE=y
+BR2_RELRO_NONE=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_MERGED_USR=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyGF0"
+BR2_ROOTFS_OVERLAY="package/petitboot/fs-overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
+BR2_LINUX_KERNEL_DEFCONFIG="virt"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/m68k-virt/linux.fragment"
+BR2_LINUX_KERNEL_XZ=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KEXEC=y
+BR2_PACKAGE_KEXEC_ZLIB=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_NET_TOOLS=y
+BR2_PACKAGE_NETCAT=y
+BR2_PACKAGE_RSYNC=y
+BR2_PACKAGE_PETITBOOT=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_XZ=y
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
