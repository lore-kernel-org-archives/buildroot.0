From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 Nov 2019 11:59:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/grantlee: fix build with Qt 5.x
Message-ID: <20191101105906.21219-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f0ec288fe47b6e8cf16179e3f281cf9caebb8fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grantlee/grantlee.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 575b63fef5..c129fe40b2 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -11,4 +11,9 @@ GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 GRANTLEE_DEPENDENCIES = qt5base qt5script
 
+# qt5 needs c++11 (since qt-5.7)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+GRANTLEE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
+
 $(eval $(cmake-package))
-- 
2.23.0
