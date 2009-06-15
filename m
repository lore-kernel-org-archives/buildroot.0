From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2009 21:21:11 +0200
Subject: [Buildroot] [PATCH 1/1] Upgrade classpath version and fix
	compilation
In-Reply-To: <1245093671-17826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1245093671-17826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1245093671-17826-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * Upgrade to version 0.98
 * Use --disable-Werror, otherwise it doesn't build since warnings are
   treated as errors
 * Don't depend on tiff, which isn't mandatory, and doesn't
   build. Once tiff is fixed, we can re-add it as a dependency.
---
 package/java/classpath/classpath.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index faa6341..71c18a0 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -3,7 +3,7 @@
 # classpath 0.96.1
 #
 #############################################################
-CLASSPATH_VERSION = 0.97.1
+CLASSPATH_VERSION = 0.98
 CLASSPATH_SOURCE = classpath-$(CLASSPATH_VERSION).tar.gz
 CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
 CLASSPATH_AUTORECONF = NO
@@ -51,9 +51,10 @@ CLASSPATH_CONF_OPT = \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug \
-		--disable-gconf-peer --disable-examples --disable-plugin
+		--disable-gconf-peer --disable-examples --disable-plugin \
+		--disable-Werror
 
-CLASSPATH_DEPENDENCIES = uclibc host-pkgconfig libpng jpeg tiff
+CLASSPATH_DEPENDENCIES = uclibc host-pkgconfig libpng jpeg
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 	CLASSPATH_DEPENDENCIES+= alsa-lib
-- 
1.5.6.3
