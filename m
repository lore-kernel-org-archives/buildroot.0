From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2019 21:45:27 +0100
Subject: [Buildroot] [git commit] package/uvw: needs C++
Message-ID: <20191105203831.9A3878E83A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f08a67bee54786d96e32991c54a417efd37817d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/01f97d793f28772cfce44f6979e39d8adff233af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uvw/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uvw/Config.in b/package/uvw/Config.in
index bfaed25796..e5cfc541f6 100644
--- a/package/uvw/Config.in
+++ b/package/uvw/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UVW
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_LIBUV
@@ -12,8 +13,8 @@ config BR2_PACKAGE_UVW
 
 	  https://github.com/skypjack/uvw
 
-comment "uvw needs a toolchain w/ NPTL, dynamic library, gcc >= 7"
+comment "uvw needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 7"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
