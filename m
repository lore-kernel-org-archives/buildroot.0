From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Jun 2015 15:39:19 -0300
Subject: [Buildroot] [PATCH] ulogd: bump to version 2.0.5
Message-ID: <1435171159-5880-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove kernel headers check since it now implements local definitions to
keep working with newer versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/Config.in  | 3 ---
 package/ulogd/ulogd.hash | 6 +++---
 package/ulogd/ulogd.mk   | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index bcd7d0d..dc36c0b 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_ULOGD
 	bool "ulogd"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-	# ulog support removed for kernels >= 3.17
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNETFILTER_ACCT
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -17,4 +15,3 @@ config BR2_PACKAGE_ULOGD
 comment "ulogd needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
index 0e050e4..16186c1 100644
--- a/package/ulogd/ulogd.hash
+++ b/package/ulogd/ulogd.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.4.tar.bz2.{md5sum,sha1sum}
-md5	7c71ec460dfea5287eba27472c521ebc	ulogd-2.0.4.tar.bz2
-sha1	f5e09d9e9a6c7ab8966d22ed8d6e90196aab3fb3	ulogd-2.0.4.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.5.tar.bz2.{md5sum,sha1sum}
+md5	f0f8fe1371fa28b5e06cb16aaa0111dd	ulogd-2.0.5.tar.bz2
+sha1	828db7849d6788674ecf36b178f107c20e9ac1f0	ulogd-2.0.5.tar.bz2
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 8f763fa..7ff5b73 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.4
+ULOGD_VERSION = 2.0.5
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
-- 
2.3.6
