From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2021 10:23:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglew: bump version to 2.2.0
Message-ID: <20210116092349.816488-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted on https://sourceforge.net/projects/glew/ the package moved to
github.com, update URLs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglew/Config.in    | 2 +-
 package/libglew/libglew.hash | 7 ++-----
 package/libglew/libglew.mk   | 4 ++--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/libglew/Config.in b/package/libglew/Config.in
index 099c9461a4..1d28c018b6 100644
--- a/package/libglew/Config.in
+++ b/package/libglew/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBGLEW
 	  and extension functionality is exposed in a single header
 	  file.
 
-	  http://glew.sourceforge.net
+	  https://github.com/nigels-com/glew
 
 comment "libglew depends on X.org and needs an OpenGL backend"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 2e1b1f3c3c..29e63fa308 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,6 +1,3 @@
-# From https://sourceforge.net/projects/glew/files/glew/2.1.0/
-sha1 18eca05460d0b61709fc115e632b6fe320718b44  glew-2.1.0.tgz
-md5 b2ab12331033ddfaa50dc39345343980  glew-2.1.0.tgz
 # Locally computed:
-sha256 04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95  glew-2.1.0.tgz
-sha256 8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  LICENSE.txt
+sha256  d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1  glew-2.2.0.tgz
+sha256  8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  LICENSE.txt
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index fa26292567..c9c49e6987 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 2.1.0
+LIBGLEW_VERSION = 2.2.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
-LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
+LIBGLEW_SITE = https://github.com/nigels-com/glew/releases/download/glew-$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3-Clause, MIT
 LIBGLEW_LICENSE_FILES = LICENSE.txt
 LIBGLEW_INSTALL_STAGING = YES
-- 
2.29.2
