From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Thu,  6 Jun 2013 14:28:46 +0200
Subject: [Buildroot] [PATCH 1/1] pulseaudio : bump to version 4.0
Message-ID: <1370521726-17125-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

removes a patch that was integrated upstream

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 .../pulseaudio-compat-with-json-c-0.11.patch       |   26 --------------------
 package/multimedia/pulseaudio/pulseaudio.mk        |    2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch

diff --git a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch b/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
deleted file mode 100644
index 86efdfd..0000000
--- a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 759c0bc6f990240287a14fa6dec029ecea581463 Mon Sep 17 00:00:00 2001
-From: Arun Raghavan <arun.raghavan@collabora.co.uk>
-Date: Sat, 27 Apr 2013 03:27:05 +0000
-Subject: build-sys: json-c changed everything :(
-
-json-c 0.11 ships a pkg-config file with a different name, and changes
-the name of its library as well.
----
-(limited to 'configure.ac')
-
-diff --git a/configure.ac b/configure.ac
-index c8161a4..b1bd21a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -624,7 +624,8 @@ AM_CONDITIONAL([HAVE_TESTS], [test "x$HAVE_LIBCHECK" = x1])
- 
- #### json parsing ####
- 
--PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])
-+PKG_CHECK_MODULES(LIBJSON, [ json-c >= 0.11 ], [],
-+		  [PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])])
- AC_SUBST(LIBJSON_CFLAGS)
- AC_SUBST(LIBJSON_LIBS)
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 529f5dd..8c1773b 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -3,7 +3,7 @@
 # pulseaudio
 #
 ################################################################################
-PULSEAUDIO_VERSION = 3.0
+PULSEAUDIO_VERSION = 4.0
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_CONF_OPT = \
-- 
1.7.10.4
