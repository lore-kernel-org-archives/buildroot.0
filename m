From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:04:28 +0200
Subject: [Buildroot] [git commit] qt5multimedia: conditionally add alsa-lib
	to dependencies
Message-ID: <20170701173607.9693B800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d7dd837e5e2fcc7b785472e7215ffa74b546d9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt5Multimedia builds the alsa plugin if it detects libasound in the
system. Add alsa-lib to dependencies if BR2_PACKAGE_ALSA_LIB is
selected.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 19312ff..062d980 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -30,6 +30,10 @@ ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
 QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
