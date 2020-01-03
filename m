From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 20:01:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: bump to version 0.4.0
Message-ID: <20200103190153.2153522-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl is supported since
https://github.com/containers/bubblewrap/commit/300da62ab6d14aaeeed20172a03090932bb23119

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bubblewrap/Config.in       | 5 -----
 package/bubblewrap/bubblewrap.hash | 2 +-
 package/bubblewrap/bubblewrap.mk   | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
index b83f046c82..2492cee0e5 100644
--- a/package/bubblewrap/Config.in
+++ b/package/bubblewrap/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_BUBBLEWRAP
 	bool "bubblewrap"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # TEMP_FAILURE_RETRY
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Unprivileged sandbox tool based on Linux namespaces.
 
 	  https://github.com/projectatomic/bubblewrap
-
-comment "bubblewrap needs a glibc or uclibc toolchain"
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-	depends on BR2_USE_MMU
diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index c8177d00f5..6914a1ccd7 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 c6a45f51794a908b76833b132471397a7413f07620af08e76c273d9f7b364dff bubblewrap-0.3.3.tar.xz
+sha256 e5fe7d2f74bd7029b5306b0b70587cec31f74357739295e5276b4a3718712023 bubblewrap-0.4.0.tar.xz
 
 # Hash for license files:
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 83bbb1b234..3da00a700d 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.3.3
+BUBBLEWRAP_VERSION = 0.4.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.24.0
