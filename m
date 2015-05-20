From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 May 2015 19:00:30 +0300
Subject: [Buildroot] [PATCH] qt5base: remove never set QT5BASE_CONFIGURE_ENV
Message-ID: <68f1652755a14911b5e98255662454f63ddf315f.1432137630.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 1b54fbc925f4 (qt5base: fix postgresql plugin compile, 2015-02-19)
QT5BASE_CONFIGURE_ENV is never set. Remove it.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/qt5/qt5base/qt5base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3de824f5424b..e2db5d1e029c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -174,7 +174,6 @@ define QT5BASE_CONFIGURE_CMDS
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
-		$(QT5BASE_CONFIGURE_ENV) \
 		./configure \
 		-v \
 		-prefix /usr \
-- 
2.1.4
