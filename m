From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 21:03:22 +0200
Subject: [Buildroot] [PATCH 3/4] package/mjpg-streamer: add optional
 dependency to sdl
In-Reply-To: <20180930190323.3369-1-bernd.kuhls@t-online.de>
References: <20180930190323.3369-1-bernd.kuhls@t-online.de>
Message-ID: <20180930190323.3369-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 50ed980b7a..a4f96e1c56 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -22,4 +22,11 @@ else
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SDL),y)
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_VIEWER=ON
+MJPG_STREAMER_DEPENDENCIES += host-pkgconf sdl
+else
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_VIEWER=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.19.0
