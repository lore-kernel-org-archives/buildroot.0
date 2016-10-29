From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Oct 2016 14:08:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 3.2
Message-ID: <20161029120802.25370-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for libfaac was removed upstream:
https://github.com/xbmc/FFmpeg/commit/dc0f711459e0c682bf9f94ba38d26736e90cff45

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 7b1e140..541f421 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 49cc3105f7891c5637f8fabb1b75ebb19c9b5123b311a3ccc6182aa35d58b89a  ffmpeg-3.1.5.tar.xz
+sha256 88f70c1b8cab108f494ecbab5ba302cdb35d59a84cea88008b5fe49be068d5da  ffmpeg-3.2.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 52d2f38..de6d841 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.1.5
+FFMPEG_VERSION = 3.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -50,7 +50,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencore-amrwb \
 	--disable-libcdio \
 	--disable-libdc1394 \
-	--disable-libfaac \
 	--disable-libgsm \
 	--disable-libilbc \
 	--disable-libnut \
-- 
2.10.1
