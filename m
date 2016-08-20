From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 16:12:01 +0200
Subject: [Buildroot] [PATCH/next] glibc: remove unnecessary !BR2_sparc
	dependencies
Message-ID: <1471702321-31840-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_TOOLCHAIN_BUILDROOT_GLIBC option is already not selectable on
BR2_sparc, so there is no need to have an additional "depends on
!BR2_sparc" on each of the glibc versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index de95cb2..85aace6 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -12,20 +12,14 @@ choice
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
-	# No support for pthread barriers on < v9 ISA
-	depends on !BR2_sparc
 	# Too old to build with gcc >= 6.x
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_GLIBC_VERSION_2_23
 	bool "2.23"
-	# No support for pthread barriers on < v9 ISA
-	depends on !BR2_sparc
 
 config BR2_GLIBC_VERSION_2_24
 	bool "2.24"
-	# No support for pthread barriers on < v9 ISA
-	depends on !BR2_sparc
 	# Linux 3.2 or later kernel headers are required on all arches.
 	# See: https://sourceware.org/ml/libc-alpha/2016-08/msg00212.html
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.7.4
