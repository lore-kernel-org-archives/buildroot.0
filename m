Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47253CDB470
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 08:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF2A814DC;
	Tue, 23 Jun 2026 08:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mUu9TQCkGj5; Tue, 23 Jun 2026 08:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7B58144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782204305;
	bh=wf8NXKH4E0NpX0IMv7puCmSxAjH00DIsn4jWH92HcSw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pU1hgzXlDotWAUsniOmJiHIsAVyiRxmsXqgIkO6KWL4Cr78SRKswnqsP5zL77hfM1
	 3kTk3P68s+Y7F6KfCFx+vWd8W+00kG8rnrwW8ir+16xZKIWjE6YvtAargeoNvmdYzS
	 8BpjbQn26l7AKUowWt86smjAKkosT2lUBoruOq/gwruC6+VhdD93W/k4OoHswekPtv
	 bQYlCUMd8LPcbGoBVlrtdCo9Bwc7aYV/JhV9sm1J2L0aksJo+Psruyjz5zXn5hE9Mq
	 fE0mzddy8emLCc9KMJoDC2DrTMTm6iXP4Ua+bTDbF7oauVgZhSR9Y0hWU3OdJDl+4q
	 81JIA/ojkFojQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7B58144C;
	Tue, 23 Jun 2026 08:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44467157
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35D3E60841
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyXvEtREgMyD for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 08:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06F4660840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F4660840
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06F4660840
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso36479415e9.1
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 01:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204301; x=1782809101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a8mqz7Ox6jnBLEyl/M2Uha0IBDa2ySzAXbS/fhIPTRs=;
 b=eBpavaennewdPypJc5wz6qdm4lRwM/IOnSNGA+Uf6IEkapP2QOjYtrLby9B/M1amfK
 nlhz5sRUfIxaURO9e/3DJQopYsVIuAj/PyMu1A0pahMCX2az9IYek2IXpgmiu36M8RM0
 Is8fSACWjtLe29vNV3VeGNDN8b/dkn/lKmQDRbX9zQKqVAT56CWnAMckmyhZrVUci6nA
 cV+JECUIbQYeMWyEdKu5cyFmNdnGvLgEftirXtpk1ZUi8R78pDm1/16i17WBQY8qKe8s
 5m/WRnm19zyJ7fLJiUqm2K5jP0zSmBI9FIpu1mJosIPWqI+Sdt35AlgF71CNTcT2u4AD
 nxyg==
X-Gm-Message-State: AOJu0Yyd0tLY/gkIMs9CgHqHbEUn7k9y3J6ptm+5OpfxGkFkHJ6uGDbf
 s15nhKNEqzEcQ6vGROjVpmiJPTTQ0m5NtjDqFCDJbETDmUa4DKyqvRI5o2MRdBOyf+EHTucZNnm
 CP4tBpNc=
X-Gm-Gg: AfdE7cmxQ2tCJdDMigCFlFXsWBylEW4VvkLtDnuFd4Fjhurxc8W9fIX3rs+xSTIloDd
 hVJws9vgqzkAyruY4xlmCb7f7VUlVtiEhdAQ0Y4gBjdG0dBNrrnvR2zIm50vxMt9VOG6SaLAUQt
 Nxqi/b8EfpOpLL5SvFA9CWXR131cuOULxwlDkLoHmjFAQ6vR+NT1LashLaK7MPJOl0dRz8kJFcz
 cDs1bZrF/1KSqzFJU7nmq9Gz5oGF6KIwSrRL9x+La00W0UAJSUzPcjJxldJTKj75R+FiKtPJol2
 0JK2XRGfq/tondbw/a9TevkPL12Jmwfh4KRkV2WT1VHuS+srmz/688AtiVi3jZl9EraqOF/yXBG
 sVKZvBsjRXUsh7wi1pSc+n5ftMdz4m8POgtonD4VxbimMRgIAIItn48+zDbALhQbHEOyCn2WMKc
 EwPQn6AJcaV5YcVz8qEjBzfIVz3x4ExKgEZNY9Rx5BwPlEoeex6VSA/tojCmzvODvgzjsrUoeUq
 HGj5mOHZA==
X-Received: by 2002:a05:600c:8b76:b0:490:d354:bcf4 with SMTP id
 5b1f17b1804b1-4925b3b0657mr21916635e9.27.1782204300765; 
 Tue, 23 Jun 2026 01:45:00 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249207dabsm490734505e9.0.2026.06.23.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:45:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue, 23 Jun 2026 10:44:38 +0200
