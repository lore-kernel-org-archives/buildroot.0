Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B027C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 11:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2201415F1;
	Sun, 14 Aug 2022 11:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2201415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrxR_P7qd4ZP; Sun, 14 Aug 2022 11:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7EF415B9;
	Sun, 14 Aug 2022 11:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7EF415B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46A191BF2C3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 11:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B0C415E9
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 11:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B0C415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id daQryn4fbJTL for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 11:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4E9415B9
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A4E9415B9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:56:27 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZTVu-1nty2T0Rja-00WY6O; Sun, 14
 Aug 2022 13:51:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 13:51:15 +0200
Message-Id: <20220814115115.2798469-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220814115115.2798469-1-laurent@vivier.eu>
References: <20220814115115.2798469-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LpPWKSO2YvCZWCdE9c6OCoQmBHkSqi9vNIEFz8ODvjUSIK7ERtZ
 EvO9iH6CmxBCWRZ6GgvNO0O7+Ubk1fymmy80okishx+hjQpBTIp0wpaf121L60t5hzMWe9r
 RpXbgztaTTuT7MEmvIj8Q3OQOTlI6K69dsJQLHUQjghLaAIaKGLhVOS14pS6ziTCleusdfF
 ETBDycZn9ZocY32eV8gZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k62zJ2fzeAw=:Z0SWOhXwl2QzHfZL9zlP38
 354IIUnMvyup6DAcqIplU/zGVumS+5WM/eG5Blt3kBQkS3jQrkN207U9412s56/3gMVLwXU1v
 6cOvnU9PWh468qMJCnyaLj3j3KZ41DL/fqyXq72D33FEdqvDsu2OM9IU6/eM9oSp56BNOJnt+
 y0wk13iWF1i7sOFh6AJbZr9Qfk+nREX9/ZFhQ4dVx8KbYUad1gk1HBcP+YKkzqnGDR9FOMESc
 bKXKWC8U17utnw7URc5KNax0s93hQ/MfBPg+wqhxRYRjkPpxBd8lNc1/eHIpCKHtjPDYsR3wz
 dgCzzLInoUFghza2f9i4YU37kbCdOZ+5xfokpJdcjHt5MPixCpU4cxByYIVbHbt6TPCSEi2um
 NND0GDOG6h4eizNugELlfM1u1v3DdDznekZ3LYhk/OSIoYfhoqBx9JfetB1ebl5E2xiSX2gwc
 VfFQDZid3ym5FoxxMprVefeyS0Qp6ODwLIjXWRm4Glu+VezI5VIhy5WF8VEtGFGP8KxjhKTxA
 xMqsL2XJYJNlMLo/q5T8LsXzGnVKVursmBkspGJdpTFWeqf7BJpKb2rb+64ENWCf8ugWbmTvP
 Eowy7Sp4FIRHvnBr4fC4b97k7iA+PpK7pE7PQR8qTvRLURsDeKU2JfPChSyOqdqLXMNkCaKnP
 ueU/YLwDZtEgBGv5erb+HGEBqdcGI0lPJXaZV4A6nBHORXedJVdebLxWnojTCAS1cE3m9zWjg
 COIio+RWS02xp1+WBn0kVbLCYPkSm3Qw3WfSyA==
Subject: [Buildroot] [PATCH v3 2/2] board/qemu/m68k-virt: Add virt-m68k
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
Cc: Romain Naour <romain.naour@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build a 5.19 (first version with the m68k virt machine)
build a bootable kernel for "qemu-system-m68k -M virt" machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 board/qemu/m68k-virt/config.linux          | 89 ++++++++++++++++++++++
 board/qemu/m68k-virt/readme.txt            |  5 ++
 configs/qemu_m68k_virt_petitboot_defconfig | 28 +++++++
 3 files changed, 122 insertions(+)
 create mode 100644 board/qemu/m68k-virt/config.linux
 create mode 100644 board/qemu/m68k-virt/readme.txt
 create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig

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
index 000000000000..475e36f7d9d5
--- /dev/null
+++ b/board/qemu/m68k-virt/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+ qemu-system-m68k -M virt -kernel output/images/vmlinux -initrd output/images/rootfs.cpio.xz -append "console=ttyGF0" --nographic # /qemu_m68k_virt_petitboot_defconfig
+
+The petiboot menu will appear in the terminal that started Qemu.
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
