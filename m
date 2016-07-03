From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jul 2016 10:33:11 +0200
Subject: [Buildroot] [PATCH 3/3] package/sunxi-mali: remove useless package
In-Reply-To: <cover.1467534694.git.yann.morin.1998@free.fr>
References: <cover.1467534694.git.yann.morin.1998@free.fr>
Message-ID: <c7293830796ec228f541077aa09df81dda34d8af.1467534694.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sunxi-mali-prop only served a feeding prey for sunxi-mali to get the
proprietary libs.

Now that sunxi-mali downloads them (as the git submodule they are), we
no longer need sunxi-mali-prop.

Remove it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |  1 -
 package/sunxi-mali-prop/Config.in            |  4 ----
 package/sunxi-mali-prop/sunxi-mali-prop.hash |  2 --
 package/sunxi-mali-prop/sunxi-mali-prop.mk   | 10 ----------
 4 files changed, 17 deletions(-)
 delete mode 100644 package/sunxi-mali-prop/Config.in
 delete mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.hash
 delete mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.mk

diff --git a/package/Config.in b/package/Config.in
index c57c932..dbeed1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -466,7 +466,6 @@ endif
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
-	source "package/sunxi-mali-prop/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-prop/Config.in b/package/sunxi-mali-prop/Config.in
deleted file mode 100644
index b9efb4e..0000000
--- a/package/sunxi-mali-prop/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-# Sunxi-mali-prop is a git submodule of sunxi-mali. To use this package
-# select the sunxi-mali option.
-config BR2_PACKAGE_SUNXI_MALI_PROP
-	bool
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.hash b/package/sunxi-mali-prop/sunxi-mali-prop.hash
deleted file mode 100644
index baf16fa..0000000
--- a/package/sunxi-mali-prop/sunxi-mali-prop.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  f87d93629072dd0306ffe1200425188129e5f7f97750126dff38464ea707f673  sunxi-mali-prop-1c5063f43cdc9de341c0d63b2e3921cab86c7742.tar.gz
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
deleted file mode 100644
index b828dc2..0000000
--- a/package/sunxi-mali-prop/sunxi-mali-prop.mk
+++ /dev/null
@@ -1,10 +0,0 @@
-################################################################################
-#
-# sunxi-mali-prop
-#
-################################################################################
-
-SUNXI_MALI_PROP_VERSION = 1c5063f43cdc9de341c0d63b2e3921cab86c7742
-SUNXI_MALI_PROP_SITE = $(call github,linux-sunxi,sunxi-mali-proprietary,$(SUNXI_MALI_PROP_VERSION))
-
-$(eval $(generic-package))
-- 
2.7.4
