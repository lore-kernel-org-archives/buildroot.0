From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:28:15 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: add optional
 dependency to libgphoto2
Message-ID: <20181008192711.E2E588E4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89ef4c4e48ef3c4fb22fc139e7816a516eaa3212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index a4f96e1c56..6ea8c47030 100644
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
