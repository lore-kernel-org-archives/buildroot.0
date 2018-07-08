From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 sysvinit
Message-ID: <20180708110810.2429E863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad879202a1a535672d7ad81d3f61aa53a4dca4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk   | 1 +
 package/sysvinit/sysvinit.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ff2e4c770c..e504924540 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
 	$(if $(BR2_PACKAGE_TAR),tar) \
 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index a606ddabf0..993e399e73 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -13,11 +13,6 @@ SYSVINIT_LICENSE_FILES = COPYING
 
 SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
 
-# Override BusyBox implementations if BusyBox is enabled.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSVINIT_DEPENDENCIES += libselinux
 SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
