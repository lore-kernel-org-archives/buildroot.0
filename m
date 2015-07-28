From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:44:29 +0200
Subject: [Buildroot] [git commit branch/next] binutils: rename config option
Message-ID: <20150808105648.F1E287FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f84cc202aa04a1a4754a367f3b440c1f8cb38db9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rename the binutils configuration option to match that one used by gcc
where the patchlevel is explicitly left out.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                |   27 +++++++++++++++++++++++++++
 package/binutils/Config.in.host |   14 +++++++-------
 package/gcc/Config.in.host      |    2 +-
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4afeb83..08caa8b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,33 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_BINUTILS_VERSION_2_23_2
+	bool "binutils 2.23 option renamed"
+	select BR2_LEGACY
+	select BR2_BINUTILS_VERSION_2_23_X
+	help
+	  The binutils version option has been renamed to match the
+	  same patchlevel logic used by gcc. The new option is now
+	  BR2_BINUTILS_VERSION_2_23_X.
+
+config BR2_BINUTILS_VERSION_2_24
+	bool "binutils 2.24 option renamed"
+	select BR2_LEGACY
+	select BR2_BINUTILS_VERSION_2_24_X
+	help
+	  The binutils version option has been renamed to match the
+	  same patchlevel logic used by gcc. The new option is now
+	  BR2_BINUTILS_VERSION_2_24_X.
+
+config BR2_BINUTILS_VERSION_2_25
+	bool "binutils 2.25 option renamed"
+	select BR2_LEGACY
+	select BR2_BINUTILS_VERSION_2_25_X
+	help
+	  The binutils version option has been renamed to match the
+	  same patchlevel logic used by gcc. The new option is now
+	  BR2_BINUTILS_VERSION_2_25_X.
+
 config BR2_PACKAGE_PERF
 	bool "perf option has been renamed"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 70253cc..6e7acab 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,21 +3,21 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_24
+	default BR2_BINUTILS_VERSION_2_24_X
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_23_2
+	config BR2_BINUTILS_VERSION_2_23_X
 		depends on !BR2_aarch64 && !BR2_microblaze && \
 			   !BR2_powerpc64le && !BR2_nios2
 		bool "binutils 2.23.2"
 
-	config BR2_BINUTILS_VERSION_2_24
+	config BR2_BINUTILS_VERSION_2_24_X
 		# supported, but broken on Nios-II and powerpc64le
 		depends on !BR2_nios2 && !BR2_powerpc64le
 		bool "binutils 2.24"
 
-	config BR2_BINUTILS_VERSION_2_25
+	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25"
 
 endchoice
@@ -25,9 +25,9 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2015.06"	if BR2_arc
-	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
-	default "2.24"		if BR2_BINUTILS_VERSION_2_24
-	default "2.25"		if BR2_BINUTILS_VERSION_2_25
+	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
+	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
+	default "2.25"		if BR2_BINUTILS_VERSION_2_25_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3d64b6f..93c9032 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -61,7 +61,7 @@ choice
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
-		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25)
+		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
