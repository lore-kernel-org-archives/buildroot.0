From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  7 Mar 2014 13:45:21 +0100
Subject: [Buildroot] [PATCH] vlc: update opencv disabling flag
Message-ID: <1394196321-11562-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch completes the commit d7f13e500e5970577e7abd96a0e9254a1e8f643f
turning --{with,without}- options in --{enable,disable}- options.

Fixes:
  http://autobuild.buildroot.net/results/a34/a34abdcc92a6b2cf976760d66adf6c7572743bb4/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e6d0ded..a9ee620 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -42,7 +42,7 @@ VLC_CONF_OPT += \
 	--disable-projectm \
 	--disable-vsxu \
 	--disable-mtp \
-	--without-opencv
+	--disable-opencv
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-- 
1.9.0
