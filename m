Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792BC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1304055C;
	Mon, 12 Aug 2024 09:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxW_dvgz17UA; Mon, 12 Aug 2024 09:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFD24043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFD24043A;
	Mon, 12 Aug 2024 09:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41A421BF955
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEB0404C3
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI5-97a9337H for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EEF640274
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEF640274
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A66184496; Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:13:41 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ef7cf5871451666a4bc1357a90f5798afd1d58a8
X-Git-Newrev: aeced848bd5588dd62a1556d2d8093615d349cfa
X-Patchwork-Hint: ignore
Message-Id: <20240812091657.1A66184496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/mupdf: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=aeced848bd5588dd62a1556d2d8093615d349cfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
