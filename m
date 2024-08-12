Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FA4C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B163C4048F;
	Mon, 12 Aug 2024 09:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AE4LifOwgBUi; Mon, 12 Aug 2024 09:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CC140504
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CC140504;
	Mon, 12 Aug 2024 09:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E268F1BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD0848118A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9YVHFKROpc7 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065D68114F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 065D68114F
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 026D084578; Mon, 12 Aug 2024 09:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:12:46 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cc63dd68dd5ce0aad83990baa7b7d0295878de2b
X-Git-Newrev: 83bfb10a71005bbf941822af42d37695b9569179
X-Patchwork-Hint: ignore
Message-Id: <20240812091820.026D084578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mupdf: make X11
 support optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=83bfb10a71005bbf941822af42d37695b9569179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The X11 support in mupdf is actually optional, and it does require
libXext in addition to libX11, so adjust the packaging accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2c0d7b72c0993a55c8dcb7b38d85792e1bf6e8bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mupdf/Config.in | 2 --
 package/mupdf/mupdf.mk  | 8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index cf97711160..34c5e7d538 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MUPDF
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
 	select BR2_PACKAGE_HARFBUZZ
@@ -11,7 +10,6 @@ config BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_OPENJPEG
-	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_ZLIB
 	help
 	  MuPDF is a lightweight PDF, XPS, and E-book viewer.
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 5f73b680a6..d813d9b7de 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -19,7 +19,6 @@ MUPDF_DEPENDENCIES = \
 	host-pkgconf \
 	jbig2dec jpeg \
 	lcms2 openjpeg \
-	xlib_libX11 \
 	zlib
 
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
@@ -39,6 +38,13 @@ else
 MUPDF_MAKE_OPTS += shared=yes
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
+MUPDF_MAKE_OPTS += HAVE_X11=yes
+MUPDF_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+MUPDF_MAKE_OPTS += HAVE_X11=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MUPDF_DEPENDENCIES += libfreeglut
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
