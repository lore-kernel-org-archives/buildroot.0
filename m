Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F68CAC5AB
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E604361038;
	Fri, 19 Sep 2025 12:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aA2meGTOLSdn; Fri, 19 Sep 2025 12:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F021561039
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F021561039;
	Fri, 19 Sep 2025 12:42:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF592273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2F9961038
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQJdDJwgxddL for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9380C61036
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9380C61036
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 853C485E81; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:25:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d4e1e1055b7076a9788b0cf63eacd19658bf9d10
X-Git-Newrev: 42af5dee138c2c744b218aa82b3d939cc870c2e5
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.853C485E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/testing/tests/package/test_docker_compose.py: update kernel & VM
 CPU
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42af5dee138c2c744b218aa82b3d939cc870c2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since commit 947dbc92a20c5acea7882166cae7893e6ea661e1 the Bootlin
stable toolchain uses headers 5.4, which can lead to build outputs
incompatible with older kernels. Update to the latest 5.4 kernel to
avoid this. The kernel config is updated according to the requirements
of current Docker, runc, and crun.

Additionally switch the CPU of the test VM to Haswell, to avoid
dockerd failing to start with a "This program can only be run on AMD64
processors with v3 microarchitecture support" error.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit efe00fb3fb1c6ab34794a2a19cc71caef1afdcd9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/conf/docker-compose-kernel.config  | 57 +++++++++++++++-------
 .../testing/tests/package/test_docker_compose.py   |  4 +-
 2 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/support/testing/conf/docker-compose-kernel.config b/support/testing/conf/docker-compose-kernel.config
index 4d30a578ec..fd28da7a4a 100644
--- a/support/testing/conf/docker-compose-kernel.config
+++ b/support/testing/conf/docker-compose-kernel.config
@@ -1,10 +1,22 @@
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_BPF=y
+CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
+CONFIG_SMP=y
 # CONFIG_X86_EXTENDED_PLATFORM is not set
-CONFIG_IOSF_MBI=y
 CONFIG_MCORE2=y
 # CONFIG_X86_MCE is not set
 # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
@@ -12,9 +24,8 @@ CONFIG_LEGACY_VSYSCALL_NONE=y
 # CONFIG_SUSPEND is not set
 # CONFIG_ACPI is not set
 CONFIG_CPU_IDLE=y
-CONFIG_PCI_MSI=y
 # CONFIG_VIRTUALIZATION is not set
-# CONFIG_IOSCHED_CFQ is not set
+CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
@@ -25,23 +36,36 @@ CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_IPV6 is not set
-# CONFIG_NF_CONNTRACK_PROCFS is not set
-# CONFIG_NF_CT_PROTO_DCCP is not set
-# CONFIG_NF_CT_PROTO_SCTP is not set
-# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_IPV6_SIT is not set
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NETFILTER_XT_MARK=y
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_IPVS=y
 CONFIG_IP_VS=y
 CONFIG_IP_VS_RR=y
 CONFIG_IP_VS_NFCT=y
-# CONFIG_BRIDGE_IGMP_SNOOPING is not set
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_NAT=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_MANGLE=y
+CONFIG_IP_NF_RAW=y
+CONFIG_IP6_NF_IPTABLES=y
+CONFIG_IP6_NF_FILTER=y
+CONFIG_IP6_NF_MANGLE=y
+CONFIG_IP6_NF_RAW=y
+CONFIG_IP6_NF_NAT=y
+CONFIG_IP6_NF_TARGET_MASQUERADE=y
+CONFIG_BRIDGE=y
 # CONFIG_WIRELESS is not set
+CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
+CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
 # CONFIG_ETHERNET is not set
 # CONFIG_WLAN is not set
@@ -52,26 +76,23 @@ CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_DEVMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_SERIAL_8250_LPSS is not set
-# CONFIG_SERIAL_8250_MID is not set
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
 # CONFIG_HW_RANDOM_VIA is not set
 CONFIG_HW_RANDOM_VIRTIO=y
-# CONFIG_DEVPORT is not set
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
-# CONFIG_VIRTIO_PCI_LEGACY is not set
+CONFIG_VIRTIO_MMIO=y
 # CONFIG_X86_PLATFORM_DEVICES is not set
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT4_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_KEYS=y
 CONFIG_SECURITYFS=y
-# CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
-# CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 6a8f6f4010..a96c9d1481 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -17,7 +17,7 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.262"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.296"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
         BR2_PACKAGE_PYTHON3=y
@@ -59,7 +59,7 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         self.emulator.boot(arch="x86_64",
                            kernel=kernel,
                            kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
-                           options=["-cpu", "Nehalem",
+                           options=["-cpu", "Haswell",
                                     "-m", "512M",
                                     "-device", "virtio-rng-pci",
                                     "-drive", "file={},format=raw,if=virtio".format(rootfs),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
