From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 16:12:22 +0100
Subject: [Buildroot] [git commit] package/network-manager: NM needs
	isc-dhcpc or dhcpcd
Message-ID: <20141126151252.9E1737FF14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94319c61d843df9582d1f17ed7224e510b36b141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NM only currently supports isc-dhcpc and dhcpcd as clients because NM
communicates with the client through DBus, and support for clients needs to
be written in.  (as per files in src/dhcp-manager)

Buildroot's default, udhcpc is not supported.

Add the dependencies to Config.in, favoring dhcpcd as
default due to size.

[Peter: drop references to dhclient, isc-dhcpc is dhclient]
Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 0ed6ca5..a3e6e33 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
