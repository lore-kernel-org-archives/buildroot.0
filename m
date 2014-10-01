From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:46:32 +0200
Subject: [Buildroot] [git commit] ffmpeg: enable libvpx support
Message-ID: <20141001175701.C03CE9D7EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a966c83faae23f7a63f191750d4ac556cd6444f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ae3d4c3..5818db1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -215,6 +215,13 @@ else
 FFMPEG_CONF_OPT += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+FFMPEG_CONF_OPT += --enable-libvpx
+FFMPEG_DEPENDENCIES += libvpx
+else
+FFMPEG_CONF_OPT += --disable-libvpx
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPT += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
