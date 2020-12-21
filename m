From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:25:36 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: enable libv4l2 when
 selected
Message-ID: <20201221091743.9334C8814B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a9810a54edeb64dec219c2190583eca07c4299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6b7437411c..fd4a8ab1c4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -84,6 +84,13 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+FFMPEG_DEPENDENCIES += libv4l
+FFMPEG_CONF_OPTS += --enable-libv4l2
+else
+FFMPEG_CONF_OPTS += --disable-libv4l2
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
 FFMPEG_CONF_OPTS += --enable-avresample
 else
