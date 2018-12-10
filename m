From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:50:40 +0100
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: remove pkgconf fix
Message-ID: <20181210104702.30AAD8B871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=598cd3dc55dfd805de0fa7416062ee3c4a063402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed anymore after pkgconf bump.

Fixes
http://autobuild.buildroot.net/results/175/1752915119b795c916d75594e51a7c79126afd5f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index b85dad7f2c..bf09cb6b07 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -15,15 +15,5 @@ XCB_PROTO_INSTALL_STAGING = YES
 XCB_PROTO_DEPENDENCIES = host-python
 HOST_XCB_PROTO_DEPENDENCIES = host-python
 
-# xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
-# xml / python files, so ensure these expand to their full (host) paths
-define XCB_PROTO_FIXUP_PC_FILE
-	$(SED) 's|^\(xcbincludedir=\)|\1$(STAGING_DIR)|' \
-		-e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/xcb-proto.pc
-endef
-
-XCB_PROTO_POST_INSTALL_STAGING_HOOKS += XCB_PROTO_FIXUP_PC_FILE
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
