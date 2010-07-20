From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 21:35:24 +0200
Subject: [Buildroot] [git commit master 1/1] libdrm: needs LARGEFILE support
Message-ID: <20100720193540.8E2E982B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f242065eff73480932f3b9ef0c8d0da3651a10c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/libdrm/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 29e5cdc..b182077 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	busybox, bzip2, cdrkit, cmake, dash, dhcp, dialog, diffutils,
 	distcc, dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, flex,
 	fontconfig, gawk, gstreamer, gzip, intltool, ipsec-tools,
-	iptables, libart, libcgi, libfuse, libgpg-error, libidn,
+	iptables, libart, libcgi, libdrm, libfuse, libgpg-error, libidn,
 	liblockfile, libpng, links, linux-fusion, lmbench, lrzsz,
 	make, module-init-tools, mysql_client, nbd, ncurses, neon,
 	netcat, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index ab8c2d8..d68f9d5 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
@@ -12,3 +13,6 @@ config BR2_PACKAGE_LIBDRM
 	  Direct Rendering Manager
 
 	  http://dri.freedesktop.org/libdrm/
+
+comment "libdrm requires a toolchain with LARGEFILE support"
+	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
-- 
1.7.1
