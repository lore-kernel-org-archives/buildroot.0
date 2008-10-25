From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 02:16:20 +0200
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from configure
	options
Message-ID: <200810250216.21072.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option --disable-nls is not supported anymore in glib
since version 2.0, see file ChangeLog.pre-2-0 line 544.
---
 package/libglib2/libglib2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 1a20666..fa33db0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -45,7 +45,7 @@ LIBGLIB2_CONF_ENV =	\
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
-		--enable-static $(DISABLE_NLS)
+		--enable-static
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
 
-- 
1.5.6.4
