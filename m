From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:32:38 +0100
Subject: [Buildroot] [git commit] package/zxing-cpp: replace
 ZXING_CPP_MAKE_OPTS workaround
Message-ID: <20200110212335.1868188CAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59f83728b7f96e8739cbbfd52caa6c41c7b70b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping to version e0e40dd in commit
ad9c5bbfa7ee355b9f6120358cde08ae866537ac included the following upstream
commit:
https://github.com/glassechidna/zxing-cpp/commit/4e2b4fe1668c60d73e7649b0d3d5888912878392

This commit contains CMake improvements and especially a new
BUILD_TESTING option that disable the testrunner compile, use this
instead of the ZXING_CPP_MAKE_OPTS workaround.

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zxing-cpp/zxing-cpp.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 1efd986c7d..6b26c20e00 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -10,12 +10,10 @@ ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = COPYING
 ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+ZXING_CPP_CONF_OPTS = -DBUILD_TESTING=OFF
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_CPP_DEPENDENCIES += libiconv
 endif
 
-# build all targets except testrunner (needs c++11 support)
-ZXING_CPP_MAKE_OPTS = libzxing zxing
-
 $(eval $(cmake-package))
