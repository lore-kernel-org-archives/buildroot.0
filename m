From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Feb 2016 10:29:36 +0100
Subject: [Buildroot] [PATCH/next 4/4] package/mjpg-streamer: added optional
	dependency to libv4l
In-Reply-To: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455442176-31448-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index e54c600..a710af6 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -14,8 +14,13 @@ MJPG_STREAMER_LICENSE = GPLv2+
 MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+MJPG_STREAMER_DEPENDENCIES += libv4l
+MJPG_STREAMER_USE_LIBV4L += USE_LIBV4L2=true
+endif
+
 define MJPG_STREAMER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) $(MJPG_STREAMER_USE_LIBV4L)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS
-- 
2.7.0
