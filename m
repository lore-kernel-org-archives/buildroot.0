From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 22:45:29 +0200
Subject: [Buildroot] [git commit] glibc: remove unnecessary !BR2_sparc
	dependencies
Message-ID: <20160902142938.BF9347FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b7bf72aa49b617494eb3250e97a69b61f21dff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_BUILDROOT_GLIBC option is already not selectable on
BR2_sparc, so there is no need to have an additional "depends on
!BR2_sparc" on each of the glibc versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
