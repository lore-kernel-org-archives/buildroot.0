From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:55:15 +0200
Subject: [Buildroot] [git commit] syslinux: remove host variant
Message-ID: <20140420095635.88E229C043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac7f60d87266c30753cb45b820dc48ec834941c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of syslinux wasn't exposed anywhere, so the only way
to use it was to know that a "host-syslinux" target existed. Moreover,
thanks to commit 8e0d4118982ae5a29e462f0a476d82772459cf5c ('syslinux:
install helper programs to the host'), the host utilities of syslinux
are automatically installed to $(HOST_DIR) when building the target
syslinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 7b3f9cf..0faa81f 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -37,14 +37,4 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
-
-define HOST_SYSLINUX_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_SYSLINUX_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))
