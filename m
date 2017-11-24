From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:20:14 +0100
Subject: [Buildroot] [git commit] package/gcc: slight cleanup and reorg in
 remaining arch depends
Message-ID: <20171201205336.A08CF7FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e6de23e45b2b39a39b00ff80ac6e884be89b62c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 780ee73..74c1b2f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -24,12 +24,11 @@ config BR2_GCC_VERSION_4_9_X
 	bool "gcc 4.9.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
-	depends on !BR2_arc && !BR2_or1k
-	# musl microblaze unsupported
+	depends on !BR2_arc
+	depends on !BR2_or1k
+	# musl on microblaze, ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
-	# musl ppc64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 	# glibc >= 2.26 needs gcc >= 6.2
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
@@ -39,10 +38,10 @@ config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
-	depends on !BR2_arc && !BR2_or1k
-	# musl ppc64 unsupported
+	depends on !BR2_arc
+	depends on !BR2_or1k
+	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-	# musl mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 	# glibc >= 2.26 needs gcc >= 6.2
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
