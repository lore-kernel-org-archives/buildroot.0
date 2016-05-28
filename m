From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 May 2016 11:27:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mplayer: bump version to 1.3.0
Message-ID: <1464427644-18229-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream commit to fix compilation when zlib is missing.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/0004-configure-zlib.patch | 30 ++++++++++++++++++++++++++++++
 package/mplayer/mplayer.hash              |  8 ++++----
 package/mplayer/mplayer.mk                |  2 +-
 3 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 package/mplayer/0004-configure-zlib.patch

diff --git a/package/mplayer/0004-configure-zlib.patch b/package/mplayer/0004-configure-zlib.patch
new file mode 100644
index 0000000..7c1b2c8
--- /dev/null
+++ b/package/mplayer/0004-configure-zlib.patch
@@ -0,0 +1,30 @@
+configure: Fix compilation when zlib is missing.
+
+Downloaded from upstream commit:
+
+$ LC_ALL=C svn log -r 37816
+------------------------------------------------------------------------
+r37816 | reimar | 2016-02-28 14:39:42 +0100 (Sun, 28 Feb 2016) | 3 lines
+
+configure: Fix compilation when zlib is missing.
+
+APNG and a few other decoders also cannot be enabled without it.
+------------------------------------------------------------------------
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: configure
+===================================================================
+--- a/configure	(revision 37795)
++++ b/configure	(revision 37816)
+@@ -6464,8 +6464,8 @@
+   mplayer_encoders="$mplayer_encoders PNG_ENCODER"
+ else
+   def_zlib='#define CONFIG_ZLIB 0'
+-  libavdecoders=$(filter_out_component decoder 'FLASHSV FLASHSV2 PNG ZMBV ZLIB DXA EXR G2M TSCC ZEROCODEC')
+-  libavencoders=$(filter_out_component encoder 'FLASHSV FLASHSV2 PNG ZMBV ZLIB')
++  libavdecoders=$(filter_out_component decoder 'APNG FLASHSV FLASHSV2 PNG ZMBV ZLIB DXA EXR G2M RSCC SCREENPRESSO TDSC TSCC ZEROCODEC')
++  libavencoders=$(filter_out_component encoder 'APNG FLASHSV FLASHSV2 PNG ZMBV ZLIB')
+ fi
+ echores "$_zlib"
+ 
diff --git a/package/mplayer/mplayer.hash b/package/mplayer/mplayer.hash
index 49c5631..e6b8842 100644
--- a/package/mplayer/mplayer.hash
+++ b/package/mplayer/mplayer.hash
@@ -1,4 +1,4 @@
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz.md5
-md5 58409fccb8ef33013fb780405405491f  MPlayer-1.2.tar.xz
-# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz.sha1
-sha1 64fad840dfae466ab5ef3be2b6c74058892cd981  MPlayer-1.2.tar.xz
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz.md5
+md5 e8a4d77ad4f509e81dd5e13b51636c1d  MPlayer-1.3.0.tar.xz
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz.sha1
+sha1 11db20434a4e1aabb9c52f7712241dae1b3730e3  MPlayer-1.3.0.tar.xz
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 33eba38..347ed5e 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPLAYER_VERSION = 1.2
+MPLAYER_VERSION = 1.3.0
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 MPLAYER_DEPENDENCIES = host-pkgconf
-- 
2.8.1
