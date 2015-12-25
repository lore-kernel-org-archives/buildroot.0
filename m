From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:33 +0100
Subject: [Buildroot] [PATCH 04/84 RFC] package/nodejs: move comment around,
	to keep proper indentation
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <23f7d72d23133868e2b49676aa488e0c0b50fcc8.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Kconfig, when there is an item (like a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nodejs/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index eb3aeec..008fbbf 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,3 +1,10 @@
+comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -17,13 +24,6 @@ config BR2_PACKAGE_NODEJS
 
 	  http://nodejs.org/
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
-	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_NODEJS
 
 # Starting with 0.12.x, on ARM, V8 (the JS engine)
-- 
1.9.1
