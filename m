From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:50 +0200
Subject: [Buildroot] [PATCH 25/50 v2] package/busybox: invert dependency
 with mtd
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <5b90cf0f63aa7e30d424816e884eca4f6d5016b7.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/mtd/mtd.mk         | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 451aae46a5..efb463554c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
 	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 83bd6a6ae9..13e501fc33 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -31,10 +31,6 @@ else
 MTD_CONF_OPTS += --disable-tests --disable-install-tests
 endif
 
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-MTD_DEPENDENCIES += busybox
-endif
-
 # If extended attributes are required, the acl package must
 # also be enabled which will also include the attr package.
 ifeq ($(BR2_PACKAGE_ACL),y)
-- 
2.14.1
