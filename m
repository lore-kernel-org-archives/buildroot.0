From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:36 +0200
Subject: [Buildroot] [PATCH 11/50 v2] package/busybox: invert dependency
 with sysvinit
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <f78eabb010bf2d1df0e0a2cf5ecd3ce1a63d765a.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.14.1
