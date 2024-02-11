Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8268C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 12:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E4082273;
	Sun, 11 Feb 2024 12:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yEJEm3BCmQZ; Sun, 11 Feb 2024 12:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E298227F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E298227F;
	Sun, 11 Feb 2024 12:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 691601BF33A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C2A402B1
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tmf8BkUHYqUq for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 12:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFF33400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF33400FE
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFF33400FE
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 12:09:13 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 95AAC240BC5;
 Sun, 11 Feb 2024 13:09:11 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 6CEA080283;
 Sun, 11 Feb 2024 13:09:11 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 85B99240C90;
 Sun, 11 Feb 2024 13:09:10 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 13:08:55 +0100
Message-Id: <20240211120857.6622-2-kilian.zinnecker@mail.de>
In-Reply-To: <20240211120857.6622-1-kilian.zinnecker@mail.de>
References: <20240211120857.6622-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3383
X-purgate-ID: 154282::1707653351-455BD670-96D5C219/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707653351;
 bh=ranGwht6VXmolwXJOc5+8tYwAswiDx5ixtsdoENnoQg=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=eq7qMtf09mEU4iMS7p2H+/bOKtVL8KU3vkzsikrbPW4nBC17piFpARWTNaQ8yRTm3
 fq9Hv/PSUsOPYoT9YZ/7SE9jRlTiWIvJ64q0u5QfaDnkfl633NyF3GvxyRgH3vAiv7
 Qv15+mDWcwaabAIwQpbgQ71J3UukLhEyUl7rcIQeHHxQ+MGBtMOydZnZ/A+UqyJUdb
 jjx0Fyr6Sjz+fEl9kKZLLHXP6neCnYE7pvw4qhT9vlN/PsqnwH7soJX0XjJFGDZYZP
 qr/rdDtXJERYLboeUXKscYtra8b2G1EohGC6+DQ9TpV3fxO5CrDM2VGbcH2buU+5vq
 uMB5JNCjEuDKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=eq7qMtf0
Subject: [Buildroot] [PATCH v3 1/2] package/xuantie-bins: new package
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

This patch adds a package for Xuantie binary blobs. These binaries
are needed for the BeagleV-Ahead.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/xuantie-bins/Config.in         |  8 ++++++++
 package/xuantie-bins/xuantie-bins.hash |  1 +
 package/xuantie-bins/xuantie-bins.mk   | 23 +++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/xuantie-bins/Config.in
 create mode 100644 package/xuantie-bins/xuantie-bins.hash
 create mode 100644 package/xuantie-bins/xuantie-bins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..fa0596fd6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1894,6 +1894,7 @@ F:	board/radxa/rock5b/
 F:	configs/rock5b_defconfig
 F:	configs/avnet_rzboard_v2l_defconfig
 F:	package/rockchip-rkbin/
+F:	package/xuantie-bins/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00..5e28fb6e88 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -657,6 +657,7 @@ endmenu
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
+	source "package/xuantie-bins/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xuantie-bins/Config.in b/package/xuantie-bins/Config.in
new file mode 100644
index 0000000000..40388edd06
--- /dev/null
+++ b/package/xuantie-bins/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XUANTIE_BINS
+	bool "xuantie-bins"
+	depends on BR2_riscv
+	help
+	  This package provides binary blobs, needed for the
+	  BeagleV-Ahead's SoC (TH1520). They contain an FPGA binary
+          (light_aon_fpga.bin) for power management and a binary for
+          the audio system (light_c906_audio.bin).
diff --git a/package/xuantie-bins/xuantie-bins.hash b/package/xuantie-bins/xuantie-bins.hash
new file mode 100644
index 0000000000..4d1ec297c9
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.hash
@@ -0,0 +1 @@
+sha256  608e9fec79823996004f65ba692a76d741307b0de23552d147ad1b567e7054dc  xuantie-bins-0a2e02bb53758cc12448d8670e65c854528a96b4-br1.tar.gz
diff --git a/package/xuantie-bins/xuantie-bins.mk b/package/xuantie-bins/xuantie-bins.mk
new file mode 100644
index 0000000000..6db18685bc
--- /dev/null
+++ b/package/xuantie-bins/xuantie-bins.mk
@@ -0,0 +1,23 @@
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
+	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(XUANTIE_BINS_FPGA_BIN_FILENAME)
+	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(XUANTIE_BINS_AUDIO_BIN_FILENAME)
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
