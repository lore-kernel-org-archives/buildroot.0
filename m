From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 22:15:54 +0200
Subject: [Buildroot] [git commit] package/postgis: add missing || in
 Config.in
Message-ID: <20210426194852.74D7A8489B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7e5b0908e2328d9570ddccf402d9c8919b9b957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was forgotten in commit 72eba37e520ede9277a7a84cde82be992eb5639d.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 830d75b762..49887b61c0 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -23,6 +23,6 @@ config BR2_PACKAGE_POSTGIS
 comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
