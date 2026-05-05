Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A55BCD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E492C60BA8;
	Tue,  5 May 2026 21:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFYUrcSxCBV4; Tue,  5 May 2026 21:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5FE760B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016039;
	bh=H/WxIs1KNM/tBg2hQCD9+h5qyXvkXlp7WXM9YPKyurM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R60INxHUvuYkSrdcshhlOloMn8ur6d8GEwC2xxc4/gPFtQDnkf4um8IYa/3Z6uV1L
	 r8loQPXgOadMv/y/8W+znY4lCe0PtfDvPsDP+n9UelBMyMWZKTlEiL5/fvOQ40HE8m
	 XcevKtl8+vcM1ud33PBSvlZ4l8dpGePsB/eOzJcnzYDXj+QwkcSPzcgpzsRfjncP0+
	 FU9dmlMxXFpNqN+07AGeeOLKXNra5UXPM/vR2wZ9WNbcyjHaifjMnpj2LT2UmMeeTZ
	 4EmL62jvYmMMp3EBm1uwZPUu72we02x1quIjCiKczdtGNU5lpTPSkVEsNaUHkTBQyj
	 1sC018TmM+pEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FE760B93;
	Tue,  5 May 2026 21:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11745315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB38660B62
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iziu0hZSDwk for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394DF60B57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394DF60B57
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47D0D845F8; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64944bcf6441c325ef5b6cc5f6975fa62008b624
X-Git-Newrev: 3430d8200e58c58bc6c94064795d4f3f6f116537
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.47D0D845F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_docker_compose: Bump
 kernel version to last LTS (6.18)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3430d8200e58c58bc6c94064795d4f3f6f116537
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit bump the kernel version of this docker test (5.4->6.18), and thus
fixes several issues preventing the Docker Compose runtime test from
succeeding due to this bump:

Kernel Infrastructure:
   The Docker daemon failed to start because the 'nat' table could not
   be initialized. This was due to missing legacy Netfilter support.
   - Enable CONFIG_NETFILTER_XTABLES_LEGACY to support iptables nat table.
   - Enable CONFIG_NAMESPACES and CONFIG_USER_NS for container isolation.
   - Enable CONFIG_TUN and CONFIG_VETH for container networking.
   - Enable CONFIG_IKCONFIG and CONFIG_IKCONFIG_PROC for easier debugging.

Build Fixes:
   While building the kernel tools, the libelf header was missing because
   objtool was not handled correctly for this kernel version. This resulted
   in a fatal error: "gelf.h: No such file or directory".
   - Select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y to build host-libelf.

Resources and Stability:
   The previous 512MB of RAM was tight for the stack (Kernel +
   Docker + Containerd + Python), potentially leading to Out-Of-Memory kills.
   Idem for the disk size for Docker images/layers storage.
   - Increase QEMU RAM to 1024MB (-m 1024M).
   - Increase rootfs size to 1024MB.
   - Switch to EXT4 (BR2_TARGET_ROOTFS_EXT2_4=y) for better stability
     and modern feature support required by Docker's storage drivers.

Test Script Adjustments:
   - Update rootfs path in the test script to point to rootfs.ext4.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/conf/docker-compose-kernel.config  | 26 ++++++++++------------
 .../testing/tests/package/test_docker_compose.py   | 12 ++++++----
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/support/testing/conf/docker-compose-kernel.config b/support/testing/conf/docker-compose-kernel.config
index fd28da7a4a..cbaf5dfed3 100644
--- a/support/testing/conf/docker-compose-kernel.config
+++ b/support/testing/conf/docker-compose-kernel.config
@@ -1,8 +1,10 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
@@ -13,11 +15,10 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_BPF=y
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
 CONFIG_SMP=y
 # CONFIG_X86_EXTENDED_PLATFORM is not set
-CONFIG_MCORE2=y
 # CONFIG_X86_MCE is not set
 # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
 CONFIG_LEGACY_VSYSCALL_NONE=y
@@ -25,10 +26,13 @@ CONFIG_LEGACY_VSYSCALL_NONE=y
 # CONFIG_ACPI is not set
 CONFIG_CPU_IDLE=y
 # CONFIG_VIRTUALIZATION is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -38,7 +42,9 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 # CONFIG_IPV6_SIT is not set
 CONFIG_NETFILTER=y
+CONFIG_BRIDGE_NETFILTER=y
 CONFIG_NF_CONNTRACK=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MARK=y
 CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
@@ -47,17 +53,9 @@ CONFIG_IP_VS=y
 CONFIG_IP_VS_RR=y
 CONFIG_IP_VS_NFCT=y
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_NAT=y
 CONFIG_IP_NF_TARGET_MASQUERADE=y
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_RAW=y
-CONFIG_IP6_NF_IPTABLES=y
-CONFIG_IP6_NF_FILTER=y
-CONFIG_IP6_NF_MANGLE=y
-CONFIG_IP6_NF_RAW=y
-CONFIG_IP6_NF_NAT=y
-CONFIG_IP6_NF_TARGET_MASQUERADE=y
 CONFIG_BRIDGE=y
 # CONFIG_WIRELESS is not set
 CONFIG_PCI=y
@@ -65,6 +63,7 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
+CONFIG_TUN=y
 CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
 # CONFIG_ETHERNET is not set
@@ -73,13 +72,13 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
-# CONFIG_DEVMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
 # CONFIG_HW_RANDOM_VIA is not set
 CONFIG_HW_RANDOM_VIRTIO=y
+# CONFIG_DEVMEM is not set
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
@@ -94,5 +93,4 @@ CONFIG_TMPFS=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_KEYS=y
 CONFIG_SECURITYFS=y
-# CONFIG_CRYPTO_HW is not set
 CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index a96c9d1481..db7e50914c 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -17,9 +17,10 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.296"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_DOCKER=y
         BR2_PACKAGE_CA_CERTIFICATES=y
@@ -27,7 +28,10 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         BR2_PACKAGE_DOCKER_COMPOSE=y
         BR2_PACKAGE_DOCKER_ENGINE=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_GEN=4
+        BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
             infra.filepath("tests/package/copy-sample-script-to-target.sh"),
@@ -55,12 +59,12 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
 
     def do_test(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
-        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext4")
         self.emulator.boot(arch="x86_64",
                            kernel=kernel,
                            kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
                            options=["-cpu", "Haswell",
-                                    "-m", "512M",
+                                    "-m", "1024M",
                                     "-device", "virtio-rng-pci",
                                     "-drive", "file={},format=raw,if=virtio".format(rootfs),
                                     "-net", "nic,model=virtio",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
