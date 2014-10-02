From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  2 Oct 2014 12:11:01 +0200
Subject: [Buildroot] [PATCH 1/3] ffmpeg: fix license file
Message-ID: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Somewhere between 1.2.7 and 2.3.1 (version bump in bf76f4319131a107)
the LICENSE file has been renamed to LICENSE.md, so `make legal-info`
is currently broken. Update to the current file name.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b4b2e56..5b7fa20 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -10,7 +10,7 @@ FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
 
 FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
-FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
+FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_LICENSE += and GPLv2+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
-- 
1.9.1
