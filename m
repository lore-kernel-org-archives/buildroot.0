From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Oct 2012 22:22:44 +0200
Subject: [Buildroot] [git commit] unionfs: convert to cmake-package
Message-ID: <20121013202737.17FBC99849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee1dd812881cc7928e11addaa18e8185d2b02000
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes e.g. http://autobuild.buildroot.net/results/c279007dd8b89a1c6fc9b58d3c2cda01ab84279e

The addition of CPPFLAGS overrides the defines added in unionfs's
Makefile.  Since unionfs now has CMake support, use that instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/unionfs/unionfs.mk |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index eb8109e..6c86c57 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -11,12 +11,4 @@ UNIONFS_DEPENDENCIES = libfuse host-pkg-config
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
 
-define UNIONFS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define UNIONFS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
