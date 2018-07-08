From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 i2c-tools
Message-ID: <20180708110811.010BC863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dd72efae2822d936ba8c076c6f9e2e453c98565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk     | 1 +
 package/i2c-tools/i2c-tools.mk | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2d61927c21..8e32a58c2d 100644
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
