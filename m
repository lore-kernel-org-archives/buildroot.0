From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:46:41 +0200
Subject: [Buildroot] [git commit] ffmpeg: enable libopus support
Message-ID: <20141001175701.C8B429D5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad58c88c10bac0d3ab0e33be69ab737a2c11ed02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5818db1..b4b2e56 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -215,6 +215,13 @@ else
 FFMPEG_CONF_OPT += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+FFMPEG_CONF_OPT += --enable-libopus
+FFMPEG_DEPENDENCIES += opus
+else
+FFMPEG_CONF_OPT += --disable-libopus
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVPX),y)
 FFMPEG_CONF_OPT += --enable-libvpx
 FFMPEG_DEPENDENCIES += libvpx
