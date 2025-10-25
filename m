Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B52CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 16:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225BE811C5;
	Sat, 25 Oct 2025 16:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MInSSHZZGJvW; Sat, 25 Oct 2025 16:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 371D28109E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371D28109E;
	Sat, 25 Oct 2025 16:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB2043F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2069340205
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubCkrpnPQ2ci for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A9BA40206
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A9BA40206
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF5B287723; Sat, 25 Oct 2025 16:58:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 11:34:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebd07998d0b3f5e748aba7a9aabbd7df879bc1a8
X-Git-Newrev: 9cae850cd70a81bfd0a6fb9887d8a08671784303
X-Patchwork-Hint: ignore
Message-Id: <20251025165814.EF5B287723@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: bump to version 2.5.33
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9cae850cd70a81bfd0a6fb9887d8a08671784303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch has been merged in version 2.5.32.

Update file hash due to conversion the ISO-8859 text to UTF-8:
https://github.com/gphoto/libgphoto2/commit/6fdc5f8f370b2716e7342f994c19b9c7ae37a0f6

Release notes:
https://github.com/gphoto/libgphoto2/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...n-length-with-jpeg-jeaders.-fixes-https-g.patch | 39 ----------------------
 package/libgphoto2/libgphoto2.hash                 |  4 +--
 package/libgphoto2/libgphoto2.mk                   |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
deleted file mode 100644
index 910c9b125a..0000000000
--- a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Mon, 4 Dec 2023 13:26:08 +0100
-Subject: [PATCH] align outlen length with jpeg jeaders. fixes
- https://github.com/gphoto/libgphoto2/issues/941
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5
----
- camlibs/ptp2/chdk.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index e1d898f37811..e775ea1d4bbb 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 	struct		jpeg_error_mgr jerr;
- 	JSAMPROW	row_ptr[1];
- 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
--	uint64_t	outlen = 0;
-+	unsigned long	outlen = 0;
- 	unsigned int	row_inc;
- 	int		sshift, dshift, xshift, skip;
- 
-@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 		sshift = 6;
- 		dshift = (width/height > 2) ? 6 : 12;
- 		xshift = 4;
--	/* Digic 6 cameras: 8 bit per element UYVY,
--	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
-+		/* Digic 6 cameras: 8 bit per element UYVY,
-+		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
- 	} else {
- 		row_inc = buf_width*2;
- 		sshift = 4;
--- 
-2.43.0
-
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index af52b47dc8..c2ff672613 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,3 +1,3 @@
 # Locally calculated hash
-sha256  a7253bd18c6ef65352150ac36a668f883a5ad2634eb6455b3ca9aa6ac98d0073  libgphoto2-2.5.27.tar.xz
-sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
+sha256  28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2  libgphoto2-2.5.33.tar.xz
+sha256  530128f45fc02d92d4dae04d9c1e1f28a078a9b0d32c0ab254c406ba8fba43ec  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index c1d5352c00..851eb401a1 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.27
+LIBGPHOTO2_VERSION = 2.5.33
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
