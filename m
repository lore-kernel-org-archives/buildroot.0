From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Mar 2016 17:04:20 +0100
Subject: [Buildroot] [PATCH 2/3] package/libcap-ng: enable for CodeSourcery
	nios2 2015.11 toolchain
In-Reply-To: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
References: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457193861-23828-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The compiler bug has been fixed in CS nios2 2015.11.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
All package has been build tested with this toolchain.
---
 package/connman/Config.in    | 1 -
 package/libcap-ng/Config.in  | 1 -
 package/ofono/Config.in      | 2 --
 package/util-linux/Config.in | 1 -
 4 files changed, 5 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 26406c8..270938e 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -54,7 +54,6 @@ config BR2_PACKAGE_CONNMAN_NEARD
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ofono
 	select BR2_PACKAGE_OFONO
 
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index 4939e26..d1663cd 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # triggers compiler bug
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 2e3ca22..70daef7 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCAP_NG
@@ -21,4 +20,3 @@ comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 530ad95..8a36c0a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -222,7 +222,6 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
-- 
2.5.0
