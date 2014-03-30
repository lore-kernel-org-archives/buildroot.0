From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:48 +0400
Subject: [Buildroot] [PATCH v3 04/10] Revert "ffmpeg: fix build for xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-5-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 4ec35e76b8a31810a0b8955a6dee787cefa013bc.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/ffmpeg/ffmpeg.mk | 8 --------
 1 file changed, 8 deletions(-)

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
-- 
1.8.1.4
