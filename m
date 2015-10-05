From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 Oct 2015 22:04:36 -0300
Subject: [Buildroot] [PATCH 2/3] rtorrent: drop sigc dep & switch homepage
In-Reply-To: <1444007077-16204-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444007077-16204-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1444007077-16204-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsigc isn't used/needed any longer so drop it.
And switch to the proper homepage rather than the tarball repository.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rtorrent/Config.in   | 3 +--
 package/rtorrent/rtorrent.mk | 2 +-
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
-- 
2.4.9
