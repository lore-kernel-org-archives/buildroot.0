From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 08:07:43 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/xen: Force
 disable SDL for xen-qemu build
Message-ID: <20180131075150.9E67C88171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=046987a601c90637d493776f8e942ce4ffe41e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes autobuilder issue:
http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a5dd72181e1a79ffe65c788a2c1db9acdf6aa933)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 2a87d8f90c..66b81dfb30 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -54,6 +54,7 @@ XEN_DEPENDENCIES += argp-standalone
 endif
 XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 XEN_MAKE_OPTS += dist-tools
+XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl"
 
 define XEN_INSTALL_INIT_SYSV
 	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
