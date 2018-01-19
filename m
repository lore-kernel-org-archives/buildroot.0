From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Jan 2018 22:46:07 +0100
Subject: [Buildroot] [git commit] package/xen: Force disable SDL for
 xen-qemu build
Message-ID: <20180119214850.2B23E81419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5dd72181e1a79ffe65c788a2c1db9acdf6aa933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuilder issue:
http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 6aa066e..8ba2b9d 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -43,6 +43,7 @@ XEN_DEPENDENCIES += argp-standalone
 endif
 XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 XEN_MAKE_OPTS += dist-tools
+XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl"
 
 define XEN_INSTALL_INIT_SYSV
 	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
