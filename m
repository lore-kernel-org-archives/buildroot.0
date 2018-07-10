From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 22:05:13 +0200
Subject: [Buildroot] [git commit] brltty: add optional at-spi2-core
 dependency
Message-ID: <20180710204430.ACB0888244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d91fc17cdbdd9b531ab177a4ad23321e217f379
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/brltty/brltty.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index eb91ef8ff7..df3e9c7888 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -11,7 +11,8 @@ BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
 
-BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf
+BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
+	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
