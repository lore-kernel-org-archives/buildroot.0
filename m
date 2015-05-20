From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:28:29 +0200
Subject: [Buildroot] [git commit] qt5base: remove never set
	QT5BASE_CONFIGURE_ENV
Message-ID: <20150520212845.80E2581DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d38b6b2e1aecb80594236405a7662466749fdc43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 1b54fbc925f4 (qt5base: fix postgresql plugin compile, 2015-02-19)
QT5BASE_CONFIGURE_ENV is never set. Remove it.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3de824f..e2db5d1 100644
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
