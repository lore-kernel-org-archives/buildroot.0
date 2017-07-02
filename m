From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:52:45 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qt5multimedia:
	conditionally add alsa-lib to dependencies
Message-ID: <20170702155041.261B581DC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1450e9084b3c43f82497ae8254c7dca2fecc049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Qt5Multimedia builds the alsa plugin if it detects libasound in the
system. Add alsa-lib to dependencies if BR2_PACKAGE_ALSA_LIB is
selected.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8d7dd837e5e2fcc7b785472e7215ffa74b546d9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index c1a27cb..4ce98d2 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -35,6 +35,10 @@ ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
 QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
