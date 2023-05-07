Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ADFC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CC7D41A06;
	Sun,  7 May 2023 16:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC7D41A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wY0uuK5lJaAw; Sun,  7 May 2023 16:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5914095A;
	Sun,  7 May 2023 16:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E5914095A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A50DF1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B38B40579
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B38B40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubxAGdxYICUO for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:39:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 942644016D
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 942644016D
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:39:48 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout08.t-online.de (Postfix) with SMTP id 9D9F61B140
 for <buildroot@buildroot.org>; Sun,  7 May 2023 18:39:45 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvhQH-29893J0; Sun, 7 May 2023 18:39:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33150)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvhQH-0004rT-0X
 for buildroot@buildroot.org; Sun, 07 May 2023 18:39:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:39:44 +0200
Message-Id: <20230507163945.4013013-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683477585-DED45C15-B88067AC/0/0 CLEAN NORMAL
X-TOI-MSGID: f7714049-f4ff-4eed-909b-0ff2f1c02a66
Subject: [Buildroot] [PATCH 1/2] package/freetype: bump version to 2.13.0
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

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/

Updated license hash due to upstream commits:

"fix spelling err in LICENSE.txt"
https://gitlab.freedesktop.org/freetype/freetype/-/commit/c0b4f6a8625a39ecd4c323d74ddec0e94fca214d

[autofit] Don't depend on 'hb-ft'.
https://gitlab.freedesktop.org/freetype/freetype/-/commit/ebe7e9128cdf81cb0a0d27fe293ecff96f6c98a8
Since we build freetype without harfbuzz support anyway no changes to
the license information of this package are necessary.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index a558a3e846..60eb8dbb1d 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/
-sha1  5133eed28a7624ffabbf6d00aa3f68b841d62d80  freetype-2.12.1.tar.xz
-sha256  4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f  freetype-2.12.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
+sha1  6393c1451c2f1c5f83aed5ea92d280af078e27d9  freetype-2.13.0.tar.xz
+sha256  5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c  freetype-2.13.0.tar.xz
 
 # Locally calculated
-sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
+sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 36ef3cb527..4d7c4cd0d5 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.12.1
+FREETYPE_VERSION = 2.13.0
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
