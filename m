Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D52EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49CF41726;
	Thu, 14 Apr 2022 17:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvrMRgCC3xFj; Thu, 14 Apr 2022 17:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791EE4150E;
	Thu, 14 Apr 2022 17:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1771BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A4C24150E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scEnjysjzznF for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:29:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70F50410C0
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:29:19 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 552AF20C3524;
 Thu, 14 Apr 2022 10:29:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 552AF20C3524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649957358;
 bh=hH6mUpdkvONIdo3HrkCYB9AjBK9FGoN720x5eC0oCJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gVfLfGDHc3c3zNr4axKwJHN/UkQjWWSs/XbpLJMhgcfvIhRDXIAAGMwDRMQtQ/39E
 lrtbpwru1GB+gxvEWki948M13fIaGPFDeKIS9JH3tmYggTBbIXXo74wK/H1Bl0Qg8L
 df3KHLPSmwaqfeIgPmzLeRC0vVtRwH3/o/4azilA=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:28:57 +0100
Message-Id: <20220414172857.35100-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414172857.35100-1-flaniel@linux.microsoft.com>
References: <20220414172857.35100-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/1] qemu_x86_64_docker: add new qemu
 defconfig
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig permits building an image with a "docker" ready kernel and docker
related software installed.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                             |   2 +
 board/qemu/x86_64_docker/linux.config  | 112 +++++++++++++++++++++++++
 board/qemu/x86_64_docker/post-build.sh |  11 +++
 board/qemu/x86_64_docker/readme.txt    |   7 ++
 configs/qemu_x86_64_docker_defconfig   |  49 +++++++++++
 5 files changed, 181 insertions(+)
 create mode 100644 board/qemu/x86_64_docker/linux.config
 create mode 100755 board/qemu/x86_64_docker/post-build.sh
 create mode 100644 board/qemu/x86_64_docker/readme.txt
 create mode 100644 configs/qemu_x86_64_docker_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58f..8a6374977a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,8 @@ F:	package/ipmitool/
 F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	board/qemu/x86_64_docker
+F:	configs/qemu_x86_64_docker_defconfig
 F:	package/pahole/
 F:	package/sysdig/
 F:	package/tbb/
diff --git a/board/qemu/x86_64_docker/linux.config b/board/qemu/x86_64_docker/linux.config
new file mode 100644
index 0000000000..e64b1e76e3
--- /dev/null
+++ b/board/qemu/x86_64_docker/linux.config
@@ -0,0 +1,112 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_CGROUP_MISC=y
+CONFIG_USER_NS=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=m
+CONFIG_INET=y
+CONFIG_INET_ESP=y
+CONFIG_NETFILTER=y
+CONFIG_BRIDGE_NETFILTER=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_CONNTRACK_FTP=y
+CONFIG_NF_CONNTRACK_TFTP=y
+CONFIG_NETFILTER_XT_MARK=y
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_IPVS=y
+CONFIG_IP_VS=y
+CONFIG_IP_VS_PROTO_TCP=y
+CONFIG_IP_VS_PROTO_UDP=y
+CONFIG_IP_VS_RR=y
+CONFIG_IP_VS_NFCT=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_NAT=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_TARGET_REDIRECT=y
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_CLS_CGROUP=y
+CONFIG_CGROUP_NET_PRIO=y
+# CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_IPVLAN=y
+CONFIG_VXLAN=y
+CONFIG_VETH=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_BOCHS=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_KEYS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/qemu/x86_64_docker/post-build.sh b/board/qemu/x86_64_docker/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/x86_64_docker/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+fi
diff --git a/board/qemu/x86_64_docker/readme.txt b/board/qemu/x86_64_docker/readme.txt
new file mode 100644
index 0000000000..a7bf2b4e32
--- /dev/null
+++ b/board/qemu/x86_64_docker/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext4,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user # qemu_x86_64_docker_defconfig
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_64_docker_defconfig b/configs/qemu_x86_64_docker_defconfig
new file mode 100644
index 0000000000..359b1ae75f
--- /dev/null
+++ b/configs/qemu_x86_64_docker_defconfig
@@ -0,0 +1,49 @@
+# Architecture
+BR2_x86_64=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# The "just enough" size for all packages is 270M (found by dichotomy fround
+# 60M).
+# We add "extra" 50M so dockerd can mount /var/lib/docker and there is a bit
+# of space for some small docker images.
+BR2_TARGET_ROOTFS_EXT2_SIZE="320M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64_docker/post-build.sh"
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64_docker/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+
+# docker related package
+BR2_PACKAGE_DOCKER_CLI=y
+BR2_PACKAGE_DOCKER_COMPOSE=y
+BR2_PACKAGE_CONTAINERD=y
+BR2_PACKAGE_DOCKER_ENGINE=y
+
+# We need to be able to connect to https:// to pull docker images.
+BR2_PACKAGE_CA_CERTIFICATES=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
