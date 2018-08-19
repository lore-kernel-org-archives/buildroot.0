From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 09:18:21 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/git-crypt: bump version to
 0.6.0
Message-ID: <20180819071821.17780-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting from release notes:
https://www.agwa.name/git/git-crypt.git/raw/master/NEWS

"v0.6.0 (2017-11-26)
  * Add support for OpenSSL 1.1 (still works with OpenSSL 1.0).
  * Switch to C++11 (gcc 4.9 or higher now required to build).
 [...]"

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git-crypt/Config.in      | 6 ++++--
 package/git-crypt/git-crypt.hash | 7 +++++--
 package/git-crypt/git-crypt.mk   | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
index 362fe9a600..bb86219cf8 100644
--- a/package/git-crypt/Config.in
+++ b/package/git-crypt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT_CRYPT
 	bool "git-crypt"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_OPENSSL
@@ -10,6 +11,7 @@ config BR2_PACKAGE_GIT_CRYPT
 
 	  https://www.agwa.name/projects/git-crypt/
 
-comment "git-crypt needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "git-crypt needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
index 8589f03f71..973432d7d0 100644
--- a/package/git-crypt/git-crypt.hash
+++ b/package/git-crypt/git-crypt.hash
@@ -1,2 +1,5 @@
-# Hash from: https://lists.cloudmutt.com/pipermail/git-crypt-announce/2015-May/000003.html
-sha256 0a8f92c0a0a125bf768d0c054d947ca4e4b8d6556454b0e7e87fb907ee17cf06 git-crypt-0.5.0.tar.gz
+# Locally calculated after checking pgp signature
+sha256 6d30fcd99442d50f4b3c8d554067ff1d980cdf9f3120ee774131172dba98fd6f  git-crypt-0.6.0.tar.gz
+# Locally calculated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 506657e7a381165550e6c33e35b3b03bbef3e1feb68ba5529e264bd75ed2dc64  parse_options.hpp
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 6cae456fd3..507534c139 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_CRYPT_VERSION = 0.5.0
+GIT_CRYPT_VERSION = 0.6.0
 GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
 GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
 GIT_CRYPT_LICENSE = GPL-3.0+, MIT
-- 
2.18.0
