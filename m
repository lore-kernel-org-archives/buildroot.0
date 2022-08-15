Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC778C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806C260FA8;
	Mon, 15 Aug 2022 14:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806C260FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LIlS6xndSHH; Mon, 15 Aug 2022 14:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB8A60F90;
	Mon, 15 Aug 2022 14:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB8A60F90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3E2E1BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F26960F90
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F26960F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxGiIVJDh3Gf for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:49:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B6260BF5
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67B6260BF5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:49:16 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MA4ja-1oC54M1Kiw-00Bdpf; Mon, 15
 Aug 2022 16:49:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 16:49:07 +0200
Message-Id: <20220815144907.3300089-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815144907.3300089-1-laurent@vivier.eu>
References: <20220815144907.3300089-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mNqh+RVZcAQQJwfkJP9GbfT2I7hQK97tc7JHlBy++aCBqNAGMXX
 0TauR4Oxdk5pZPy8U0atBuClTIt+kbyucZYCJjdFax0Bu6KbIgcGLB7AAjYj3Ra9eFiV3zv
 yExvDON78vJ63v2CKvrWwQsdfMWU1mUJLXXxDOeqSLcbbjUmQXv2wBLwlPXlAbgHrZA6AsN
 LXLTuaZW8d7xefB4i5UnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gCh4Tmo1dO4=:WFv7C16H0atV6BH/cK4Ycv
 L4KMA0NXyv1jQq9bA4NzXgSOw+RPjhi+1DHGbmhI/JW5EKmxnbwvnflBIxO6Xrtj4YiIVV5wy
 qfIDBKShUyDXANAZM4NfyBlypGBP5X7iQR5rkeaFtzpOCxs4eY0lIMHbRKiZtKdgkFk0lhjM8
 ZVzo7+35xpsGvFxzesouDqLksuAIxfocsAN50B+q35MhYBebkOYVvtw1Rl39CbCmZCOCI6NJa
 EgfD8kbpPs1yfDVP2axotYlwziK5M1lW2X3UjmC5wb9pJWLW2/G9BYOcMo/wkytDOJXjgtuSc
 iHGUQiw4EJ1REpGgnIfm0d7+w8jvczc2kuAv/Rk8Ncy4X/WQ4evNV+BmDdoXXtETG0HwpXJrx
 R4ltmFPmNdB4bvIxQ56/EnLevbnvaqoUJeyLBkg5QIQrQiRq8nvMOHDPzDb1VQZErEcaVpx5A
 GLaNRWDuUM5ppSXip8NcJAuJiUY6rEMwXk1HIcB+i1N4aq7sbRd05TOjlpIVD1et+2pIQND5U
 wWDqK99ts54gY39pc7WRj0hHt5j8y741UE8TJCcJqeQxxmxPRP+a1d9ygC1N86u1Yknke5XMK
 21lk8rc3D88+1qRSiX/Mpa726QfoSY2nKOsTMR+wtnhQWv8R3G0XRSJMBIXRjhXbe2Kg+I8ot
 SM/9DO11anOErN7jn/FH1VL4WNTLOaBxTkNBTEfAi+IMPymBJBVyhdUOv1DrN59pLqFQ3/Su+
 SuO13tO9hTCtjXNoiZP6lXill5lDGatH+lj8yg==
Subject: [Buildroot] [PATCH v4 2/2] board/qemu/m68k-virt: Add virt-m68k
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
 Laurent Vivier <laurent@vivier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build a 5.19 (first version with the m68k virt machine) kernel
for "qemu-system-m68k -M virt" machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 DEVELOPERS                                 |  2 +
 board/qemu/m68k-virt/config.linux          | 89 ++++++++++++++++++++++
 board/qemu/m68k-virt/readme.txt            |  5 ++
 configs/qemu_m68k_virt_petitboot_defconfig | 28 +++++++
 4 files changed, 124 insertions(+)
 create mode 100644 board/qemu/m68k-virt/config.linux
 create mode 100644 board/qemu/m68k-virt/readme.txt
 create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 45fa4c7e0686..fb500c706543 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1744,6 +1744,8 @@ F:	package/open-lldp/
 
 N:	Laurent Vivier <laurent@vivier.eu>
 F:	package/petitboot/
+F:	board/qemu/m68k-virt/
+F:	configs/qemu_m68k_virt_petitboot_defconfig
 
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
diff --git a/board/qemu/m68k-virt/config.linux b/board/qemu/m68k-virt/config.linux
new file mode 100644
index 000000000000..88edb9b1eb3f
--- /dev/null
+++ b/board/qemu/m68k-virt/config.linux
@@ -0,0 +1,89 @@
+CONFIG_LOCALVERSION="-virt"
+CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_KEXEC=y
+CONFIG_BOOTINFO_PROC=y
+CONFIG_VIRT=y
+CONFIG_PROC_HARDWARE=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_AMIGA_PARTITION=y
+CONFIG_ATARI_PARTITION=y
+CONFIG_MAC_PARTITION=y
+CONFIG_BSD_DISKLABEL=y
+CONFIG_MINIX_SUBPARTITION=y
+CONFIG_SOLARIS_X86_PARTITION=y
+CONFIG_UNIXWARE_DISKLABEL=y
+CONFIG_LDM_PARTITION=y
+CONFIG_LDM_DEBUG=y
+CONFIG_SUN_PARTITION=y
+CONFIG_SYSV68_PARTITION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CGROUP_NET_CLASSID=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
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
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_VIRTIO=y
+CONFIG_VIRT_DRIVERS=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS_FS=y
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
+CONFIG_9P_FS_SECURITY=y
+CONFIG_EARLY_PRINTK=y
diff --git a/board/qemu/m68k-virt/readme.txt b/board/qemu/m68k-virt/readme.txt
new file mode 100644
index 000000000000..30803d403a4c
--- /dev/null
+++ b/board/qemu/m68k-virt/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+ qemu-system-m68k -M virt -kernel output/images/vmlinux -initrd output/images/rootfs.cpio.xz -append "console=ttyGF0" --nographic # /qemu_m68k_virt_petitboot_defconfig
+
+The petiboot menu will appear in the terminal where QEMU has been started.
diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
new file mode 100644
index 000000000000..50cd0544dbfd
--- /dev/null
+++ b/configs/qemu_m68k_virt_petitboot_defconfig
@@ -0,0 +1,28 @@
+BR2_m68k=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_CCACHE=y
+BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-m68k"
+BR2_RELRO_NONE=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_MERGED_USR=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyGF0"
+BR2_ROOTFS_OVERLAY="package/petitboot/fs-overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-virt/config.linux"
+BR2_LINUX_KERNEL_XZ=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KEXEC=y
+BR2_PACKAGE_KEXEC_ZLIB=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_NET_TOOLS=y
+BR2_PACKAGE_NETCAT=y
+BR2_PACKAGE_RSYNC=y
+BR2_PACKAGE_PETITBOOT=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_XZ=y
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
