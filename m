From: Ben Shelton <benjamin.h.shelton@intel.com>
Date: Tue, 15 Sep 2015 09:35:20 -0500
Subject: [Buildroot] [PATCH v2 4/5] lttng-libust: Enable aarch64 build
In-Reply-To: <1442327721-24458-1-git-send-email-benjamin.h.shelton@intel.com>
References: <1442327721-24458-1-git-send-email-benjamin.h.shelton@intel.com>
Message-ID: <1442327721-24458-4-git-send-email-benjamin.h.shelton@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With aarch64 support added to liburcu, lttng-libust has its dependencies met
for aarch64, so allow it to build for this architecture.

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
---
 package/lttng-libust/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 1c26843..3c26055 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_USE_WCHAR # util-linux
 	# liburcu only works on some architectures and requires threads support"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	  http://lttng.org
 
 comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
-- 
1.9.5
