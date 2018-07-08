From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:51 +0200
Subject: [Buildroot] [PATCH 26/50 v2] package/busybox: invert dependency
 with lsof
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <7380e57bce210d101049ef68c9c15a7581f895cc.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/lsof/lsof.mk       | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index efb463554c..cb629892cd 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LSOF),lsof) \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 0dc8e2de2f..83a9b6c388 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -13,9 +13,6 @@ LSOF_LICENSE = lsof license
 # It is also defined in 00README, but that contains a lot of other cruft.
 LSOF_LICENSE_FILES = dialects/linux/dproto.h
 
-# Make certain full-blown lsof gets built after the busybox version (1.20+)
-LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
-- 
2.14.1
