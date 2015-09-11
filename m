From: Ben Shelton <benjamin.h.shelton@intel.com>
Date: Fri, 11 Sep 2015 17:08:13 -0500
Subject: [Buildroot] [PATCH 3/3] lttng-tools: enable aarch64 build
In-Reply-To: <1442009293-4289-1-git-send-email-benjamin.h.shelton@intel.com>
References: <1442009293-4289-1-git-send-email-benjamin.h.shelton@intel.com>
Message-ID: <1442009293-4289-3-git-send-email-benjamin.h.shelton@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that liburcu builds for aarch64, lttng-tools has all its dependencies met
for aarch64, so allow it to build for this architecture.

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
---
 package/lttng-tools/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 4d4b923..4c5b5f6 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# liburcu only works on some architectures and requires thread support
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_USE_WCHAR # util-linux
@@ -30,7 +30,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  http://lttng.org
 
 comment "lttng-tools needs a toolchain w/ threads, wchar"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
-- 
1.9.5
