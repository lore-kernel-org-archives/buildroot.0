From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 00:08:24 +0100
Subject: [Buildroot] [git commit] binutils: bump 2.23 series to 2.23.1 and
	deprecate 2.20
Message-ID: <20121115231003.30C7599C8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcc6bcd516ceeacf556c37364570796cd0d1eba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host                    |   10 +++++-----
 .../120-sh-conf.patch                              |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../500-sysroot.patch                              |    0
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 26c5f73..81a4cf7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -13,7 +13,7 @@ choice
 	       bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && BR2_DEPRECATED
 		bool "binutils 2.20"
 
 	config BR2_BINUTILS_VERSION_2_20_1
@@ -31,10 +31,10 @@ choice
 	config BR2_BINUTILS_VERSION_2_22
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.22"
-	
-	config BR2_BINUTILS_VERSION_2_23
+
+	config BR2_BINUTILS_VERSION_2_23_1
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
-		bool "binutils 2.23"
+		bool "binutils 2.23.1"
 
 endchoice
 
@@ -46,7 +46,7 @@ config BR2_BINUTILS_VERSION
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
-	default "2.23"		if BR2_BINUTILS_VERSION_2_23
+	default "2.23.1"	if BR2_BINUTILS_VERSION_2_23_1
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/package/binutils/binutils-2.23/120-sh-conf.patch b/package/binutils/binutils-2.23.1/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.23/120-sh-conf.patch
rename to package/binutils/binutils-2.23.1/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.23/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.23.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.23/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.23.1/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.23/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.23.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.23/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.23.1/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.23/500-sysroot.patch b/package/binutils/binutils-2.23.1/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.23/500-sysroot.patch
rename to package/binutils/binutils-2.23.1/500-sysroot.patch
