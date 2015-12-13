From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 Dec 2015 19:47:49 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/lttng-libust: use
	BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS dependency
In-Reply-To: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
References: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1450032471-3405-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this newly introduced symbol lets to simplify the dependency code.

This change also adds the missing architecture dependencies on the second
comment.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 package/lttng-libust/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 3c26055..26838bb 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_USE_WCHAR # util-linux
 	# liburcu only works on some architectures and requires threads support"
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -18,9 +18,10 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	  http://lttng.org
 
 comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
 comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
-- 
2.6.4
