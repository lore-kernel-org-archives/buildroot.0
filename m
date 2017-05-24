From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 24 May 2017 10:01:00 -0400
Subject: [Buildroot] [PATCH 1/2] libconfuse: bump version to 3.1
Message-ID: <1495634461-17815-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes are at:

https://github.com/martinh/libconfuse/releases/tag/v3.1

Also, this release now ships with lexer.c so flex is no longer required
for building libconfuse.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libconfuse/libconfuse.hash | 6 +++---
 package/libconfuse/libconfuse.mk   | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index ec485a1..e57e59c 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,3 +1,3 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.0/confuse-3.0.tar.xz.md5, sha256 locally computed.
-md5  c534b51a2118ed57031dc548032304a3  confuse-3.0.tar.xz
-sha256  bb75174e02aa8b44fa1a872a47beeea1f5fe715ab669694c97803eb6127cc861  confuse-3.0.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.1/confuse-3.1.tar.xz.md5, sha256 locally computed.
+md5  08f1ace0055f92d80a8ad11671346a37  confuse-3.1.tar.xz
+sha256  8171f31e0071d5e4460269fdcc8b4e748cf23b4bf6bbe672f718a136dd63ca66  confuse-3.1.tar.xz
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 2908af3..5f1d5cd 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.0
+LIBCONFUSE_VERSION = 3.1
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
-LIBCONFUSE_DEPENDENCIES = host-flex
-HOST_LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
-- 
2.7.4
