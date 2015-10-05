From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 08:28:58 +0200
Subject: [Buildroot] [git commit] rtorrent: drop sigc dep & switch homepage
Message-ID: <20151005063006.C203D81E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f904fd9f1d97d63504610cb75b3b041e12f24b5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsigc isn't used/needed any longer so drop it.
And switch to the proper homepage rather than the tarball repository.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtorrent/Config.in   |    3 +--
 package/rtorrent/rtorrent.mk |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 77ab595..0583152 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -6,14 +6,13 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS # libtorrent
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	help
 	  BitTorrent Client using libtorrent
 
-	  http://rtorrent.net/downloads/
+	  https://github.com/rakshasa/rtorrent
 
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index bedf404..edde02e 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -6,7 +6,7 @@
 
 RTORRENT_VERSION = 0.9.6
 RTORRENT_SITE = http://rtorrent.net/downloads
-RTORRENT_DEPENDENCIES = host-pkgconf libcurl libsigc libtorrent ncurses
+RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_AUTORECONF = YES
 RTORRENT_LICENSE = GPLv2
 RTORRENT_LICENSE_FILES = COPYING
