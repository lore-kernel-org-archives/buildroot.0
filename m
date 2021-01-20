From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 20 Jan 2021 15:49:01 +0100
Subject: [Buildroot] [PATCH] package/vuejs: bump version to 3.0.5
Message-ID: <20210120144901.604128-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vuejs developers have changed the way this package is distributed.
The tarball containing the dist files does not contain anymore the
LICENSE file. The license remains MIT but until it is reintroduced in
the tarball, we have to skip the license file hash verification.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/vuejs/vuejs.hash | 3 +--
 package/vuejs/vuejs.mk   | 9 ++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index d2b30b8d34..db4a5bbe3e 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,2 @@
 # Locally computed
-sha256 7ee4d5e4ec7d44fb9918ecb074ad7701eb0bcb3a840cee3c2924734ef3fd888a v2.6.11.tar.gz
-sha256 17fb24bc303763f3fe1911ee24e5225c7ad59f0e3a5d8123e9b730c100a306a6 LICENSE
+sha256  a69f04bf138af09a956150675151edb9354aeec8bd627c21cbcfa646248214fa  vue-3.0.5.tgz
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index f7e197c4af..43b45e00b7 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 2.6.11
-VUEJS_SOURCE = v$(VUEJS_VERSION).tar.gz
-VUEJS_SITE = https://github.com/vuejs/vue/archive
+VUEJS_VERSION = 3.0.5
+VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
+VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-VUEJS_LICENSE_FILES = LICENSE
 
 # Install .min.js as .js
 define VUEJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue.min.js \
+	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
 		$(TARGET_DIR)/var/www/vue.js
 endef
 
-- 
2.25.1
