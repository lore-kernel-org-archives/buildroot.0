From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 22:07:09 +0100
Subject: [Buildroot] [git commit] qt5base: add OpenSSL support
Message-ID: <20130319211615.AF4769B1B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52b7e7cbadae4a5d7cbcab1b6e19cfad77a114ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 33555ae..736965d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -28,7 +28,6 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-nis \
 	-no-libudev \
 	-no-iconv \
-	-no-openssl \
 	-no-fontconfig \
 	-no-gif \
 	-no-libpng \
@@ -82,6 +81,9 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