Message-ID: <20260623084439.2321675-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623084439.2321675-1-dowan.gullient@smile.fr>
References: <20260623084439.2321675-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782204301; x=1782809101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8mqz7Ox6jnBLEyl/M2Uha0IBDa2ySzAXbS/fhIPTRs=;
 b=X0PTLWXoE8p7hqiEna7T/2+bpZmieuidrfnzrmmvM7q7YLTaURO2RYmrR6Ds3bbnib
 UHxDlAmDASdHGtvJapzB72cBYFsRGyumOH4c24W/8zKPS8QsmlVEOqhejHpo1zEs6Dj+
 EkhAvtZHQvtTJ9IbQ2x+8RE97UPmDI9+zP2tA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=X0PTLWXo
Subject: [Buildroot] [PATCH 1/2] support/testing/builtin-kernels: add
 aarch64-virt kernel
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are currently using prebuilt kernels downloaded from autobuilder
server [1] since the Buildroot testsuite was introduced in 2017.05 [2].
Such prebuilt kernels are difficult to rebuild since their configurations
are not saved in the repository.

We are going to update all runtime test to use Aarch64 target instead
of the legacy arm (armv5 and armv7) targets. We use this opportunity
to add a Buildroot project into support/testing/builtin-kernels
directory to ease any further prebuilt kernel maintenance.

The kernel_aarch64_virt_defconfig use the Bootlin stable glibc
toolchain to build the kernel, we reduce the build time by disabling
init (none), shell (none), busybox and tar rootfs archive.

Buildroot target the cortex-A53 Aarch64 cpu by default, so we should
use "-cpu cortex-a53" on the Qemu command line.

We use the current Qemu aarch64-virt kernel defconfig
"board/qemu/aarch64-virt/linux.config" as initial kernel defconfig.
This kernel defconfig can be completed by using configuration fragment
files placed in support/testing/builtin-kernels/common and should
be named linux-<test_name>.fragment.

Any runtime test that need to enable some new kernel options can
add a new configuration fragment file.

Some packages (audit, firewalld, systemd...) added in pre-build.sh
enables kernel features when a kernel is built by Buildroot using
<pkg>_LINUX_CONFIG_FIXUPS.
We could use additional configuration fragments with a copy of the
current list of options. But it would requires to update them as the
<pkg>_LINUX_CONFIG_FIXUPS is changed.

To avoid this maintainance burden, we dump all <pkg>_LINUX_CONFIG_FIXUPS
using "make printvars VARS=<fixup list>" to generate a kernel
configuration fragment will all required kernel options.

[1] https://autobuild.buildroot.org/artefacts
[2] a732fb222b8a60076a93d490834d459b0a1c1d6b

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../kernel_aarch64_virt_defconfig             | 20 +++++
 .../builtin-kernels/aarch64-virt/linux.config | 76 +++++++++++++++++++
 .../aarch64-virt/patches/linux/linux.hash     |  2 +
 .../common/linux-config.fragment              |  2 +
 .../common/linux-initrd.fragment              |  2 +
 support/testing/builtin-kernels/post-image.sh | 43 +++++++++++
 support/testing/builtin-kernels/pre-build.sh  | 19 +++++
 7 files changed, 164 insertions(+)
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/linux.config
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/patches/linux/linux.hash
 create mode 100644 support/testing/builtin-kernels/common/linux-config.fragment
 create mode 100644 support/testing/builtin-kernels/common/linux-initrd.fragment
 create mode 100755 support/testing/builtin-kernels/post-image.sh
 create mode 100755 support/testing/builtin-kernels/pre-build.sh

