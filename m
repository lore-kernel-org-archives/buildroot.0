Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FF8C35FF3
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7751283934;
	Tue, 18 Mar 2025 15:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl4Z-s01cxxA; Tue, 18 Mar 2025 15:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244CC81D21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 244CC81D21;
	Tue, 18 Mar 2025 15:05:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53E0F16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DDCE4095A
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhMN7oT-u04e for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1690C40864
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1690C40864
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C1BB84755; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 19:22:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 086f8472d6325b137985f3b1b817b08815dd5c87
X-Git-Newrev: 29861832a38976911d931256e8e5a3aad526e761
X-Patchwork-Hint: ignore
Message-Id: <20250318150244.0C1BB84755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sipeed-lpi4abin: add licheepi4a
 boot bins
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29861832a38976911d931256e8e5a3aad526e761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sipeed LicheePi 4A requires some proprietary binaries
for booting, these are provided in the th1520-boot-firmware
repo [1]. These binaries are also required for the onboard
sound and wifi.

[1] https://github.com/revyos/th1520-boot-firmware

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
[Julien:
  - add Signed-off-by line in commit log
  - reindent SIPEED_LPI4ABIN_FILES with 1 tab
  - fix DEVELOPERS entry (remove extra 's')
  - add upstream url in Config.in
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/sipeed-lpi4abin/Config.in            |  8 ++++++++
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash |  2 ++
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25cb5dc764..b28fd9167c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2055,6 +2055,9 @@ F:	package/libodb-mysql/
 F:	package/libqb/
 F:	package/usbguard/
 
+N:	Kanak Shilledar <kanakshilledar@gmail.com>
+F:	package/sipeed-lpi4abin/
+
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
 F:	package/openvmtools/
diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..ce8cb95d7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -616,6 +616,7 @@ endmenu
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
+	source "package/sipeed-lpi4abin/Config.in"
 	source "package/sispmctl/Config.in"
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
diff --git a/package/sipeed-lpi4abin/Config.in b/package/sipeed-lpi4abin/Config.in
new file mode 100644
index 0000000000..c77266eb31
--- /dev/null
+++ b/package/sipeed-lpi4abin/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SIPEED_LPI4ABIN
+	bool "sipeed-lpi4abin"
+	depends on BR2_riscv
+	help
+	  This package provides TH1520 SoC binary blobs for
+	  LicheePi 4A.
+
+	  https://github.com/revyos/th1520-boot-firmware
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
new file mode 100644
index 0000000000..9d66be164b
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  a1c608a7b0cc641d39666a07d8bb1a73ded35385316989c3e8182d968ed89b3e  sipeed-lpi4abin-44ec4e1cc82141963842ec45db0d1617f9f07e75-git4.tar.gz
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
new file mode 100644
index 0000000000..f2338576d8
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sipeed-lpi4abin
+#
+################################################################################
+
+SIPEED_LPI4ABIN_VERSION = 44ec4e1cc82141963842ec45db0d1617f9f07e75
+SIPEED_LPI4ABIN_SITE = https://github.com/revyos/th1520-boot-firmware.git
+SIPEED_LPI4ABIN_SITE_METHOD = git
+SIPEED_LPI4ABIN_LICENSE = PROPRIETARY
+
+SIPEED_LPI4ABIN_INSTALL_IMAGES = YES
+SIPEED_LPI4ABIN_INSTALL_TARGET = NO
+
+SIPEED_LPI4ABIN_FILES = \
+	addons/boot/light_aon_fpga.bin \
+	addons/boot/light_c906_audio.bin \
+	addons/boot/str.bin
+
+define SIPEED_LPI4ABIN_INSTALL_IMAGES_CMDS
+	$(foreach f,$(SIPEED_LPI4ABIN_FILES), \
+		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/bootbins $(@D)/$(f)
+	)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
