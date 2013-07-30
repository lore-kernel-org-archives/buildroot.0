From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 30 Jul 2013 18:33:01 +0200
Subject: [Buildroot] [PATCH] libfuse: remove unused configure options
Message-ID: <91b84989b6e9da50e6e7.1375201981@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current versions of libfuse do not recognize configure options
--disable-nls and --disable-kernel-module. Remove them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libfuse/libfuse.mk |  3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -11,9 +11,8 @@ LIBFUSE_LICENSE = GPLv2 LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBFUSE_CONF_OPT = --disable-nls \
+LIBFUSE_CONF_OPT = \
 		--disable-example \
-		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
 
