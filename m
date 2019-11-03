From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Nov 2019 19:48:07 +0100
Subject: [Buildroot] [git commit] Revert "package/grantlee: fix build with
 Qt 5.x"
Message-ID: <20191103184922.7BA028E5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1185b0a56e21d10d2541d0c4da752f8cec53c4c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c975106f60d909b244f473e381b1ebffd943364a which does
not seem to really work. The issue will be fixed by a patch retrieved
from upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
