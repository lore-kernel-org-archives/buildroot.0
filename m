From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 11 Sep 2011 17:38:08 +0200
Subject: [Buildroot] [PATCH 2/4] package/binutils: fixup version strings 2/2
In-Reply-To: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1315755490-9920-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The binutils tarballs have been re-released after a GPL compliance
issue was found:
  http://sourceware.org/ml/binutils/2011-08/msg00198.html

So all versions were re-packaged.

In the process, two things happenned:
 - some versions (eg. 2.19) went missing, due to them being super-seeded
   by a dot release (eg. 2.19.1)
 - an 'a' was appended to the version strings

So, this patch fixes the second issue by renaming version strings (including
the patch dirs). It is to be noted that, although the versions got bumped to
include an 'a' at the end, the directory contained in the tarball is still
named after the version string without the 'a'. For example:
 - old version      : 2.19.1
 - new version      : 2.19.1a
 - tarball name     : binutils-2.19.1a.tar.bz2
 - directory name   : binutils-2.19.1/

In fact, it does not pose any problem for buildroot, as the extract process
explicitly mkdirs the directory to extract into, *and* strips the first level
of the tree extracted from the tarball.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/binutils/Config.in.host                    |   24 ++++++++++----------
 .../100-makeinfo-version.patch                     |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../120-sh-conf.patch                              |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../120-sh-conf.patch                              |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../400-arm_link_speed.patch                       |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../120-sh-conf.patch                              |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 18 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f035bfd..ccd16f0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,37 +8,37 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_18
+	config BR2_BINUTILS_VERSION_2_18a
 		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
-		bool "binutils 2.18"
+		bool "binutils 2.18a"
 
 	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	       depends on BR2_avr32
 	       bool "binutils 2.18-avr32-1.0.1"
 
-	config BR2_BINUTILS_VERSION_2_19_1
+	config BR2_BINUTILS_VERSION_2_19_1a
 		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
-		bool "binutils 2.19.1"
+		bool "binutils 2.19.1a"
 
-	config BR2_BINUTILS_VERSION_2_20_1
+	config BR2_BINUTILS_VERSION_2_20_1a
 		depends on !BR2_avr32
-		bool "binutils 2.20.1"
+		bool "binutils 2.20.1a"
 
-	config BR2_BINUTILS_VERSION_2_21_1
+	config BR2_BINUTILS_VERSION_2_21_1a
 		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
-		bool "binutils 2.21.1"
+		bool "binutils 2.21.1a"
 
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.18"		if BR2_BINUTILS_VERSION_2_18
+	default "2.18a"		if BR2_BINUTILS_VERSION_2_18a
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
-	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
-	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
+	default "2.19.1a"	if BR2_BINUTILS_VERSION_2_19_1a
+	default "2.20.1a"	if BR2_BINUTILS_VERSION_2_20_1a
+	default "2.21.1a"	if BR2_BINUTILS_VERSION_2_21_1a
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/package/binutils/binutils-2.18/100-makeinfo-version.patch b/package/binutils/binutils-2.18a/100-makeinfo-version.patch
similarity index 100%
rename from package/binutils/binutils-2.18/100-makeinfo-version.patch
rename to package/binutils/binutils-2.18a/100-makeinfo-version.patch
diff --git a/package/binutils/binutils-2.18/110-arm-eabi-conf.patch b/package/binutils/binutils-2.18a/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.18/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.18a/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.18a/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.18a/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.18a/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.18a/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19.1a/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.19.1a/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.19.1/120-sh-conf.patch b/package/binutils/binutils-2.19.1a/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.19.1/120-sh-conf.patch
rename to package/binutils/binutils-2.19.1a/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19.1a/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.19.1a/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19.1a/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.19.1a/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.20.1a/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.20.1a/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.20.1/120-sh-conf.patch b/package/binutils/binutils-2.20.1a/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/120-sh-conf.patch
rename to package/binutils/binutils-2.20.1a/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.20.1a/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.20.1a/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.20.1a/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.20.1a/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.20.1/400-arm_link_speed.patch b/package/binutils/binutils-2.20.1a/400-arm_link_speed.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/400-arm_link_speed.patch
rename to package/binutils/binutils-2.20.1a/400-arm_link_speed.patch
diff --git a/package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.21.1a/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.21.1a/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.21.1/120-sh-conf.patch b/package/binutils/binutils-2.21.1a/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/120-sh-conf.patch
rename to package/binutils/binutils-2.21.1a/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.21.1a/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.21.1a/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.21.1a/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.21.1a/300-012_check_ldrunpath_length.patch
-- 
1.7.2.5
