From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Nov 2019 11:15:06 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/grantlee: fix build with Qt
 5.x"
Message-ID: <20191103101507.30364-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit c975106f60d909b244f473e381b1ebffd943364a which does
not seem to really work. The issue will be fixed by a patch retrieved
from upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grantlee/grantlee.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index c129fe40b2..575b63fef5 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -11,9 +11,4 @@ GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 GRANTLEE_DEPENDENCIES = qt5base qt5script
 
-# qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-GRANTLEE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-endif
-
 $(eval $(cmake-package))
-- 
2.23.0
