Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F25C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11D04014E;
	Mon, 27 Dec 2021 21:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFKhmiiuSOcP; Mon, 27 Dec 2021 21:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 811DE401B1;
	Mon, 27 Dec 2021 21:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A55E1BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75360401A3
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2yAXVh-42hj for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3101F4019B
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DC1382BAE; Mon, 27 Dec 2021 21:15:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:19:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60acafc80648bd87e86c574912ee71bd8bc64cbf
X-Git-Newrev: 1da4ead4c2286047228f710d233933dfc04c51f0
X-Patchwork-Hint: ignore
Message-Id: <20211227211533.4DC1382BAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: bump to version 21.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1da4ead4c2286047228f710d233933dfc04c51f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (not needed since
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/47de887d7658cfd68df44b3acf710971054f957b)
- Disable gperf (added with
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/22a334bbf55c900b3efff12a3a676bd14b18decd)
- Disable manual tests (added with
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/db1bf17777068a34e7586236efefb74a42460932)
- Disable Qt6 (added with
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/e225b4b804881de02a5d1beb3f3f908a8f8ddc3d)
- Use ENABLE_BOOST (added with
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/26f8a7d1bc9c6cd511989d74fdb54f233b25d663)
- C++17 is mandatory since
  https://gitlab.freedesktop.org/poppler/poppler/-/commit/3f8b9e92aade630b90943fd3936bdaa089e0603d
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/poppler/poppler/-/blob/poppler-21.12.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...b-poppler-private.h-fix-build-with-gcc-11.patch | 48 ----------------------
 package/poppler/Config.in                          |  4 +-
 package/poppler/poppler.hash                       |  4 +-
 package/poppler/poppler.mk                         | 11 ++++-
 4 files changed, 13 insertions(+), 54 deletions(-)

diff --git a/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch b/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch
deleted file mode 100644
index afa887ff8c..0000000000
--- a/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1ae5ff981ae0484383c4733c56b72e56a3a37584 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 Aug 2021 10:43:13 +0200
-Subject: [PATCH] glib/poppler-private.h: fix build with gcc 11
-
-Fix the following build failure with gcc 11:
-
-In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
-                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
-                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib.h:32,
-                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/gobject/gbinding.h:28,
-                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib-object.h:22,
-                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler.h:22,
-                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:19:
-/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc: In function 'GType poppler_dest_get_type()':
-/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-private.h:155:13: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
-  155 |         if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
-      |             ^~~~~~~~~~~~~~~~~
-/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:28:1: note: in expansion of macro 'POPPLER_DEFINE_BOXED_TYPE'
-   28 | POPPLER_DEFINE_BOXED_TYPE (PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
-      | ^~~~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/dfcaac6487aaeb10412c3fe72a23135f8a70fefe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not needed because of
-https://gitlab.freedesktop.org/poppler/poppler/-/commit/47de887d7658cfd68df44b3acf710971054f957b]
----
- glib/poppler-private.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/poppler-private.h b/glib/poppler-private.h
-index 86b587fd..ff15eab0 100644
---- a/glib/poppler-private.h
-+++ b/glib/poppler-private.h
-@@ -152,7 +152,7 @@ gboolean _poppler_convert_pdf_date_to_gtime (const GooString *date,
- GType                                                                                 \
- type_name##_get_type (void)                                                           \
- {                                                                                     \
--        static volatile gsize g_define_type_id__volatile = 0;                         \
-+        static gsize g_define_type_id__volatile = 0;                                  \
- 	if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
- 	        GType g_define_type_id =                                              \
- 		    g_boxed_type_register_static (g_intern_static_string (#TypeName), \
--- 
-2.30.2
-
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 521e3e65a8..f59115813d 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_POPPLER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14, constexpr
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_FONTCONFIG
 	help
 	  Poppler is a PDF rendering library based on the xpdf-3.0
@@ -30,7 +30,7 @@ config BR2_PACKAGE_POPPLER_UTILS
 
 endif
 
-comment "poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 5"
+comment "poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index a06def6653..cf6c537063 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c7a130da743b38a548f7a21fe5940506fb1949f4ebdd3209f0e5b302fa139731  poppler-0.84.0.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  acb840c2c1ec07d07e53c57c4b3a1ff3e3ee2d888d44e1e9f2f01aaf16814de7  poppler-21.12.0.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a5a97d974b..23f04f6e51 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.84.0
+POPPLER_VERSION = 21.12.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
@@ -17,8 +17,12 @@ POPPLER_CONF_OPTS = \
 	-DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
 	-DBUILD_GTK_TESTS=OFF \
 	-DBUILD_QT5_TESTS=OFF \
+	-DBUILD_QT6_TESTS=OFF \
 	-DBUILD_CPP_TESTS=OFF \
-	-DENABLE_GTK_DOC=OFF
+	-DBUILD_MANUAL_TESTS=OFF \
+	-DENABLE_GTK_DOC=OFF \
+	-DENABLE_QT6=OFF \
+	-DRUN_GPERF_IF_PRESENT=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
@@ -26,6 +30,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_BOOST),y)
 POPPLER_DEPENDENCIES += boost
+POPPLER_CONF_OPTS += -DENABLE_BOOST=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_BOOST=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
