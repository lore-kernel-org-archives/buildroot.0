Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA8BC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06551604AC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06551604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C226440426;
	Mon, 26 Jul 2021 06:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4PbTWsRZrze; Mon, 26 Jul 2021 06:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D7140433;
	Mon, 26 Jul 2021 06:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8C01BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFCA84018A
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13--J8WU4Nc2 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29788400EC
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:10:51 +0000 (UTC)
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout08.t-online.de (Postfix) with SMTP id 5D294902F9
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:10:48 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (SyBt6QZVQhENtqpzHRg33qN1phULa2hFv0rJ4Q+O7nJLiTbIcZATOlF+OESCTV4g0T@[91.58.13.189])
 by fwd24.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m7tp8-1xKPuS0; Mon, 26 Jul 2021 08:10:46 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:38018)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1m7tp8-0001gk-4u
 for buildroot@buildroot.org; Mon, 26 Jul 2021 08:10:46 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:10:46 +0200
Message-Id: <20210726061046.478506-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: SyBt6QZVQhENtqpzHRg33qN1phULa2hFv0rJ4Q+O7nJLiTbIcZATOlF+OESCTV4g0T
X-TOI-EXPURGATEID: 150726::1627279846-0000AED3-855BD359/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c437604-6845-4016-aaf1-7523fb506ad2
Subject: [Buildroot] [PATCH 1/1] package/libogg: bump version to 1.3.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Changelog:
https://gitlab.xiph.org/xiph/ogg/-/blob/master/CHANGES

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted hashes.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libogg/Config.in   | 2 +-
 package/libogg/libogg.hash | 8 +++-----
 package/libogg/libogg.mk   | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libogg/Config.in b/package/libogg/Config.in
index bf719ff4d7..48c62063c2 100644
--- a/package/libogg/Config.in
+++ b/package/libogg/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBOGG
 	  with all Xiph.org technology is it an open format free for
 	  anyone to use.
 
-	  http://xiph.org/ogg/
+	  https://xiph.org/ogg/
diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 5d95c85d3a..9727c1cfaa 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,7 +1,5 @@
-# From: http://www.xiph.org/downloads/
-md5 eadef24aad6e3e8379ba0d14971fd64a  libogg-1.3.4.tar.xz
-sha1 f07499a35566aa62affb5ca989f62eed5b8092c3  libogg-1.3.4.tar.xz
-sha256 c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe  libogg-1.3.4.tar.xz
+# From https://www.xiph.org/downloads/
+sha256  c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705  libogg-1.3.5.tar.xz
 
 # Hash for license file:
-sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814 COPYING
+sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 08e5f87b72..3faf1b7357 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.4
+LIBOGG_VERSION = 1.3.5
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
-LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
+LIBOGG_SITE = https://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
 LIBOGG_LICENSE_FILES = COPYING
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
