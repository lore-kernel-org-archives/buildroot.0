Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E43C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D412424BC;
	Fri,  9 Jun 2023 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D412424BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dz-fErmgJF1a; Fri,  9 Jun 2023 11:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1949A424B8;
	Fri,  9 Jun 2023 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1949A424B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1EF81BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB44360AD0
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB44360AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-L7iIlQjdeT for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:25:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283FD60B0F
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 283FD60B0F
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:25:30 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mk0FS-1pjY5e1cTI-00kLmZ; Fri, 09
 Jun 2023 13:25:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 13:25:21 +0200
Message-Id: <20230609112522.97790-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609112522.97790-1-laurent@vivier.eu>
References: <20230609112522.97790-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eBATgWv71tDBViTljo5sXfN/0FdJk7qc7cQ6nh1MPZwjnB+KD+t
 7iaQ075gaHhqLdXzAH6lWNPJXGJ9jWIACRv6BUOywfVFhKPIlcX+i0oxXum6TxPlAaDAuk4
 LPZ3MmfDYdECAxYvG1UmQFnhowmDlhVRcUcLUaMSrKapvgP34BBD172uRtwJ/PDKZ4Zqaou
 xUPHKg/s6wCCyMdPNNeYA==
UI-OutboundReport: notjunk:1;M01:P0:0z9/SdwZGPI=;z0pQRGAufJdL16YFMtsjApGz2o9
 qrualgz2ipamVcBS/2ny+P6q6ypjZwmiHQKfn4vtd4ZU4Jx0Q8ZA+nmGegAhPRRSsebq8Kn2G
 t12t7+UNOkR30K+2cl2t91rmlAy8KfTVTx391k/ZgUED/GEm3vGCTWcBRdkabgcMW8kF5Wt8W
 QT6sUjmiy8ajtjlieATuZMMMlYf6jcWsKsLWLRjzGxLFvaQyG2w7MlveGN0tTrFMbRI9EggU4
 o8fDN1K5KQxJ4d015z+CMualcPaC4AEkJipcj6bqE12N2SqgZJx92eK1Ozj8f4T6gQXUgIL4Y
 7lHdreA7xFh9jgCCSaG65R1JeQflfPRzm6UqVqoD9VmKWPFos+YLxPMjdwje8IqslrzWQPJIc
 Oq0JQ+EwAJCmxL7D4tmfszIGs7J7RLx9JgdFzAwrqAq0E75OFRp2onn2RsDqsr27mAhyeOQfq
 TYO8z0fQddlSkT1HBai/pngUWx2Sx7ZEMiz2UVd0zkPyw+MXpnoQ5vET0s9NqVI4C0eCkE2VY
 7Szjfz6+r9i46ywT+d9HxiD5jWYhW/AZYg/TWAa93skroI5st9qJKECXg40Uqgyglzri9C7Xc
 +xzmjXgwJU8y+bocAge2rXrZiaSY8v44Z7/mN2Nd/r3OSXAsCEXa0EcREtMFyJum20BPCPFa/
 /ldSkQd+WXwM6iahQGSN3FWQtIf2WJ/t2h198YqNXQ==
Subject: [Buildroot] [PATCH v13 3/4] board/qemu/m68k-virt: Add virt-m68k
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
index 7aa5980df7f3..804a4cd2c1d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1820,6 +1820,8 @@ F:	package/open-lldp/
 
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
