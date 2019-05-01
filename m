From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:15:25 +0200
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: needs gcc >=
 4.9
Message-ID: <20190501131201.0F99383C36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5695f2a423db817f652752228f710af2e771bbe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needs C++11 since bump to version 1.2.0

Fixes:
 - http://autobuild.buildroot.org/results/73481ae2e5736c8042ec7911f1378623bd3de74d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libtorrent-rasterbar/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index 8c259e113e..b2508b8b70 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -1,8 +1,8 @@
-comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
+comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "libtorrent-rasterbar needs exception_ptr"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
@@ -11,8 +11,8 @@ comment "libtorrent-rasterbar needs exception_ptr"
 config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	bool "libtorrent-rasterbar"
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on BR2_USE_WCHAR # boost
