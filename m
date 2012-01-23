From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Jan 2012 10:49:39 +0100
Subject: [Buildroot] [git commit] fluxbox: bump to 1.3.2
Message-ID: <20120123095016.39FB190384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c034b33f241ca90918cfbb0901160f0e874e0c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Peter's patch (iconv fix) went upstream, so delete it

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fluxbox/fluxbox-1.3.1-iconv.patch |   37 -----------------------------
 package/fluxbox/fluxbox.mk                |    2 +-
 2 files changed, 1 insertions(+), 38 deletions(-)

diff --git a/package/fluxbox/fluxbox-1.3.1-iconv.patch b/package/fluxbox/fluxbox-1.3.1-iconv.patch
deleted file mode 100644
index 82b4507..0000000
--- a/package/fluxbox/fluxbox-1.3.1-iconv.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3ed2d03446cdf53fd10c8ad056d9f86db9923666 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 9 Sep 2011 20:35:49 +0200
-Subject: [PATCH] FbString: fix build without iconv
-
-Commit 690d926 (introduced FbTk::BidiString) broke building without
-HAVE_ICONV, because of wrong variable name and use of iconv_t type.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/FbTk/FbString.cc |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/src/FbTk/FbString.cc b/src/FbTk/FbString.cc
-index fd34693..5295a66 100644
---- a/src/FbTk/FbString.cc
-+++ b/src/FbTk/FbString.cc
-@@ -150,6 +150,7 @@ enum ConvType { FB2X = 0, X2FB, LOCALE2FB, FB2LOCALE, CONVSIZE };
- #ifdef HAVE_ICONV
- static iconv_t *iconv_convs = 0;
- #else
-+typedef int iconv_t;
- static int iconv_convs[CONVSIZE];
- #endif // HAVE_ICONV
- 
-@@ -292,7 +293,7 @@ string recode(iconv_t cd, const string &in) {
- 
-     return ret;
- #else
--    return str;
-+    return in;
- #endif // HAVE_ICONV
- }
- 
--- 
-1.7.5.4
-
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 5a123f0..5848606 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FLUXBOX_VERSION = 1.3.1
+FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
 
