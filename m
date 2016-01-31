From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 14:58:54 +0100
Subject: [Buildroot] [PATCH 2/6] package/libsigrok: bump version to 0.4.0
In-Reply-To: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454248738-12371-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to upstream tarball, remove autoreconf, add hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsigrok/libsigrok.hash |  2 ++
 package/libsigrok/libsigrok.mk   | 13 ++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)
 create mode 100644 package/libsigrok/libsigrok.hash

diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
new file mode 100644
index 0000000..999cef5
--- /dev/null
+++ b/package/libsigrok/libsigrok.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	5f291f3fee36e6dab1336f1c78596e50588831bc5ebd7cddc2a95fe8c71d669e	libsigrok-0.4.0.tar.gz
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 54d0482..e4e079d 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,23 +4,14 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = fe473123ba836445d477149f2e2c0ae372fc0c4c
-# No https access on upstream git
-LIBSIGROK_SITE = git://sigrok.org/libsigrok
+LIBSIGROK_VERSION = 0.4.0
+LIBSIGROK_SITE = http://sigrok.org/download/source/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
 LIBSIGROK_LICENSE_FILES = COPYING
-# Git checkout has no configure script
-LIBSIGROK_AUTORECONF = YES
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
 LIBSIGROK_CONF_OPTS = --disable-glibtest --disable-java --disable-python
 
-define LIBSIGROK_ADD_MISSING
-	mkdir -p $(@D)/autostuff
-endef
-
-LIBSIGROK_PRE_CONFIGURE_HOOKS += LIBSIGROK_ADD_MISSING
-
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
 LIBSIGROK_CONF_OPTS += --enable-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
-- 
2.7.0
