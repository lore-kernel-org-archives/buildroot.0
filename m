From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:33:11 +0200
Subject: [Buildroot] [git commit] ffmpeg: bump version to 3.3
Message-ID: <20170413193315.7287081EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21d93a1351ca8d4e5185c22a81becdaf08a9bdd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove non-existent configure options from ffmpeg.mk:

  --disable-x11grab
  --disable-memalign-hack

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 33942b9..e243acc 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6e38ff14f080c98b58cf5967573501b8cb586e3a173b591f3807d8f0660daf7a  ffmpeg-3.2.4.tar.xz
+sha256 599e7f7c017221c22011c4037b88bdcd1c47cd40c1e466838bc3c465f3e9569d  ffmpeg-3.3.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 223ed84..059f832 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2.4
+FFMPEG_VERSION = 3.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -26,7 +26,6 @@ FFMPEG_CONF_OPTS = \
 	--enable-avdevice \
 	--enable-avcodec \
 	--enable-avformat \
-	--disable-x11grab \
 	--enable-network \
 	--disable-gray \
 	--enable-swscale-alpha \
@@ -39,7 +38,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
-	--disable-memalign-hack \
 	--disable-mipsdsp \
 	--disable-mipsdspr2 \
 	--disable-msa \
