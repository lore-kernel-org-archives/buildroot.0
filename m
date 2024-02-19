Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DCEC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7517D40680;
	Mon, 19 Feb 2024 09:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqPh6OCkX0-s; Mon, 19 Feb 2024 09:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A053540746
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A053540746;
	Mon, 19 Feb 2024 09:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E35D1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEE3140746
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDYvfrmGLr5l for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B6E14079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B6E14079A
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B6E14079A
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:52:41 +0000 (UTC)
Received: from wslxew206.. (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 4ADE55241620;
 Mon, 19 Feb 2024 10:52:39 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 10:51:54 +0100
Message-Id: <20240219095155.2758428-2-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219095155.2758428-1-anaumann@ultratronik.de>
References: <20240219095155.2758428-1-anaumann@ultratronik.de>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 1/2] package/flutter-engine: bump to version
 3.19.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This also fixes an error during configure due to 3.16.8 not being
compatible to Python 3.12 (which we lately bumped to)

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d08274f546..0d719e29eb 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.8
+FLUTTER_ENGINE_VERSION = 3.19.0
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
