From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 May 2009 13:45:28 +0200
Subject: [Buildroot] [git commit] docker: fix pkg-config path
Message-ID: <20090516122840.AB5F977857@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=316c03ed0601de835c513eb5e73696583b392322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/docker/docker.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index d86e88b..860cd7e 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -14,7 +14,7 @@ DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 					CFLAGS="-I$(STAGING_DIR)/usr/include \
 						-I$(STAGING_DIR)/usr/include/glib-2.0 \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-					PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+					PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
-- 
1.6.0.6
