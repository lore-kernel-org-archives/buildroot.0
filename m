From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:15:56 +0200
Subject: [Buildroot] [git commit] package/network-manager: don't require an
 external DHCP client
Message-ID: <20190426071113.E744481151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ab8b96fa8f77315adfbbe09659a8320d287bec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NetworkManager now has an internal DHCP client.  Therefor, there is no
need to select either the DHCPCD or DHCP_CLIENT package to get DHCP.

Remove the forced select of one of those packages.

The internal DHCP client has become NetworkManager's preferred DHCP
client, so it seems reasonable that it effectively becomes the default,
unless DHCPCD or DHCP_CLIENT are intentionally enabled.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index ca508185f0..2d854fe003 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	# Tested with 3.2, but may even work with earlier versions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
-	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
