From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:08 +0200
Subject: [Buildroot] [PATCH 34/50] package/busybox: invert dependency with
 i2c-tools
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <0e31768f27f613c377a9984e1b4ef37283da3325.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk     | 1 +
 package/i2c-tools/i2c-tools.mk | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index afd215d78e..3c8c251015 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
 	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 9ddaa72786..db26647eb5 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -19,10 +19,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 I2C_TOOLS_DEPENDENCIES += python3
 endif
 
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-I2C_TOOLS_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 I2C_TOOLS_MAKE_OPTS += BUILD_DYNAMIC_LIB=0 USE_STATIC_LIB=1
 endif
-- 
2.14.1
