From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 16:40:48 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/postgis: fix comment
 dependencies (binutils-bug-21464, binutils-bug-27597)
In-Reply-To: <20210502144048.1212-1-ps.report@gmx.net>
References: <20210502144048.1212-1-ps.report@gmx.net>
Message-ID: <20210502144048.1212-2-ps.report@gmx.net>
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
 package/postgis/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 49887b61c0..04705f7e16 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -24,5 +24,5 @@ comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binut
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
-		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.31.1
