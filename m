Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F3C48BF0
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 23:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD8582320;
	Wed, 14 Feb 2024 23:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAIuaJ3_vXoQ; Wed, 14 Feb 2024 23:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BDA8316F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BDA8316F;
	Wed, 14 Feb 2024 23:30:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29CAB1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1735A417C7
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_jDQBOJRB8w for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 23:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4400F417DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4400F417DA
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4400F417DA
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:30:39 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id E6A77240EE4;
 Thu, 15 Feb 2024 00:30:37 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id C82B480209;
 Thu, 15 Feb 2024 00:30:37 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 74859240A48;
 Thu, 15 Feb 2024 00:30:37 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 00:30:27 +0100
Message-Id: <20240214233028.1226645-3-kilian.zinnecker@mail.de>
In-Reply-To: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3262
X-purgate-ID: 154282::1707953437-BD52E878-A03191B8/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707953437;
 bh=DaDvpPpT2Ual9zaJr7EmIoTIkug1kzkiUOtMsizBCS4=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=LOyLGvm/EWtXazIt6w0g9UTR112uj8c7iEqAKgP/tzA1EcuLUESfiuu8hsoXImG5O
 Zl9mC1KgLdhJsT81kAVVfojxctlt+xaVa/NMYPiIARfDCGsJs2F+FgZwqjrahp43I9
 csc0cbp9jV84STnhuPHtm412vmkpJ47N373dUwVA0gSwlNaaYBPXOkP7CYl2dFa0eG
 PmecY3ZZJD0hc29dhWSgbAtH0oeXbNXG5G+DF6C4HzjaCEXYUe3xDtzcsdLlclsfbq
 R7ICuatu4Vmv9g6QOQkdhjhWmUT2s+cR6dHZ0ZhVIXnpxsAPHmnYLlYniCbfdnHMVm
 Lf+tZr6ac+pvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=LOyLGvm/
Subject: [Buildroot] [PATCH v4 2/3] package/xuantie-bins: new package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a package for Xuantie binary blobs. The binary
blobs are needed for the BeagleV-Ahead's SoC (TH1520). They contain
an FPGA binary for power management and a binary for the audio
system.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/xuantie-bins/Config.in         |  8 ++++++++
 package/xuantie-bins/xuantie-bins.hash |  2 ++
 package/xuantie-bins/xuantie-bins.mk   | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.hash
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b75a92739a..e9a9910d69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1899,6 +1899,7 @@ F:	board/radxa/rock5b/
 F:	configs/avnet_rzboard_v2l_defconfig
 F:	configs/rock5b_defconfig
 F:	package/rockchip-rkbin/
+F:	package/xuantie-bins/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..b35cbc4038 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ endmenu
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
+	source "package/xuantie-bins/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
new file mode 100644
index 0000000000..18f5df1453
--- /dev/null
+++ b/package/xuantie-bins/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XUANTIE_BINS
+	bool "xuantie-bins"
+	depends on BR2_riscv
+	help
+	  This package provides binary blobs, needed for the
+	  BeagleV-Ahead's SoC (TH1520). They contain an FPGA binary
+	  (light_aon_fpga.bin) for power management and a binary for
+	  the audio system (light_c906_audio.bin).
diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
new file mode 100644
index 0000000000..5531a54617
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  92d2fee4688dc0598329d56cf7962f344d30b70e261a4cd9939b0912f06df26a  xuantie-bins-1.2.1.tar.gz
diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
new file mode 100644
index 0000000000..bccfc9587d
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xuantie-bins
+#
+################################################################################
+
+XUANTIE_BINS_VERSION = 1.2.1
+XUANTIE_BINS_SITE = $(call github,beagleboard,xuantie-ubuntu,beaglev-$(XUANTIE_BINS_VERSION))
+XUANTIE_BINS_LICENSE = PROPRIETARY
+
+XUANTIE_BINS_INSTALL_IMAGES = YES
+XUANTIE_BINS_INSTALL_TARGET = NO
+
+define XUANTIE_BINS_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/bins/light_aon_fpga.bin
+	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/bins/light_c906_audio.bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
