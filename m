From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 16:23:17 +0100
Subject: [Buildroot] [git commit] libtorrent: needs threads support
Message-ID: <20130219152340.604659AB88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ac83dd9279add3adfb650850b19ab0c3d42cbb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/25e6a0a65d0b75050e02a5748b3f08a80b686188

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtorrent/Config.in |    5 +++--
 package/rtorrent/Config.in   |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index f0315a4..379f4a5 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
 
 	  http://libtorrent.rakshasa.no/
 
-comment "libtorrent requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libtorrent requires a toolchain with C++ and threads support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 142ff8b..7b21b5a 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RTORRENT
 	bool "rtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
@@ -12,5 +13,5 @@ config BR2_PACKAGE_RTORRENT
 
 	  http://libtorrent.rakshasa.no/
 
-comment "rtorrent requires a toolchain with C++ and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+comment "rtorrent requires a toolchain with C++, threads and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
