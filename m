From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] package/ffmpeg: add optional dependency to
 dav1d
Message-ID: <20190903133617.4F7AE8A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5146f878d528156517299df5be707bd5715f58fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b1eb29dfd7..2b459aec18 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -403,6 +403,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libx265
 endif
 
+ifeq ($(BR2_PACKAGE_DAV1D),y)
+FFMPEG_CONF_OPTS += --enable-libdav1d
+FFMPEG_DEPENDENCIES += dav1d
+else
+FFMPEG_CONF_OPTS += --disable-libdav1d
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-x86asm
 FFMPEG_DEPENDENCIES += host-nasm
