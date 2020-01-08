From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 23:10:11 +0100
Subject: [Buildroot] [git commit] package/jsmn: bump to version 1.1.0
Message-ID: <20200108220048.B99F8870D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56adf8984113afe74e41d7d135f69c3183b185af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- jsmn is a single-header, header-only library since version 1.1.0 and
  https://github.com/zserge/jsmn/commit/fdcef3ebf886fa210d14956d3c068a653e76a24e
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jsmn/jsmn.hash |  3 ++-
 package/jsmn/jsmn.mk   | 11 +++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/jsmn/jsmn.hash b/package/jsmn/jsmn.hash
index 91f64201e7..b5a78f6ebf 100644
--- a/package/jsmn/jsmn.hash
+++ b/package/jsmn/jsmn.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  e08993848b2abab62aa9572a560bb6e5ed4762f8537cd67c4de6cb17e17090a0    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
+sha256  5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38    jsmn-1.1.0.tar.gz
+sha256  4675b94a50d2afe811c52785463c854f1156056632cce17cc7133939eac8ed55    LICENSE
diff --git a/package/jsmn/jsmn.mk b/package/jsmn/jsmn.mk
index c98f2798ee..750e8cf82c 100644
--- a/package/jsmn/jsmn.mk
+++ b/package/jsmn/jsmn.mk
@@ -4,20 +4,15 @@
 #
 ################################################################################
 
-JSMN_VERSION = 6021415cc75e7922d45b12935f56348b064d8a7f
-JSMN_SITE = $(call github,zserge,jsmn,$(JSMN_VERSION))
+JSMN_VERSION = 1.1.0
+JSMN_SITE = $(call github,zserge,jsmn,v$(JSMN_VERSION))
 JSMN_LICENSE = MIT
 JSMN_LICENSE_FILES = LICENSE
-# static library only
+# single-header, header-only library
 JSMN_INSTALL_STAGING = YES
 JSMN_INSTALL_TARGET = NO
 
-define JSMN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
 define JSMN_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
 	$(INSTALL) -D -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h
 endef
 
