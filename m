Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB6CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E208438E;
	Fri, 29 Aug 2025 11:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avXMQNHXNETV; Fri, 29 Aug 2025 11:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EEAD842C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EEAD842C9;
	Fri, 29 Aug 2025 11:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 624C369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50D07842C8
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_CbkLtOllN5 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19B85842BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B85842BD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19B85842BD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.112.26]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1uvF7L3c6O-00AS6N; Fri, 29
 Aug 2025 13:31:36 +0200
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:31:18 +0200
Message-ID: <20250829113119.2892270-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:iFE8qIj/L1a8108P1t4HTAJB8zkH2byLiPku7/tZgCLazV9JXUv
 p78KWNCIEIMLehHL1UpKXbcaDI7Y9it9uUoadzVi/ebMjn3Lx5daCsCHRtVmAaMhF0/bcYV
 AEZ0/lJn65RFANhku01cjXfV4oJNHpleC/yJOtpeoe9RDJAhtX1onby0gZQugUj8pZmbCL8
 vB8HnjSaAc3tcKr5DU8Zw==
UI-OutboundReport: notjunk:1;M01:P0:tQII/hmIt3Y=;F+eBaKiiHjH2Cy7Tym04QJb93/R
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756467096; x=1757071896; i=fiona.klute@gmx.de;
 bh=xiLWwy9X0M4VLjv/r0XOzOVDR3ru6r+fYvjdXHqa9fo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P75Rtt3+ZKEKfdWbTXATHHzdWlBtCbjyDv0B9v/klAKzmZRyRcFgmJsmNmpBB9Jl
 ITeUro7buh+p9TilcQfxOJAha52AeUM803H024gsW3pZFB2Bb7gI3yLUFQLSyxiqA
 +HvqSHBXWajtmP7BcGFnKJG/BidnAh8LZx8rCJrrbmTPBVJuySxim0AStedj6iNzz
 spxV/z8Wp1FOQOd4usbWWLB1mNhzKU3vUsQxy/RpJOEXG12PH+NRzPst7R26HHh1H
 WfwCJ+xJ59a50a61C/1Cau8Uz+m33szxOL3XWhePcWPOLvkxL/4jEHKM29/kfoOtd
 zFnpmZ0pSyNvXtwZlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=P75Rtt3+
Subject: [Buildroot] [PATCH v3 1/2]
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, romain.naour@smile.fr,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since commit 947dbc92a20c5acea7882166cae7893e6ea661e1 the Bootlin
stable toolchain uses headers 5.4, which can lead to build outputs
incompatible with older kernels. Update to the latest 5.4 kernel to
avoid this. The kernel config is updated according to the requirements
of current Docker, runc, and crun.

Additionally switch the CPU of the test VM to Haswell, to avoid
dockerd failing to start with a "This program can only be run on AMD64
processors with v3 microarchitecture support" error.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Add this patch to avoid test failures observed with what's now patch
  2 alone, though not necessarily caused by it

 .../testing/conf/docker-compose-kernel.config | 57 +++++++++++++------
 .../tests/package/test_docker_compose.py      |  4 +-
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
