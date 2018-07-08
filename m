From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:04 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 less
Message-ID: <20180708110810.B598A863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed231e7b8b4e418c531bcd485f39e749646b029b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/less/less.mk       | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index cb629892cd..95fea18b50 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LESS),less) \
 	$(if $(BR2_PACKAGE_LSOF),lsof) \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
diff --git a/package/less/less.mk b/package/less/less.mk
index bccc08b89f..ef3643c0aa 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -8,8 +8,7 @@ LESS_VERSION = 487
 LESS_SITE = $(BR2_GNU_MIRROR)/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-# Build after busybox, full-blown is better
-LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+LESS_DEPENDENCIES = ncurses
 
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
