From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 18:05:36 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/libtorrent-rasterbar: drop host gcc dependency
Message-ID: <20210128200058.1F39F812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=761a7334c1a1a0c14e710b4d20aee5abb134cb99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Drop host gcc dependency which has wrongly been added by commit
0393f5d34433e34e49ff7ce0fb998735453ed4fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab0af07ce2f37c36b2c79445140d5001367844a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent-rasterbar/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index b2508b8b70..fe9a9fc027 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -1,8 +1,8 @@
 comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "libtorrent-rasterbar needs exception_ptr"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
@@ -11,7 +11,6 @@ comment "libtorrent-rasterbar needs exception_ptr"
 config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	bool "libtorrent-rasterbar"
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
