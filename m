Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB96C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 23:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D6C821A9;
	Mon,  4 Dec 2023 23:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D6C821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knLxsuBGc1uX; Mon,  4 Dec 2023 23:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9890821D6;
	Mon,  4 Dec 2023 23:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9890821D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4429C1BF2A9
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 23:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABA2821A9
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 23:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ABA2821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os7xrPdAcdw4 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 23:12:21 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA1838175C
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 23:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1838175C
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 1E13D240CA6;
 Tue,  5 Dec 2023 00:12:19 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 014ED801E7;
 Tue,  5 Dec 2023 00:12:19 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id AFEE6240072;
 Tue,  5 Dec 2023 00:12:18 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 00:12:11 +0100
Message-Id: <20231204231212.36450-2-kilian.zinnecker@mail.de>
In-Reply-To: <20231204231212.36450-1-kilian.zinnecker@mail.de>
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3453
X-purgate-ID: 154282::1701731538-47DBA670-DDD1E115/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1701731539;
 bh=kQgciQPf3mjyKWwH6yXTIRIeKcdwtfDEHaY1HLAr7jM=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=q+XyYq8rDyvmLuK1t1TX/VIg3I/FrP+smcrUzxI+IbCEAtqCmw6Dr+y5QNzMSmlAn
 2QpdOJi/lX0ExcqUQ8fWO6ysae/vxYYVocnBkHh25uJWmIZssm/JtjZb4BWev29+6V
 pQe7skDXMXLUArKChiGnbtrfqQBbUER8beyzdq911e5D8hUyrNu/v1/YTcQFa79O5i
 3mIDFZWYoVwQco24dOKcB6bqX/avh7XXz8IDcRyBlqp2wu+w/Ll3wDbNjHroXAj0X1
 BMqJhSO0SrZicQ/M5FPRns9hh4IzqdV7+6MrtZ42qhOr+xDnsVLHSVAWrQxVKV+HqN
 Etj+IO5Hm+L7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=q+XyYq8r
Subject: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

This patch adds a package for Xuantie binary blobs. These binaries
are needed for the BeagleV-Ahead.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                             |  5 +++--
 package/Config.in                      |  1 +
 package/xuantie-bins/Config.in         |  6 ++++++
 package/xuantie-bins/xuantie-bins.hash |  1 +
 package/xuantie-bins/xuantie-bins.mk   | 27 ++++++++++++++++++++++++++
 5 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.hash
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f504ca8d36..4d18bc49d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1839,9 +1839,10 @@ N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
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
index fcc09b07c4..3772e2ac81 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -653,6 +653,7 @@ endmenu
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
+	source "package/xuantie-bins/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
new file mode 100644
index 0000000000..a04497ce6b
--- /dev/null
+++ b/package/xuantie-bins/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XUANTIE_BINS
+	bool "xuantie-bins"
+	depends on BR2_riscv
+	help
+	  This package provides binary blobs, needed for the
+	  BeagleV-Ahead's SoC (TH1520).
diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
new file mode 100644
index 0000000000..4d1ec297c9
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.hash
@@ -0,0 +1 @@
+sha256  608e9fec79823996004f65ba692a76d741307b0de23552d147ad1b567e7054dc  xuantie-bins-0a2e02bb53758cc12448d8670e65c854528a96b4-br1.tar.gz
diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
new file mode 100644
index 0000000000..3a5611cf36
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# xuantie-bins
+#
+################################################################################
+
+XUANTIE_BINS_VERSION = 0a2e02bb53758cc12448d8670e65c854528a96b4
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
