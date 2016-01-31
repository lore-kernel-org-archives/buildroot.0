From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 14:58:56 +0100
Subject: [Buildroot] [PATCH 4/6] package/libsigrokdecode: bump version to
	0.4.0
In-Reply-To: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454248738-12371-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to upstream tarball, remove autoreconf, add hash, fix typo.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsigrokdecode/Config.in            |  2 +-
 package/libsigrokdecode/libsigrokdecode.hash |  2 ++
 package/libsigrokdecode/libsigrokdecode.mk   | 13 ++-----------
 3 files changed, 5 insertions(+), 12 deletions(-)
 create mode 100644 package/libsigrokdecode/libsigrokdecode.hash

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index a8f4e85..70f86ce 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 
 	  http://sigrok.org/wiki/Libsigrokdecode
 
-comment "libsigrokecode needs a toolchain w/ wchar, threads, dynamic library"
+comment "libsigrokdecode needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
new file mode 100644
index 0000000..3ac8a76
--- /dev/null
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	fd7e9d1b73245e844ead97a16d5321c766196f946c9b28a8646cab2e98ec3537	libsigrokdecode-0.4.0.tar.gz
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index c0a4017..b8b3c59 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-LIBSIGROKDECODE_VERSION = 9177963de41c2d003d417049470eea3c98eeb2ef
-# No https access on upstream git
-LIBSIGROKDECODE_SITE = git://sigrok.org/libsigrokdecode
+LIBSIGROKDECODE_VERSION = 0.4.0
+LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
 LIBSIGROKDECODE_LICENSE = GPLv3+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
-# Git checkout has no configure script
-LIBSIGROKDECODE_AUTORECONF = YES
 LIBSIGROKDECODE_INSTALL_STAGING = YES
 LIBSIGROKDECODE_DEPENDENCIES = host-pkgconf libglib2 python3
 
-define LIBSIGROKDECODE_ADD_MISSING
-	mkdir -p $(@D)/autostuff
-endef
-
-LIBSIGROKDECODE_PRE_CONFIGURE_HOOKS += LIBSIGROKDECODE_ADD_MISSING
-
 $(eval $(autotools-package))
-- 
2.7.0
