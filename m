Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE30C02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B911405F0;
	Sat, 14 Sep 2024 12:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9sYQYHpOCo0; Sat, 14 Sep 2024 12:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1A641211
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D1A641211;
	Sat, 14 Sep 2024 12:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 449C11BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FCDC405AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgNnkFCtwIW5 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26F8A405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F8A405CC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26F8A405CC
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:43:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BC0A20002;
 Sat, 14 Sep 2024 12:43:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spS7q-0052K2-1c;
 Sat, 14 Sep 2024 14:43:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:43:25 +0200
Message-Id: <20240914124337.1200461-8-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 08/20] package/madplay: fix typos in comments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch | 2 +-
 package/madplay/madplay.mk                                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
index 7d3fb8ddc6..448139e0ba 100644
--- a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
+++ b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
@@ -3,7 +3,7 @@ configure.ac: call AM_MKINSTALLDIRS to substitute @MKINSTALLDIRS@
 MKINSTALLDIRS is obsolete and doesn't get automatically called.
 
 Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
-occurence in *.in files.
+occurrence in *.in files.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 91ee44ab5f..b9162dd2fd 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -18,7 +18,7 @@ MADPLAY_AUTORECONF = YES
 # madplay uses libmad which has some assembly function that is not present in
 # Thumb mode:
 # Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
-# so, we desactivate Thumb mode
+# so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
