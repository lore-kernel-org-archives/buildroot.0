From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:28:07 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: add optional
 dependency to sdl
Message-ID: <20181008192711.DC0548E4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87817c6a6820d1d1b9f915beb3a639b3a6a15867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
