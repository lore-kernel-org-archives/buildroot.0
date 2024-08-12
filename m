Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE601C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911694043D;
	Mon, 12 Aug 2024 09:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQAt66qLOAy0; Mon, 12 Aug 2024 09:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593B84048F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593B84048F;
	Mon, 12 Aug 2024 09:18:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4CB21BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE506069B
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js5ZXTHRU5Xw for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43BA605A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E43BA605A5
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:18:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D380984567; Mon, 12 Aug 2024 09:18:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:11:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0f8fc927558221e466c13a9931f556cdec4e4813
X-Git-Newrev: 126b7ffee72cc4a8ed6b8bc746c1cc92f858f7c5
X-Patchwork-Hint: ignore
Message-Id: <20240812091819.D380984567@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mupdf: drop
 MUPDF_PKG_CONFIG_PACKAGES
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=126b7ffee72cc4a8ed6b8bc746c1cc92f858f7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This variable might have been needed in the very distant past to help
mupdf find libraries, but mupdf's Makefile now properly uses
pkg-config to find the 5 libraries freetype2, gumbo, harfbuzz, libjpeg
and zlib, so our code has become redundant: drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f7deaa1330baad303afb76a7711faeeb1ddfee5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mupdf/mupdf.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 08894d7980..4aef0f99e7 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,22 +22,12 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
-# The pkg-config name for gumbo-parser is `gumbo`.
-MUPDF_PKG_CONFIG_PACKAGES = \
-	freetype2 \
-	gumbo \
-	harfbuzz \
-	libjpeg \
-	zlib
-
 MUPDF_CFLAGS = \
 	$(TARGET_CFLAGS) \
-	`$(PKG_CONFIG_HOST_BINARY) --cflags $(MUPDF_PKG_CONFIG_PACKAGES)` \
 	-fPIC # -fPIC is needed because the Makefile doesn't append it.
 
 MUPDF_LDFLAGS = \
-	$(TARGET_LDFLAGS) \
-	`$(PKG_CONFIG_HOST_BINARY) --libs $(MUPDF_PKG_CONFIG_PACKAGES)`
+	$(TARGET_LDFLAGS)
 
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
