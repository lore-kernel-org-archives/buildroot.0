From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 22:49:28 +0200
Subject: [Buildroot] [PATCH] libevdev: use tarball instead of git repository
Message-ID: <1406839768-7896-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tarballs are now provided for libevdev, so use that instead of the Git
repository, as it allows to avoid autoreconf for the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index a9a1d41..fde7d3c 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -5,16 +5,14 @@
 ################################################################################
 
 LIBEVDEV_VERSION = 1.2.2
-LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
+LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
+LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
 LIBEVDEV_LICENSE_FILES = COPYING
 
 # Uses PKG_CHECK_MODULES() in configure.ac
 LIBEVDEV_DEPENDENCIES = host-pkgconf
 
-# package source code coming from git, so it doesn't have generated
-# configure and Makefile.in
-LIBEVDEV_AUTORECONF = YES
 LIBEVDEV_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.0.0
