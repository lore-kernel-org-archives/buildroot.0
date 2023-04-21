Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0EFC77B76
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305FF6FFFD;
	Fri, 21 Apr 2023 18:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305FF6FFFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpPoFgnCCBHr; Fri, 21 Apr 2023 18:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703DC6FFF2;
	Fri, 21 Apr 2023 18:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 703DC6FFF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6A7F1BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 711AE83FB5
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711AE83FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PG2ybZvP0shD for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F48183FAA
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F48183FAA
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mo6WJ-1qe7gp1TYJ-00pfTe; Fri, 21
 Apr 2023 20:50:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:50:02 +0200
Message-Id: <20230421185003.1221000-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421185003.1221000-1-laurent@vivier.eu>
References: <20230421185003.1221000-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:e+0PsTDzx5EqRy10MNJES0gmBSC3WxCWqp0ZbZUZCZCKP/6+qQ8
 B2yvwuFEUu6oHkfpX7nqZ9yf+7f6Y2oWovN/Gdu59fUeXCtBlg6TuNY2rc+vr6wyFL9w5Cy
 h4+iakxeC0NJ1TNd/6AhfQtxOdRabJsZclZVFZk/TcgBMtdjcCmvEAvdFhbZlc66sCx90hV
 fXHUetwzDh1aqwX8tDSuA==
UI-OutboundReport: notjunk:1;M01:P0:Mq0k/cU9uSc=;jgRWA1L6VuW+fZweJXf14oUgfKq
 JZuyE9zYvmlffwpmgrx2dYUXwuSTgJ0Vc10fsXDI8+70fXJq7gnwMAHdypa9LdAmdoIDsFXbU
 6MX3P8Uk+RZ+diQfHkNMH2PEdubDTtbG0axq2nBJZ+/4xcJrJQ4ytVmbH8SkJHGcOBb3V2Su7
 AQGKFwNubSCcCKAg2y0M3JKour8rXMBrvNk33aemmKwOWtHfU6Yv0GEnkJllR0TvUQgAiqyxH
 R6FIOHpeu24nT975Zzny0jixLcmKWFH61KUNK5EfQEg0eyZYsjWwlIlFobcBPNEgtX8eSef/F
 krksDpqc/k3u1yBlfh2OWO6mYCjxPJ3fDcuocsTQBZQE0RakTl8pe2Nqln0JplN1FOJ9+35Og
 MDsS2A590ZU3x0OKJyvePJ5AA8WrtFtJtXIkMjSz0y8+XSq24Bgyd97U02rL1Ev5PfsOGULOI
 L99Gjp3ysuCaIpidGeMrLQQrkCaMjJSXtTKFJbrEohyzF5pKF31aVNT6AD6ypl36UhoLZNmqi
 WIORCGS7Adx1tpfelitT6cnktf+0GjubCHq+MZPHElazT76nN0LRm0rYV8+fxIuJzL1zLZyJU
 xiem+mrIvgXHvByeakloCTTi/Od37I3TSAOzdpef49hO0s3PMSIIuRsIUPaTk++ADyqiQ0axo
 PpWeR9XFGRs4mwg8eoNn/kyoCzaN+9+yj3p6Ey7l0w==
Subject: [Buildroot] [PATCH v11 4/5] board/qemu/m68k-virt: Add virt-m68k
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
index 5cd882b5791c..2a07c464694f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1818,6 +1818,8 @@ F:	package/open-lldp/
 
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
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
