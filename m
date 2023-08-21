Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5981EEE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E997240B5B;
	Mon, 21 Aug 2023 22:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E997240B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0kyILbyQZAz; Mon, 21 Aug 2023 22:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E990740B56;
	Mon, 21 Aug 2023 22:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E990740B56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B56581BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEBA60E2D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEBA60E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEeo-ttISNDI for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:33:47 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9696F60B71
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9696F60B71
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id C1EB8A0355;
 Tue, 22 Aug 2023 00:33:44 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id A109A8029A;
 Tue, 22 Aug 2023 00:33:44 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 567E8241231;
 Tue, 22 Aug 2023 00:33:44 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:33:36 +0200
Message-Id: <20230821223337.9402-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230821223337.9402-1-kilian.zinnecker@mail.de>
References: <20230821223337.9402-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2927
X-purgate-ID: 154282::1692657224-EB7FD668-51DCB22F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692657224;
 bh=lZoBD3wqnZeeDfiBOTu1a9Eyys0o/gDMgbXSLZtopx0=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=n/QyBOVf2QurndLgjXGfEAR4QYAhkX9Iu6IHCUi1nGynOMLiTEpOrOQnv+6KN6BgS
 D0boGX/mtgJaL5X5RWO6vRlaVQFCimms4VfjY1F4231upnp/M9L3eoB+vm9apLAUj9
 wrbVyyUZXuVkPFl1ecE207NvOzetVnFmFrSiDeaXHEmC+294LjAV8gM8Uy2+eGhcr1
 ve4cfh6IZog4HOkThUXHTckk1vKpbBr8eyZZ3RwvWHcJcm5sR91M7yJ1nWpu9+8cie
 GWIVMhw4eNSBTyUyQPwUJNUQRS3PtwMKKMm2dLUhtIL08RorxR5e1eRy4sKGRMVfTv
 jF79PNX0n9Vqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=n/QyBOVf
Subject: [Buildroot] [PATCH v1 1/2] package/xuantie-bins: new package
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a package for Xuantie binary blobs. These binaries
are used for the BeagleV-Ahead.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                           |  5 +++--
 package/Config.in                    |  1 +
 package/xuantie-bins/Config.in       |  6 ++++++
 package/xuantie-bins/xuantie-bins.mk | 27 +++++++++++++++++++++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..5ecc2d3adf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1827,9 +1827,10 @@ N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
-F:	package/rockchip-rkbin/
-F:	configs/rock5b_defconfig
 F:	board/radxa/rock5b/
+F:	configs/rock5b_defconfig
+F:	package/rockchip-rkbin/
+F:	package/xuantie-bins/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..2c1538c404 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -644,6 +644,7 @@ endmenu
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
+	source "package/xuantie-bins/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
new file mode 100644
index 0000000000..a69cafdfc1
--- /dev/null
+++ b/package/xuantie-bins/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XUANTIE_BINS
+	bool "xuantie-bins"
+	depends on BR2_riscv
+	help
+	  This package provides binary blobs, needed for the
+          BeagleV-Ahead's SoC (TH1520).
diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
new file mode 100644
index 0000000000..f57c9cb2dd
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# xuantie-bins
+#
+################################################################################
+
+XUANTIE_BINS_VERSION = 604d86f6eb261ab9e53e987852e3aa397b4b16ad
+XUANTIE_BINS_SITE = https://github.com/beagleboard/xuantie-ubuntu.git
+XUANTIE_BINS_SITE_METHOD = git
+XUANTIE_BINS_LICENSE = PROPRIETARY
+
+XUANTIE_BINS_INSTALL_IMAGES = YES
+XUANTIE_BINS_INSTALL_TARGET = NO
+
+XUANTIE_BINS_FPGA_BIN_FILENAME = "bins/light_aon_fpga.bin"
+XUANTIE_BINS_AUDIO_BIN_FILENAME = "bins/light_c906_audio.bin"
+
+define XUANTIE_BINS_INSTALL_IMAGES_CMDS
+	$(foreach f, \
+		$(XUANTIE_BINS_FPGA_BIN_FILENAME) \
+		$(XUANTIE_BINS_AUDIO_BIN_FILENAME) \
+		, \
+		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
