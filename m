From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:09 +0100
Subject: [Buildroot] [PATCH 18/30] qt5base: add glib support
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7988ce2..414410a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -21,7 +21,6 @@ QT5BASE_INSTALL_STAGING = YES
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
 	-no-kms \
-	-no-glib \
 	-no-cups \
 	-no-nis \
 	-no-libudev \
@@ -95,6 +94,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
-- 
1.7.9.5
