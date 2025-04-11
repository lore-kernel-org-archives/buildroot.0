Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6D0C369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80296FBE1;
	Fri, 11 Apr 2025 10:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFzhjsHeCuer; Fri, 11 Apr 2025 10:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5C76F808
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C5C76F808;
	Fri, 11 Apr 2025 10:45:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1346A108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C9160C2E
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYTdadx1Ye9A for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF50460E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF50460E22
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB952821F0; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:40 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: c76f11bffe1d3a7c4452221c098c1ed1cfd6b799
X-Git-Newrev: 9d3872edeabf3758070184157c0671200cf4e997
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.EB952821F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/cairo: bump to
 1.18.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d3872edeabf3758070184157c0671200cf4e997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

News:
- https://www.cairographics.org/news/cairo-1.18.4/

Other changes:
- 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
  has been dropped because it's upstream. [1]

- c_std=gnu11 override has been dropped because
  it's upstream. [2]

- Use the new 'lzo' option. [3]

[1] https://gitlab.freedesktop.org/cairo/cairo/-/commit/9607e19a9e4c1784e7b656772e1df82aea26f6e7
[2] https://gitlab.freedesktop.org/cairo/cairo/-/commit/b60f47dfd5bbe98aec43f6c356ba3be9a1b7989e
[3] https://gitlab.freedesktop.org/cairo/cairo/-/commit/c1748e79f0b18d44891bda2b6aa877175d802660

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 90bbe4f469f79fba02bd078d5bd0fed869dfcbc7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...o-ft-private.h-fix-missing-FT_Color-error.patch | 32 ----------------------
 package/cairo/cairo.hash                           |  4 +--
 package/cairo/cairo.mk                             | 11 ++++----
 3 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
deleted file mode 100644
index 3b18d8077b..0000000000
--- a/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From da698db0c20507f0e07492cbe40dbaf1c9053f71 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 12 Nov 2023 09:58:05 +0100
-Subject: [PATCH] cairo-ft-private.h: fix missing FT_Color error
-
-In file included from ../src/cairo-colr-glyph-render.c:37:
-../src/cairo-ft-private.h:87:30: error: unknown type name 'FT_Color'
-   87 |                              FT_Color               *palette,
-      |                              ^~~~~~~~
-
-Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/cairo-ft-private.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/cairo-ft-private.h b/src/cairo-ft-private.h
-index 836f7e523..6b0e30223 100644
---- a/src/cairo-ft-private.h
-+++ b/src/cairo-ft-private.h
-@@ -43,6 +43,8 @@
- 
- #if CAIRO_HAS_FT_FONT
- 
-+#include FT_COLOR_H
-+
- CAIRO_BEGIN_DECLS
- 
- typedef struct _cairo_ft_unscaled_font cairo_ft_unscaled_font_t;
--- 
-2.34.1
-
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index b2d384d01a..3c66c63f6d 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,5 +1,5 @@
-# From https://www.cairographics.org/releases/cairo-1.18.2.tar.xz.sha256sum
-sha256  a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a  cairo-1.18.2.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.4.tar.xz.sha256sum
+sha256  445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb  cairo-1.18.4.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index c741c97853..26c2555f9d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.18.2
+CAIRO_VERSION = 1.18.4
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
@@ -37,8 +37,7 @@ CAIRO_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dspectre=disabled \
 	-Dsymbol-lookup=disabled \
-	-Dgtk_doc=false \
-	-Dc_std=gnu11
+	-Dgtk_doc=false
 CAIRO_DEPENDENCIES = \
 	host-pkgconf \
 	fontconfig \
@@ -59,8 +58,7 @@ HOST_CAIRO_CONF_OPTS = \
 	-Dglib=enabled \
 	-Dspectre=disabled \
 	-Dsymbol-lookup=disabled \
-	-Dgtk_doc=false \
-	-Dc_std=gnu11
+	-Dgtk_doc=false
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
@@ -71,7 +69,10 @@ HOST_CAIRO_DEPENDENCIES = \
 	host-zlib
 
 ifeq ($(BR2_PACKAGE_LZO),y)
+CAIRO_CONF_OPTS += -Dlzo=enabled
 CAIRO_DEPENDENCIES += lzo
+else
+CAIRO_CONF_OPTS += -Dlzo=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
