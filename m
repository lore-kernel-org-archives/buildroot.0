From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:44:34 +0200
Subject: [Buildroot] [PATCH 8/8] package/gcc: slight cleanup and reorg in
	remaining arch depends
In-Reply-To: <cover.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <41eeac74f986790fe26f03ebf05322120d2c04da.1504431850.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d8479008d8..4ceb5b18c7 100644
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
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
@@ -37,10 +36,10 @@ config BR2_GCC_VERSION_5_X
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
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
-- 
2.11.0
