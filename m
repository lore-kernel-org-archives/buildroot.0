From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 09:31:18 +0200
Subject: [Buildroot] [PATCH/next v3 7/7] package/ffmpeg: bump version to
 4.0.2
In-Reply-To: <20180825073118.14980-1-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
Message-ID: <20180825073118.14980-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffserver was removed upstream:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=6b35a83214f1bc3fb38c9ea9c2cd3676f28709fa

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial version

 Config.in.legacy           | 6 ++++++
 package/ffmpeg/Config.in   | 6 ------
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 8 +-------
 4 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aae8d28e13..3aa82aa5fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_FFMPEG_FFSERVER
+	bool "ffserver was removed"
+	select BR2_LEGACY
+	help
+	  ffserver was removed upstream
+
 config BR2_KERNEL_HEADERS_4_10
 	bool "kernel headers version 4.10.x are no longer supported"
 	select BR2_KERNEL_HEADERS_4_9
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 2d94c5712a..eec7ce0f6b 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -63,12 +63,6 @@ config BR2_PACKAGE_FFMPEG_FFPLAY
 comment "ffplay needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_FFMPEG_FFSERVER
-	bool "Build ffserver"
-	depends on BR2_USE_MMU # fork()
-	help
-	  FFserver is a streaming server for both audio and video.
-
 config BR2_PACKAGE_FFMPEG_FFPROBE
 	bool "Build ffprobe"
 	help
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 7d64d8441c..ff6b8ffcb5 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 386f7601e865df6bddde05bb6927119b5a853f0b92e2e9834f59c125a17d3fc6  ffmpeg-3.4.4.tar.xz
+sha256 a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97  ffmpeg-4.0.2.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index cf9abeb102..4071e1ccef 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.4.4
+FFMPEG_VERSION = 4.0.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -84,12 +84,6 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_FFSERVER),y)
-FFMPEG_CONF_OPTS += --enable-ffserver
-else
-FFMPEG_CONF_OPTS += --disable-ffserver
-endif
-
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
 FFMPEG_CONF_OPTS += --enable-avresample
 else
-- 
2.18.0
