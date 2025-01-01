Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F9AE77197
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B53156069E;
	Wed,  1 Jan 2025 20:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDInBubE32yf; Wed,  1 Jan 2025 20:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6606065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6606065C;
	Wed,  1 Jan 2025 20:55:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FEECF29
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E5BB8176A
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fHFb-WymLJ9 for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 713B580CAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 713B580CAF
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 713B580CAF
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:55:39 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id BD533240CCC;
 Wed,  1 Jan 2025 21:55:37 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 89B022405BB;
 Wed,  1 Jan 2025 21:55:37 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id E5124241840;
 Wed,  1 Jan 2025 21:55:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Han Gao <rabenda.cn@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Wed,  1 Jan 2025 21:54:33 +0100
Message-ID: <20250101205435.1513140-2-kilian.zinnecker@mail.de>
In-Reply-To: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3315
X-purgate-ID: 154282::1735764937-32D2889E-5849BEDB/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735764937;
 bh=57lfV3KD3Y5zNrRcyWuugqS1QvzVTGsV0DkhdGL2Ubc=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=b5DRIEbeirRVQpmUbs0IAG6oMq87yMUMc5WEzs9MXN5yL38zsRi6BKlbEk7rukXyo
 eG197KEBMf4wvWxvpf/AGtge8hWUZf7XcmV0X6nQjxrfWlEk2kE3bozKr30O7AI6dh
 zjDI1YFB4qPuu80Si7eDIyHrypX2+ynXeQILrNCDQF+N39KHGMUqr5L0l1VyhkhxZJ
 Ey63fJNJE6HxvnYDuYA/PFWjG7tw4ULYO/zORWp0eAD1D7Uyaw9Ws6169asvAFNUbv
 fy4cyk2E1yTe1K257CST+K5AWc1DlzNQTnG0KqIOcDGsktiNEcpjWQhUXKZ4oCfPPN
 KpRvg6ypUEgzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=b5DRIEbe
Subject: [Buildroot] [PATCH v6 1/2] package/xuantie-bins: new package
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

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
index 381bc9f490..848d0a27f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2045,6 +2045,7 @@ F:	board/radxa/rock5b/
 F:	configs/avnet_rzboard_v2l_defconfig
 F:	configs/rock5b_defconfig
 F:	package/rockchip-rkbin/
+F:	package/xuantie-bins/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/package/Config.in b/package/Config.in
index 17f458eee8..f5b2347637 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -660,6 +660,7 @@ endmenu
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
index 0000000000..51a5610154
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  ec0d3d7b0976de3288aa127d14bff9d5154a7d851d39593a1b7aa0ef9143f8ef  xuantie-bins-1.2.1.tar.gz
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
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
