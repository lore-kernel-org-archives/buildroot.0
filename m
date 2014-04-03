From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:35:55 +0200
Subject: [Buildroot] [git commit] Revert "ffmpeg: fix build for xtensa"
Message-ID: <20140403193845.2B5939A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5449aeadf97c6cffa815e61fa816ff12fa0e9fa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4ec35e76b8a31810a0b8955a6dee787cefa013bc.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a067fe6..fae558a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -73,14 +73,6 @@ FFMPEG_CONF_OPT = \
 
 FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-FFMPEG_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_xtensa),y)
-FFMPEG_CFLAGS += -mtext-section-literals
-endif
-
-FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"
-
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
 else
