From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 22:28:17 +0200
Subject: [Buildroot] [git commit] package/brltty: add host-gawk dependency
Message-ID: <20200509201308.CEDA89122B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d31da95d90c4924832b9b88fbfb813c409d4da1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-gawk is used by brltty to build brlapi_constants.h, the build will
fail if mawk is used instead of gawk

Fixes:
 - http://autobuild.buildroot.org/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/brltty/brltty.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index e34b9b2b76..4f40e65fc6 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -12,7 +12,11 @@ BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 BRLTTY_LICENSE = LGPL-2.1+
 BRLTTY_LICENSE_FILES = LICENSE-LGPL README
 
-BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
+BRLTTY_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-autoconf \
+	host-gawk \
+	host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
 BRLTTY_CONF_ENV = \
