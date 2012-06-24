From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:10:28 +0200
Subject: [Buildroot] [git commit] qt: change use of BR2_JLEVEL to
	PARALLEL_JOBS
Message-ID: <20120624095658.48A3288E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de780f6471672468fd67d79177e707c6d4d160ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6b1be83..e18b873 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -487,7 +487,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		MAKEFLAGS="$(MAKEFLAGS) -j$(BR2_JLEVEL)" ./configure \
+		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
