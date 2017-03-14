From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 00:20:28 +0100
Subject: [Buildroot] [PATCH] pax-utils: bump version to 1.2.2
Message-ID: <20170314232028.16119-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now the code checks for PR_SET_NO_NEW_PRIVS before using it, so the kernel
headers dependency can be removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pax-utils/Config.in      | 4 ----
 package/pax-utils/pax-utils.hash | 2 +-
 package/pax-utils/pax-utils.mk   | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index e61d9b31f..58100e482 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5 # needs PR_SET_NO_NEW_PRIVS
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
-
-comment "pax-utils needs a toolchain w/ headers >= 3.5"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index 399bae40d..c75589602 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414	pax-utils-1.1.4.tar.xz
+sha256	7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9	pax-utils-1.2.2.tar.xz
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 8d5f3eea7..35ea8e8d8 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 1.1.4
+PAX_UTILS_VERSION = 1.2.2
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPLv2
-- 
2.11.0
