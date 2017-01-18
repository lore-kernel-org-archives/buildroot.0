From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 18 Jan 2017 17:19:28 +0100
Subject: [Buildroot] [PATCH] qt5base: use libinput if selected
Message-ID: <e9be1e34-cd1d-9a14-a99f-9c9829522b5f@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 23dba2a..9049456 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -27,6 +27,11 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT5BASE_CONFIGURE_OPTS += -libinput
+QT5BASE_DEPENDENCIES += libinput
+endif
+
 # Uses libgbm from mesa3d
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_CONFIGURE_OPTS += -kms -gbm
-- 
1.9.1
