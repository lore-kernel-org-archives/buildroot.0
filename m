From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 19:11:01 +0200
Subject: [Buildroot] [PATCH/next] package/apitrace: bump version
Message-ID: <20170521171101.14097-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently we have version 7.0, released July 2015. Latest upstream
release 7.1, which dates back to November 2015, causes build errors.

Therefore we bump to git HEAD, updated May 2017, which builds fine.

The package requires gcc-4.9 or later now:
https://github.com/apitrace/apitrace/commit/2940c642832ba9dd0322a351034a2c52331e6e2b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apitrace/Config.in     | 6 +++---
 package/apitrace/apitrace.hash | 2 +-
 package/apitrace/apitrace.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 7fdd35af3..b622823c2 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,13 +1,13 @@
-comment "apitrace needs a glibc toolchain w/ C++, gcc >= 4.6"
+comment "apitrace needs a glibc toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC # uses glibc specific __libc_dlsym
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LIBPNG
diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
index eac470b03..1daaa46e8 100644
--- a/package/apitrace/apitrace.hash
+++ b/package/apitrace/apitrace.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 21d0cc765b84e537c5a3a117073818942653b85685b9633d364836ccfe0b9fd5  apitrace-7.0.tar.gz
+sha256 0aae8902696ad23ba91d61c57007861a3f6e3c2d4f0f43b783b4b7a58e3f9172  apitrace-15d7f975f9688372467ebd63d2a57d3957823f93.tar.gz
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index fbd957c61..c66f6b3e3 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APITRACE_VERSION = 7.0
+APITRACE_VERSION = 15d7f975f9688372467ebd63d2a57d3957823f93
 APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
-- 
2.11.0
