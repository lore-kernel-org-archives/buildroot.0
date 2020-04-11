From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sat, 11 Apr 2020 15:58:32 +0200
Subject: [Buildroot] [PATCH] package/openal: bump to version 1.20.1
Message-ID: <20200411135832.20507-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/Config.in   | 8 +++++---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/openal/Config.in b/package/openal/Config.in
index a564156555..d129906d2c 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 
 config BR2_PACKAGE_OPENAL
 	bool "openal"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
@@ -26,7 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++"
+comment "openal needs a target gcc >= 5 w/ C++14, NPTL"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index a133808cae..917be2843c 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7  openal-1.19.1.tar.gz
+sha256 c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13  openal-1.20.1.tar.gz
 sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 8e761a8d9b..ed63abfb3f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.19.1
+OPENAL_VERSION = 1.20.1
 OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
-- 
2.17.1
