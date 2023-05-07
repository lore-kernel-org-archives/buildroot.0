Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA633C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52B8E613DB;
	Sun,  7 May 2023 16:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52B8E613DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDhxLXo0KTsM; Sun,  7 May 2023 16:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B791613DC;
	Sun,  7 May 2023 16:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B791613DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BED31BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22FA360071
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FA360071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2n4ZFpupLhNC for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B69860E5F
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B69860E5F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:49 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mow06-1qZjQU2Bhu-00qTog; Sun, 07
 May 2023 18:53:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:39 +0200
Message-Id: <20230507165340.42151-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507165340.42151-1-laurent@vivier.eu>
References: <20230507165340.42151-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wVSfOFZfZcRVwkZBTlskeAzioQMbn+UehORKmsvaYsLEF8Et1Wf
 XI+4gy9mpPw4pSURv0kAQwvNvOv3dgzDYE+KUU0BzBK+NsfAzgW/IOAerkzCJPuYMlL8GVc
 tVt97VgB7eNuy1VKyW8YMjdkTYGCku4vBPg5rSnKMQJ1Vi97wXAQuqwZy2VaFDAmKugRrQB
 EF3R7PKes2NZKj2qP4/sA==
UI-OutboundReport: notjunk:1;M01:P0:1xxhzVgwvNs=;Q3DdA7e4RUiFmMK+7NoDaV2IIi3
 i+r1q3In+gzxEr486MfczdHXMdvp28YwPiKM5pwhPsBrkYAmbqN1Go+lXEXZNzYgNi+V59BHD
 wO9l9EB3TSsX80Z8PC3/ikzmwAvw35xNjGuzH4DUiwP+9Vo5EVE08F/NdVwt8be4G0a8I84tZ
 xhD/nBzwU6AX4fHWc0a8oXPsojHPVdIZnjQRyqxcvdaQtNd2jMRDjWlH94LMS7lOV2k7P+gy7
 Fpqzs2gSDOc4yWZhi/ncdWypqLTzoXhuUjCyNeNcUNqs/dMjuZ41iA3UAwrpN9LAidufl+hFF
 DQUNcbOee1rApzgS8dcLZjAaL3xKPg/lZmXZ2BNRgVqRdyCcDRP3y52T3yAwh0D0LbUdZoRq+
 nCZrQ0MJGI1St9LkQfGGNw3ta9eUaJiB4X3m7kbjqL+2alF/d8KaaOfWS9sLGubtzmrfC8Mf6
 5pZWjHjqjA7nZpem6PCKPRSomrETU/IOqoBalVPnvZoPQm2Blau6U5M6u2sGBbgf8rfKOzWhn
 s2ivFQ5wgqz3B0zEdiYrgu5R5OPcqstWJCc+XPriP5bpOEhEFX+wB0m3pFwKMxXbn8hgcSjsF
 qB4LeB3+AD69Lvh8nBC1ev4A8/8imkep7MqupagXYSB0+wFoUYUXliXQO4v+EIz+EJS8FzVfZ
 +9MedzXmEb5nPLjzZIGu5OFSD7v5UDiVX24hfmrvGQ==
Subject: [Buildroot] [PATCH v12 4/5] board/qemu/m68k-virt: Add virt-m68k
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build a 5.19 (first version with the m68k virt machine) kernel
for "qemu-system-m68k -M virt" machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 DEVELOPERS                                 |  2 ++
 board/qemu/m68k-virt/linux.fragment        | 21 +++++++++++++++++++
 board/qemu/m68k-virt/readme.txt            |  5 +++++
 configs/qemu_m68k_virt_petitboot_defconfig | 24 ++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 board/qemu/m68k-virt/linux.fragment
 create mode 100644 board/qemu/m68k-virt/readme.txt
 create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 57b67e091e1c..fbca55ec46af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1819,6 +1819,8 @@ F:	package/open-lldp/
 
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
index 000000000000..a109553187b4
--- /dev/null
+++ b/configs/qemu_m68k_virt_petitboot_defconfig
@@ -0,0 +1,24 @@
+BR2_m68k=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_CCACHE=y
+BR2_RELRO_NONE=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_MERGED_USR=y
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
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
