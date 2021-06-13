Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53829C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1237460D07
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1237460D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8049405F5;
	Tue,  3 Aug 2021 23:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgQl6276Zz0T; Tue,  3 Aug 2021 23:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F82F4025C;
	Tue,  3 Aug 2021 23:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 063DE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7FE240639
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLBpCt-VEC7T for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A4E4060A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C844868B1; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 18:37:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dc97260606d41fed2d1f8effc09cff7352440395
X-Git-Newrev: 54ba3be13b7177a55bc77e219fd0ffccbe80acff
X-Patchwork-Hint: ignore
Message-Id: <20210803210951.0C844868B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdk-pixbuf: bump to
 version 2.42.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=54ba3be13b7177a55bc77e219fd0ffccbe80acff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-meson.build-link-with-lintl-if-needed.patch | 45 ----------------------
 ...gdk-pixbuf-io.c-fix-build-without-gmodule.patch | 41 --------------------
 package/gdk-pixbuf/Config.in                       |  2 +-
 package/gdk-pixbuf/gdk-pixbuf.hash                 |  5 +--
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  2 +-
 5 files changed, 4 insertions(+), 91 deletions(-)

diff --git a/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch b/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch
deleted file mode 100644
index 08a3a681cf..0000000000
--- a/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 65c8bc8ec4ae8dd140b0205a61d0d216fa45d819 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 28 Jan 2021 07:50:44 +0100
-Subject: [PATCH] meson.build: link with lintl if needed
-
-Link with -lintl to avoid the following build failure:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: gdk-pixbuf/libgdk_pixbuf-2.0.so.0.4200.2.p/gdk-pixbuf-util.c.o: in function `_gdk_pixbuf_init_gettext':
-gdk-pixbuf-util.c:(.text+0xbc0): undefined reference to `libintl_bindtextdomain'
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: gdk-pixbuf-util.c:(.text+0xbc8): undefined reference to `libintl_bindtextdomain'
-
-Fixes:
- - http://autobuild.buildroot.org/results/894359558100ea9637feba16deaf99923805d0f2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/101]
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1cef125a3..973948108 100644
---- a/meson.build
-+++ b/meson.build
-@@ -93,6 +93,7 @@ if cc.has_function('lrint', dependencies: mathlib_dep)
-   gdk_pixbuf_conf.set('HAVE_LRINT', 1)
- endif
- 
-+intl_dep = cc.find_library('intl', required: false)
- if cc.has_function('bind_textdomain_codeset', prefix: '#include <libintl.h>')
-   gdk_pixbuf_conf.set('HAVE_BIND_TEXTDOMAIN_CODESET', 1)
- endif
-@@ -212,7 +213,7 @@ if medialib_dep.found()
- endif
- 
- gdk_pixbuf_deps = [ mathlib_dep, glib_dep, gobject_dep, gmodule_dep, gio_dep,
--                    shared_mime_dep, medialib_dep ]
-+                    shared_mime_dep, medialib_dep, intl_dep ]
- 
- # Check if we can build shared modules
- if gmodule_dep.type_name() == 'pkgconfig'
--- 
-2.29.2
-
diff --git a/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch b/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
deleted file mode 100644
index 74bc967a68..0000000000
--- a/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 46c7fe11bd0ed8595c3f920d42a9914fa864d893 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Feb 2021 18:51:14 +0100
-Subject: [PATCH] gdk-pixbuf/gdk-pixbuf-io.c: fix build without gmodule
-
-Fix the following build failure:
-
-../gdk-pixbuf/gdk-pixbuf-io.c: In function 'gdk_pixbuf_io_init':
-../gdk-pixbuf/gdk-pixbuf-io.c:681:16: error: implicit declaration of function 'gdk_pixbuf_get_module_file'; did you mean '_gdk_pixbuf_get_module'? [-Werror=implicit-function-declaration]
-  681 |  module_file = gdk_pixbuf_get_module_file ();
-      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
-      |                _gdk_pixbuf_get_module
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cd54c497f5d19342ec94ece713547b887e4c02d
-
-Upstream status: Accepted
-https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/103
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gdk-pixbuf/gdk-pixbuf-io.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gdk-pixbuf/gdk-pixbuf-io.c b/gdk-pixbuf/gdk-pixbuf-io.c
-index 40eb920c8..2dc2ea6da 100644
---- a/gdk-pixbuf/gdk-pixbuf-io.c
-+++ b/gdk-pixbuf/gdk-pixbuf-io.c
-@@ -678,7 +678,9 @@ gdk_pixbuf_io_init (void)
- 	gboolean ret;
- 
- 	gdk_pixbuf_io_init_builtin ();
-+#ifdef USE_GMODULE
- 	module_file = gdk_pixbuf_get_module_file ();
-+#endif
- 	ret = gdk_pixbuf_io_init_modules (module_file, NULL);
- 	g_free (module_file);
- 	return ret;
--- 
-2.29.2
-
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 44942ac4f6..0ba6dda8af 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
 	  and the GLib, to integrate well with GNOME applications.
 
-	  http://www.gtk.org/
+	  https://www.gtk.org/
 
 comment "gdk-pixbuf needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index be7593aebf..5e7dc7e03b 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,4 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.2.sha256sum
-sha256  83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15  gdk-pixbuf-2.42.2.tar.xz
-# Locally calculated
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.4.sha256sum
+sha256  fe9c5dd88f486194ea2bc09b8814c1ed895bb6c530f37cbbf259757c4e482e4d  gdk-pixbuf-2.42.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 1bd422c0a1..cd30d450d5 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).4
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
