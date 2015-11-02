From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 16:15:08 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: Add support for x265
Message-ID: <20151102151516.6116E80161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6a69587a9a1bb61e4b61280e3f1cad4a7fee110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d4815ca..d25346c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -341,6 +341,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libx264
 endif
 
+ifeq ($(BR2_PACKAGE_X265)$(BR2_PACKAGE_FFMPEG_GPL),yy)
+FFMPEG_CONF_OPTS += --enable-libx265
+FFMPEG_DEPENDENCIES += x265
+else
+FFMPEG_CONF_OPTS += --disable-libx265
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
