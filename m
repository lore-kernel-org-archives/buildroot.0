From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:17 +0200
Subject: [Buildroot] [PATCH 43/50] package/busybox: invert dependency with
 dcron
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <1f522821f7330d490730d83e75f61a9c4b01efa6.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/dcron/dcron.mk     | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4f507b4de1..32377ef7b9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_DCRON),dcron) \
 	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
 	$(if $(BR2_PACKAGE_DIFFUTILS),diffutils) \
 	$(if $(BR2_PACKAGE_DOS2UNIX),dos2unix) \
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 7e81b63803..2ee0709af5 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -9,11 +9,6 @@ DCRON_SITE = http://www.jimpryor.net/linux/releases
 # The source code does not specify the version of the GPL that is used.
 DCRON_LICENSE = GPL
 
-# Overwrite cron-related Busybox commands if available
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-DCRON_DEPENDENCIES = busybox
-endif
-
 define DCRON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
-- 
2.14.1
