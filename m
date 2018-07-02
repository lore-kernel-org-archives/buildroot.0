From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:12 +0200
Subject: [Buildroot] [PATCH 38/50] package/busybox: invert dependency with
 fbset
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <116729e26b4c11ebfd7919c31503a06051ee8712.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/fbset/fbset.mk     | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e793c57619..d76e5f9230 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_FBSET),fbset) \
 	$(if $(BR2_PACKAGE_GAWK),gawk) \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index d6ee104a22..787b4e1dca 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -9,11 +9,6 @@ FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
 
-# Make sure full fbset wins over busybox fbset
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-FBSET_DEPENDENCIES += busybox
-endif
-
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
-- 
2.14.1
