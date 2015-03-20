From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:11:05 +0100
Subject: [Buildroot] [git commit] gcc: remove blackfin conditionals
Message-ID: <20150320211258.434D97FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fcf071227a65e0e9834189a46a71705f6e37db7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we don't support the internal blackfin toolchain any more
remove unnecessary conditionals.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1a5281c..6d514af 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,7 +10,6 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
-	default BR2_GCC_VERSION_4_5_X if BR2_bfin
 	default BR2_GCC_VERSION_4_8_X
 	help
 	  Select the version of gcc you wish to use.
@@ -40,7 +39,7 @@ choice
 		bool "gcc 4.7.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
@@ -56,7 +55,7 @@ choice
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_arc \
-			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12
 		# Broken or unsupported PPC cores
@@ -73,7 +72,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_bfin
+		depends on !BR2_arc
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
@@ -133,7 +132,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	bool "Enable libmudflap support"
 	# There are architectures, or specific configurations for
 	# which mudflap is not supported.
-	depends on !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
+	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
 	depends on !BR2_GCC_VERSION_4_9_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
