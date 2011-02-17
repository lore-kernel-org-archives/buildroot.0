From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Feb 2011 14:16:13 +0100
Subject: [Buildroot] [git commit master 1/1] package/multimedia: remove vlc
Message-ID: <20110217131729.D32E98F5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=022d2062631bc29b40b8a8ad2cf28e1241e731ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has been marked as broken for close to 1 year (aa3439e6a3f), without
any effort to fix it, so remove it from the tree.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in     |    1 -
 package/multimedia/vlc/Config.in |    9 ---------
 package/multimedia/vlc/vlc.mk    |   14 --------------
 3 files changed, 0 insertions(+), 24 deletions(-)
 delete mode 100644 package/multimedia/vlc/Config.in
 delete mode 100644 package/multimedia/vlc/vlc.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 12d6e30..b8a0f21 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -43,7 +43,6 @@ source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
-source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
deleted file mode 100644
index 412a3c7..0000000
--- a/package/multimedia/vlc/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_VLC
-	bool "vlc"
-	# Improper ./configure options passed compared to the
-        # multimedia libraries available in Buildroot.
-	depends on BROKEN
-	help
-	  a free cross-platform media player
-
-	  http://download.videolan.org/pub/videolan/vlc/0.8.6e
diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
deleted file mode 100644
index ade4297..0000000
--- a/package/multimedia/vlc/vlc.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-#############################################################
-#
-# vlc
-#
-#############################################################
-VLC_VERSION = 0.8.6e
-VLC_SOURCE = vlc-$(VLC_VERSION).tar.bz2
-VLC_SITE = http://download.videolan.org/pub/videolan/vlc/0.8.6e
-VLC_AUTORECONF = NO
-VLC_INSTALL_STAGING = NO
-VLC_INSTALL_TARGET = YES
-
-$(eval $(call AUTOTARGETS,package/multimedia,vlc))
-
-- 
1.7.3.4
