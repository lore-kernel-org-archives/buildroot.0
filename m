From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 May 2015 12:28:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpthsem: remove argp-standalone
	dependency
Message-ID: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

argp-standalone provide libargp.a and argp.h which are
never used in libpthsem.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libpthsem/Config.in    | 1 -
 package/libpthsem/libpthsem.mk | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index 932acec..3219de1 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBPTHSEM
 	bool "libpthsem"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_ARGP_STANDALONE
 	help
 	  GNU pth is a user mode multi threading library. pthsem is an extend
 	  version, with support for semaphores added.
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index 7c1de86..f9f6f71 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -11,7 +11,6 @@ LIBPTHSEM_LICENSE = LGPLv2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
 LIBPTHSEM_INSTALL_STAGING = YES
-LIBPTHSEM_DEPENDENCIES = argp-standalone
 LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
 
 ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
-- 
1.9.3
