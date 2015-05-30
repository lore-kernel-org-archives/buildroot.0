From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 May 2015 18:05:44 +0200
Subject: [Buildroot] [git commit] lttng-libust: requires dynamic library
	support
Message-ID: <20150530160552.EA9A880D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=057d88e701dab42d1bc8037fcbc7684e1451ddaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e89/e8974516173ea74c830b71e400fcbafdd69dea60/
http://autobuild.buildroot.net/results/cac/cac7015c3be7e34dbeaa6accb59aebebe68eb6d2/
http://autobuild.buildroot.net/results/4ce/4ce0a35316cd25536b58b50f096b6f75f6e3c1c9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 7c30d78..1c26843 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
@@ -16,9 +17,9 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ wchar, threads"
+comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
 comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
