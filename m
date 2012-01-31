From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:23:54 +0100
Subject: [Buildroot] [git commit] network-manager: replace dependency on
	dbus by select
Message-ID: <20120131112714.63EB790961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a63f874a2869baaa919ced8f3054f904e493854
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/network-manager/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 6e51f53..9708a11 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2
@@ -25,6 +25,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
-comment "NetworkManager requires DBus and a toolchain with IPV6, LARGEFILE and WCHAR support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_PACKAGE_DBUS
+comment "NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR
 
