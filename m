From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:18:34 +0200
Subject: [Buildroot] [git commit] package/gcc: drop negative conditions on
 C-SKY for older versions
Message-ID: <20190801081630.42287811EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9d70202c1e09a7a02645638762f60434fd73051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the C-SKY architecture requires gcc-9, we can drop the special
conditions on the individual older versions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <guoren@kernel.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index adc12e95ea..a3ba7cf90d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -32,7 +32,6 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc
-	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on microblaze, ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
@@ -47,7 +46,6 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc
-	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
@@ -61,7 +59,6 @@ config BR2_GCC_VERSION_6_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	# Broken or unsupported architectures
 	depends on !BR2_arc
-	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
@@ -69,7 +66,6 @@ config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	# Broken or unsupported architectures
-	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
@@ -77,7 +73,6 @@ config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
-	depends on !BR2_csky
 	depends on !BR2_or1k
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
