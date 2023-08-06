Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF98EC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8779E60D6B;
	Sun,  6 Aug 2023 20:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8779E60D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XJgxd5xIP5l; Sun,  6 Aug 2023 20:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0ABB60B4E;
	Sun,  6 Aug 2023 20:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0ABB60B4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3353D1BF2F3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B65640217
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B65640217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kGIAHQf4c11 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:47:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B546C40547
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B546C40547
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0EB184607; Sun,  6 Aug 2023 20:47:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 22:47:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 03b228fd1a0bcc1905cd62c8f9167facdad2cd5a
X-Git-Newrev: 552a054d45f516990e6470338c18ce9f792c59b3
X-Patchwork-Hint: ignore
Message-Id: <20230806204753.A0EB184607@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/snps_arc700_nsim_defconfig: add ARC700 target for nSIM
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=552a054d45f516990e6470338c18ce9f792c59b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add ARC700 image configuration for nSIM instruction set simulator.

This is a nice starting point for ARC700 in nSIM.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  4 ++++
 board/synopsys/nsim/readme.txt     | 43 ++++++++++++++++++++++++++++++++++++++
 configs/snps_arc700_nsim_defconfig | 18 ++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ae5f89d88..9915143a04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2665,6 +2665,10 @@ F:	package/rtl8189fs/
 F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
+N:	Sergey Matyukevich <sergey.matyukevich@synopsys.com>
+F:	board/synopsys/nsim/
+F:	configs/snps_arc700_nsim_defconfig
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
diff --git a/board/synopsys/nsim/readme.txt b/board/synopsys/nsim/readme.txt
new file mode 100644
index 0000000000..cc89cf87ac
--- /dev/null
+++ b/board/synopsys/nsim/readme.txt
@@ -0,0 +1,43 @@
+How to build it
+===============
+
+Configure build for the selected nSIM target. For instance, for
+ARC700 nSIM target use the following defauilt configuration:
+$ make snps_arc700_nsim_defconfig
+
+Optionally modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+How to use it
+=============
+
+Resulting image can be booted using ARC nSIM instruction set simulator.
+Free version of nSIM is available for download:
+- https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
+It provides nsimdrv binary for Linux that can be used stand-alone
+or with GDB.
+
+To run ARC700 image use the following command:
+$ nsimdrv \
+	-prop=nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24 \
+	-prop=icache=32768,64,2,0 \
+	-prop=dcache=32768,64,4,0 \
+	-prop=nsim_isa_enable_timer_0=1 \
+	-prop=nsim_isa_enable_timer_1=1 \
+	-prop=nsim_isa_host_timer=1 \
+	-prop=nsim_mmu=3 \
+	-prop=nsim_isa_family=a700 \
+	-prop=nsim_isa_atomic_option=1 \
+	-prop=nsim_isa_dpfp=none \
+	-prop=nsim_isa_shift_option=2 \
+	-prop=nsim_isa_swap_option=1 \
+	-prop=nsim_isa_bitscan_option=1 \
+	-prop=nsim_isa_sat=1 \
+	-prop=nsim_isa_mpy32=1 \
+	-prop=isa_counters=1 \
+	-prop=nsim_isa_pct_counters=8 \
+	-prop=nsim_isa_pct_size=48 \
+	output/images/vmlinux
diff --git a/configs/snps_arc700_nsim_defconfig b/configs/snps_arc700_nsim_defconfig
new file mode 100644
index 0000000000..3964924bed
--- /dev/null
+++ b/configs/snps_arc700_nsim_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arcle=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="arc700"
+
+# Linux headers same as kernel, a 6.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.8"
+BR2_LINUX_KERNEL_DEFCONFIG="nsim_700"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Rootfs
+BR2_TARGET_ROOTFS_INITRAMFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
