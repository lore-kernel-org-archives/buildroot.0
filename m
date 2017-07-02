From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:52:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qt5multimedia:
	conditionally add pulseaudio & libglib2 to dependencies
Message-ID: <20170702155041.100F381EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fe48189c2c3fa0128647a31bf80e52b2eb51f64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Qt5Multimedia includes support for pulseaudio if it detects libpulse
and libpulse-mainloop-glib in the system at build-time. We need to
depend on pulseaudio and libglib2 if it is selected.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ac8044fc32bcca612a6105c9f0ca9aef11ebc061)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index fccdd5d..c1a27cb 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -31,6 +31,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
+QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
