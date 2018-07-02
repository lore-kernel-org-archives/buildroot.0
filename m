From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:01 +0200
Subject: [Buildroot] [PATCH 27/50] package/busybox: invert dependency with
 less
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <d5c7b77444d2b9994c2964510be05ac5ae37a6d1.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/less/less.mk       | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bb2c02e000..4a7afa2516 100644
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
-- 
2.14.1
