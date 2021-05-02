From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 16:40:47 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libgeos: fix comment
 dependencies (binutils-bug-12464, binutils-bug-27597)
Message-ID: <20210502144048.1212-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment dependencies need to be the inverse of the package
dependencies (fixes comment shown in menuconfig even if the package
is available).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libgeos/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index ebe40bd1ff..86a1cddcf3 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBGEOS
 
 comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
-		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
+		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.31.1
