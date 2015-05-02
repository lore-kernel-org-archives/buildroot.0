From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 14:46:24 +0200
Subject: [Buildroot] [git commit] package/libpthsem: remove argp-standalone
	dependency
Message-ID: <20150502124833.81C977FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bafa150c691c435dfe44aa1c3692afb4b2672e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

argp-standalone provide libargp.a and argp.h which are
never used in libpthsem.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpthsem/Config.in    |    1 -
 package/libpthsem/libpthsem.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

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
