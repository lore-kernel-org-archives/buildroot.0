From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Jun 2017 16:11:46 +0200
Subject: [Buildroot] [PATCH] qt5multimedia: conditionally add pulseaudio to
	dependencies
Message-ID: <1498486306-29649-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5Multimedia includes support for pulseaudio if it detects libpulse
and libpulse-mainloop-glib in the system at build-time. We need to
depend on pulseaudio if it is selected.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 133536e..8ebddeb 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+QT5MULTIMEDIA_DEPENDENCIES += pulseaudio
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
-- 
2.9.3
