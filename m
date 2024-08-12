Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B523CC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84239405D8;
	Mon, 12 Aug 2024 09:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XWhYKAqz8BN; Mon, 12 Aug 2024 09:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C3C405F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C3C405F9;
	Mon, 12 Aug 2024 09:18:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8AD51BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D63AA8114F
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBMjUsaQ4pbe for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07FB8101F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07FB8101F
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:18:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB9298456E; Mon, 12 Aug 2024 09:18:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:12:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d9c2b374ec4c8224a7f7a2f4d1518f001684c403
X-Git-Newrev: cc63dd68dd5ce0aad83990baa7b7d0295878de2b
X-Patchwork-Hint: ignore
Message-Id: <20240812091819.EB9298456E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mupdf: drop
 MUPDF_CFLAGS/MUPDF_LDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc63dd68dd5ce0aad83990baa7b7d0295878de2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Now that MUPDF_CFLAGS and MUPDF_LDFLAGS are just TARGET_CFLAGS and
TARGET_LDFLAGS, drop them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 90f0a484671098f9a94ce66b8f8af94e106ae106)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mupdf/mupdf.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index e3fe66e396..5f73b680a6 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,17 +22,11 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
-MUPDF_CFLAGS = \
-	$(TARGET_CFLAGS)
-
-MUPDF_LDFLAGS = \
-	$(TARGET_LDFLAGS)
-
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-	XCFLAGS="$(MUPDF_CFLAGS)" \
-	XLIBS="$(MUPDF_LDFLAGS)" \
+	XCFLAGS="$(TARGET_CFLAGS)" \
+	XLIBS="$(TARGET_LDFLAGS)" \
 	USE_SYSTEM_LIBS=yes
 
 MUPDF_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
