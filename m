From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 21:57:44 +0200
Subject: [Buildroot] [git commit] package/pkg-waf: use host-python3
Message-ID: <20200503194257.1850D90E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d070040ba9cddbae5321090266aadf1e2ae98f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the last of an unconsolidated series of patches that
removes the need for host-python(2) for all waf-based packages.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a32d5dab33..35e56d3c13 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -36,8 +36,8 @@
 
 define inner-waf-package
 
-# We need host-python to run waf
-$(2)_DEPENDENCIES += host-python
+# We need host-python3 to run waf
+$(2)_DEPENDENCIES += host-python3
 
 $(2)_NEEDS_EXTERNAL_WAF ?= NO
 
@@ -63,7 +63,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
-	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
+	$$(HOST_DIR)/bin/python3 $$($(2)_WAF) configure \
 		--prefix=/usr \
 		--libdir=/usr/lib \
 		$$($(2)_CONF_OPTS) \
@@ -78,7 +78,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -91,7 +91,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -105,7 +105,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
