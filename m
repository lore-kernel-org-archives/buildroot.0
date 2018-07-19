From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:06:22 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] gdb: drop duplicate
 dependencies
Message-ID: <20180719100626.22EEB88E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f312738cfb1302e720c6281a5de6813bd972c9d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Commit 1e3738db42919cb4487f7a64381ac7d3090d0e1f ("package/gdb: rework
dependency for C++11") erroneously added duplicate dependencies in
package/gdb/Config.in related to gcc 4.8 and C++ dependency.

One copy of those dependencies was below the select causing a
check-package warning.

Fixes:

package/gdb/Config.in:28: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f50578ab98bbc99139838375f6221411d420b298)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 9a71c008a0..55c1b194ce 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -25,8 +25,6 @@ config BR2_PACKAGE_GDB
 	# one from the external toolchain should be used.
 	select BR2_PACKAGE_GDB_SERVER if \
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_PACKAGE_GDB_NEEDS_CXX11
-	depends on BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_GDB_NEEDS_CXX11
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
