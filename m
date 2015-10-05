From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 08:28:50 +0200
Subject: [Buildroot] [git commit] libtorrent: drop sigc dep & switch homepage
Message-ID: <20151005063006.B4D5B81E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2de1d64a5f3fe66552c283dfb8d57e6d88a448f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsigc isn't used/needed any longer so drop it.
And switch to the proper homepage rather than the tarball repository.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent/Config.in     |    3 +--
 package/libtorrent/libtorrent.mk |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index 02ed73a..48e6add 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -3,11 +3,10 @@ config BR2_PACKAGE_LIBTORRENT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_ARCH_HAS_ATOMICS
-	select BR2_PACKAGE_LIBSIGC
 	help
 	  BitTorrent library written in C++ for *nix
 
-	  http://rtorrent.net/downloads/
+	  https://github.com/rakshasa/libtorrent
 
 comment "libtorrent needs a toolchain w/ C++, threads"
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 9690acb..633b86a 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -6,7 +6,7 @@
 
 LIBTORRENT_VERSION = 0.13.6
 LIBTORRENT_SITE = http://rtorrent.net/downloads
-LIBTORRENT_DEPENDENCIES = host-pkgconf libsigc \
+LIBTORRENT_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 LIBTORRENT_CONF_OPTS = --enable-aligned \
