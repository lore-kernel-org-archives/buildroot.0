From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 31 Jul 2013 17:26:59 +0200
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_arc
Message-ID: <1375284419-2958-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC is not supported yet in libnspr.

v2: Propagate to ecryptfs-utils as well

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/ecryptfs-utils/Config.in |    1 +
 package/libnspr/Config.in        |    1 +
 package/libnss/Config.in         |    1 +
 3 files changed, 3 insertions(+)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index c10659a..480aedd 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
 	depends on BR2_LARGEFILE # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
+	depends on !BR2_arc # libnss -> libnspr
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index f87b10c..ee7902b 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index e8eec77..b5f3a01 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
+	depends on !BR2_arc # libnspr
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
-- 
1.7.9.5
