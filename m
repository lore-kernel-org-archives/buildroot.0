From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 20:38:56 +0200
Subject: [Buildroot] [git commit] package/postgis: fix comment dependencies
 (binutils-bug-21464, binutils-bug-27597)
Message-ID: <20210514181233.A8CDB815EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d5b397202225f7ca1702f62342df3b97056c531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment dependencies need to be the inverse of the package
dependencies (fixes comment shown in menuconfig even if the package
is available).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
