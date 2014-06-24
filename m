From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Jun 2014 08:58:39 +0300
Subject: [Buildroot] [PATCH] network-manager: needs kernel headers v3.7
Message-ID: <1b7e8e772cec11466a7edf7844111326e2f29014.1403589519.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NetworkManager uses struct ifla_vxlan_port_range that was introduced in kernel
version 3.7.

Fixes:
http://autobuild.buildroot.net/results/6f2/6f214e3206ad0b12c633a7632c1e32c369e447ff/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/network-manager/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index b7f223ebfd62..0ed6ca5831a8 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
@@ -51,9 +52,9 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads"
+comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads, headers >= 3.7"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV
+		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-- 
2.0.0