diff --git a/support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig b/support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig
new file mode 100644
index 0000000000..1c7df9d4f0
--- /dev/null
+++ b/support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig
@@ -0,0 +1,20 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+BR2_ROOTFS_PRE_BUILD_SCRIPT="support/testing/builtin-kernels/pre-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/builtin-kernels/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="aarch64-virt"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/builtin-kernels/aarch64-virt/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/builtin-kernels/common/linux-*.fragment $(BUILD_DIR)/generated-kernel-fragments/linux-gen-pkgs.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+# BR2_PACKAGE_BUSYBOX is not set
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/support/testing/builtin-kernels/aarch64-virt/linux.config b/support/testing/builtin-kernels/aarch64-virt/linux.config
new file mode 100644
index 0000000000..971b9fcf86
--- /dev/null
+++ b/support/testing/builtin-kernels/aarch64-virt/linux.config
@@ -0,0 +1,76 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_COMPAT=y
+CONFIG_ACPI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BINFMT_MISC=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=m
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS=y
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/support/testing/builtin-kernels/aarch64-virt/patches/linux/linux.hash b/support/testing/builtin-kernels/aarch64-virt/patches/linux/linux.hash
new file mode 100644
index 0000000000..473cc598b5
--- /dev/null
+++ b/support/testing/builtin-kernels/aarch64-virt/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
diff --git a/support/testing/builtin-kernels/common/linux-config.fragment b/support/testing/builtin-kernels/common/linux-config.fragment
new file mode 100644
index 0000000000..9e7666c908
--- /dev/null
+++ b/support/testing/builtin-kernels/common/linux-config.fragment
@@ -0,0 +1,2 @@
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
diff --git a/support/testing/builtin-kernels/common/linux-initrd.fragment b/support/testing/builtin-kernels/common/linux-initrd.fragment
new file mode 100644
index 0000000000..841cf26e4a
--- /dev/null
+++ b/support/testing/builtin-kernels/common/linux-initrd.fragment
@@ -0,0 +1,2 @@
+# Enable initrd support for all tests using a rootfs.cpio
+CONFIG_BLK_DEV_INITRD=y
diff --git a/support/testing/builtin-kernels/post-image.sh b/support/testing/builtin-kernels/post-image.sh
new file mode 100755
index 0000000000..00d126498b
--- /dev/null
+++ b/support/testing/builtin-kernels/post-image.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+
+BINARIES_DIR="$1"
+BOARD_NAME="$2"
+
+#
+# linux_image extracts the Linux image format from BR2_LINUX_KERNEL_UIMAGE in
+# ${BR_CONFIG}, then prints the corresponding file name for the genimage
+# configuration file
+#
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" "${BR2_CONFIG}"; then
+		echo "uImage"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" "${BR2_CONFIG}"; then
+		echo "Image"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" "${BR2_CONFIG}"; then
+		echo "Image.gz"
+	elif grep -Eq "^BR2_LINUX_KERNEL_BZIMAGE=y$" "${BR2_CONFIG}"; then
+		echo "bzImage"
+	else
+		echo "zImage"
+	fi
+}
+
+linux_version()
+{
+	LINUX_VERSION="$(sed -n 's/^BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="\([\/0-9 \.]*\)"$/\1/p' "${BR2_CONFIG}")"
+	echo "${LINUX_VERSION}"
+}
+
+main()
+{
+	local LINUX_IMAGE
+	LINUX_IMAGE="$(linux_image)"
+	LINUX_VERSION="$(linux_version)"
+
+	cp -v "${BINARIES_DIR}/${LINUX_IMAGE}" "${BINARIES_DIR}/kernel-${BOARD_NAME}-${LINUX_VERSION}"
+
+	exit $?
+}
+
+main "$@"
diff --git a/support/testing/builtin-kernels/pre-build.sh b/support/testing/builtin-kernels/pre-build.sh
new file mode 100755
index 0000000000..cd23a129fc
--- /dev/null
+++ b/support/testing/builtin-kernels/pre-build.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+
+GENERATED_KERNEL_FRAGS_DIR="${BUILD_DIR}/generated-kernel-fragments"
+
+# Packages used in Buildroot runtime tests that set kernel options
+# using LINUX_CONFIG_FIXUPS.
+declare -a packages_list=("AUDIT" "CGROUPFS-MOUNT" "CGROUPFS-V2-MOUNT"
+"FIREWALLD" "IPTABLES" "LVM2" "NETAVARK" "NFTABLES" "PODMAN" "USBIP"
+"SYSTEMD")
+
+for pkg in "${packages_list[@]}"
+do
+    BR_VARS+="${pkg/%/_LINUX_CONFIG_FIXUPS} "
+done
+
+mkdir -p ${GENERATED_KERNEL_FRAGS_DIR}
+
+# Generate a single kernel configuration fragment from extracted <pkgs>_LINUX_CONFIG_FIXUPS
+make O=${CONFIG_DIR} printvars VARS="${BR_VARS}" | sed -n "s/^.*'\(.*\)'.*/\1/p" | sort -u > "${GENERATED_KERNEL_FRAGS_DIR}"/linux-gen-pkgs.fragment
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
