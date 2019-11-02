From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:16:02 +0100
Subject: [Buildroot] [git commit] package/grantlee: fix build with Qt 5.x
Message-ID: <20191102210929.32B018E576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c975106f60d909b244f473e381b1ebffd943364a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/f0ec288fe47b6e8cf16179e3f281cf9caebb8fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
