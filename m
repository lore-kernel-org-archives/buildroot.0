From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 21:03:23 +0200
Subject: [Buildroot] [PATCH 4/4] package/mjpg-streamer: add optional
 dependency to libgphoto2
In-Reply-To: <20180930190323.3369-1-bernd.kuhls@t-online.de>
References: <20180930190323.3369-1-bernd.kuhls@t-online.de>
Message-ID: <20180930190323.3369-4-bernd.kuhls@t-online.de>
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
index a4f96e1c56..111a66ef7e 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -11,6 +11,13 @@ MJPG_STREAMER_LICENSE = GPL-2.0+
 MJPG_STREAMER_LICENSE_FILES = $(MJPG_STREAMER_SUBDIR)/LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
+ifeq ($(BR2_PACKAGE_LIBGPHOTO2),y)
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_PTP2=ON
+MJPG_STREAMER_DEPENDENCIES += host-pkgconf libgphoto2
+else
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_PTP2=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
-- 
2.19.0
