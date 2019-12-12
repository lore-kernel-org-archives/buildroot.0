From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:28:20 +0100
Subject: [Buildroot] [git commit] package/libuio: add missing dependency on
 host-pkgconf
Message-ID: <20191212072102.848DE890D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=548b423493c3a79291fb4bf5c8aa711e4c19d91c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure fails if the pkgconfig.m4 macros are not available during
this package autoreconf:

./configure: line 12003: syntax error near unexpected token `PKGCONF,'
./configure: line 12003: `   PKG_CHECK_MODULES(PKGCONF, glib-2.0)

Fixes:

  http://autobuild.buildroot.net/results/9be944e35090bf270fbc9572423466be9af7b1f2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuio/libuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 13429ec0f1..b6e8e7e774 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -10,7 +10,7 @@ LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
 LIBUIO_CONF_OPTS = --with-glib=no --without-werror
-LIBUIO_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LIBUIO_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 LIBUIO_LIBS = $(TARGET_NLS_LIBS)
 LIBUIO_INSTALL_STAGING = YES
 
