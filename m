From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 15:36:50 +0200
Subject: [Buildroot] [PATCH] libmatroska: add host-pkgconf dependency
Message-ID: <1431783410-1351-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmatroska configure.ac uses PKG_CHECK_MODULES(), so this package
needs to depend on host-pkgconf.

Fixes:

  http://autobuild.buildroot.org/results/80a/80a9f0f5594ab833600ea8514dc184e50d2bf08c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmatroska/libmatroska.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 1086e87..5e2d9b1 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -10,6 +10,6 @@ LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
-LIBMATROSKA_DEPENDENCIES = libebml
+LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.1.0
