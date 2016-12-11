From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 16:52:16 +0100
Subject: [Buildroot] [PATCH 1/4] jpeg-turbo: now checks for pkg-config
Message-ID: <20161211155219.22814-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The jpeg-turbo configure script now contains PKG_PROG_PKG_CONFIG, even
though it doesn't so far use pkg-config to detect any dependencies (it does
install a .pc file now though):

checking pkg-config is at least version 0.9.0... ./configure: line 13540: \
  /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory

Depend on host-pkgconf for consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 91d6b4e..c3de04a 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -11,6 +11,7 @@ JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
+JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = --with-jpeg8
 
-- 
2.10.2
