Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E535CA0EFA
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 13:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14ACA84C98;
	Mon, 25 Aug 2025 13:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bjncvapaBtC; Mon, 25 Aug 2025 13:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D16284C94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D16284C94;
	Mon, 25 Aug 2025 13:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA6D114
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B1461150
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cq6R3oeEDk34 for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56F6D61CAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F6D61CAB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56F6D61CAB
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.97]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1u5LHt01m8-00b2o5; Mon, 25
 Aug 2025 15:46:53 +0200
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 15:46:30 +0200
Message-ID: <20250825134631.2405569-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:JKjCTShT/sCHYISbiGW0Q5SwVDYEVLbtdnwjCHfKn7zneIDMd0q
 inwCzyqEz7uVwsJGFBuSL1Om3nPOx6SQ8OQ9uTmhwP+9ZBU6tUXJR2ntu1xu1GqeNfsP3qM
 2t32LQOCM9A/R1yWi0l2qPlUQ/rtTaDy1rzuayNjGhBt695Pc746O8IOb4f3XEiU0s2gH46
 1PmequhnoN6DivtCGVIrQ==
UI-OutboundReport: notjunk:1;M01:P0:fTG6vtIIMgI=;o1UUjXYrdjXVPBHOLCaPHfWNwPB
 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
 vvgyCTvilT7pWUtySEJqrofyoaZUMUxA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756129613; x=1756734413; i=fiona.klute@gmx.de;
 bh=gKCyazSfvNeeSO9NEPLGvJvl0senph4uNoT5ifeEFm4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GpllCFEmyBtje+u6a3Hp08xC8SJYRsnPFmrk4Cj/tI1nCXqqbp9MEfghVL0x3fiI
 3vzv9Pm1qm9K8PjQKI2rO65pYqdyHnrMl6C4LdLQWkZ8AzCIZMhhlNGXM0MyIn3xv
 gcgq1+yela9eQjFRkao7Mp1sD/cAyZs4iH9pGeEXouVOSO9xMNVel+Oc+h2I2sJ+0
 I01jD8IET5oTeeud9kn3fl2OMQH7qcSisPDBRgd+UPUFcHbGPQDSKJQNgwmLLVr6F
 d+URg4vLAIpphZeunNN7uJWUSutQSMHsEIZRezsFOcH3OFN691YIynli8HpBUK00K
 OabatdnPYoiZztHwfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=GpllCFEm
Subject: [Buildroot] [PATCH v2 1/2]
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
Cc: Romain Naour <romain.naour@smile.fr>,
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
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
