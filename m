From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 12:43:58 +0200
Subject: [Buildroot] [PATCH v2,1/2] brltty: add license
Message-ID: <20180915104359.24938-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

brltty 5.5 is licensed under GPL-2.0+ with exceptions in LGPL-2.1+ as
specified in README so add this information in BRLTTY_LICENSE, update
BRLTTY_LICENSE_FILES and add hash for README

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.hash | 1 +
 package/brltty/brltty.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 3bc2f9cf54..01b4c13fcc 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,3 +1,4 @@
 sha256 4ebf1df5922df0efccac4795f5bd1c514fc850348c34d9ec0868e2798b565a36 brltty-5.5.tar.xz
 sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad LICENSE-GPL
 sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
+sha256 6ba58188449642de8adefd7adabb436185792c5c51a4b5d04650423c2151dc50 README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index df3e9c7888..729062d579 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -9,7 +9,8 @@ BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
-BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
+BRLTTY_LICENSE = GPL-2.0+ with exceptions in LGPL-2.1+
+BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL README
 
 BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
-- 
2.17.1
