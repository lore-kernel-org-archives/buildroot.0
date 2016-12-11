From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:21:52 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: now checks for pkg-config
Message-ID: <20161211172617.3599E817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b965cfc9f4f8474bf35976e458916a85fb972b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The jpeg-turbo configure script now contains PKG_PROG_PKG_CONFIG, even
though it doesn't so far use pkg-config to detect any dependencies (it does
install a .pc file now though):

checking pkg-config is at least version 0.9.0... ./configure: line 13540: \
  /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory

Depend on host-pkgconf for consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
