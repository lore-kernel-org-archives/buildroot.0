From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:53:46 +0100
Subject: [Buildroot] [git commit] Config.in files: unify comment dependency
	on udev /dev management
Message-ID: <20131219205533.AECC29C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71bdf4c40bbd012878947cb9b2b1e00f4b0f75d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmbim/Config.in         |    2 +-
 package/modem-manager/Config.in   |    2 +-
 package/network-manager/Config.in |    5 +++--
 package/systemd/Config.in         |    2 +-
 package/udev/Config.in            |    9 +++------
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index ccc0f25..d034e84 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -12,6 +12,6 @@ config BR2_PACKAGE_LIBMBIM
 
 	  http://www.freedesktop.org/wiki/Software/libmbim/
 
-comment "libmbim needs udev and a toolchain w/ wchar, threads"
+comment "libmbim needs udev /dev management and a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 4e2cfc7..e157ca8 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -31,6 +31,6 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	  This option enables support for QMI protocol
 endif
 
-comment "modemmanager needs udev and a toolchain w/ largefile, wchar, threads, IPv6"
+comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 5513c01..a194433 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -28,8 +28,9 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
-comment "NetworkManager needs a toolchain w/ IPv6, largefile, wchar, threads"
+comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f6a15e3..fe81900 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_SYSTEMD
 
 comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index f4ffe98..91dc7cf 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -40,10 +40,7 @@ comment "enabling all extras needs a toolchain w/ wchar, threads"
 
 endif
 
-comment "udev requires /dev mgmnt set to udev under System configuration"
+comment "udev needs udev /dev management and a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-
-comment "udev needs a toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_avr32
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+		!BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
