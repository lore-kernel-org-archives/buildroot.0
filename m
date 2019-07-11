From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:04:27 +0200
Subject: [Buildroot] [git commit] package/at-spi2-core: fix build with NLS
Message-ID: <20190711140341.9745D8186F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40f8afda4671e26eaba0de8ed3395d295957dc16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/at-spi2-core/at-spi2-core.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 40b29bdb3f..3a5197eb03 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -11,7 +11,10 @@ AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI
 AT_SPI2_CORE_LICENSE = LGPL-2.0+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
+	$(TARGET_NLS_DEPENDENCIES)
 AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
 
+AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 $(eval $(meson-package))
