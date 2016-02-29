From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:52:21 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi: Remove
	dependency for BR2_STATIC_LIBS from sub packages
Message-ID: <20160229225225.1645B8073E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95fae661df69cb1f647513072e94e179d436d20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Kodi itself already depends on !BR2_STATIC_LIBS, there is no need to
duplicate this as reverse dependencies in sub options which depend on
Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index abd1dc1..13955e4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -117,7 +117,6 @@ config BR2_PACKAGE_KODI_ALSA_LIB
 
 config BR2_PACKAGE_KODI_AVAHI
 	bool "avahi"
-	depends on !BR2_STATIC_LIBS # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	help
@@ -132,26 +131,21 @@ config BR2_PACKAGE_KODI_DBUS
 
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBBLURAY
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
 
-comment "libbluray support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
-	depends on !BR2_STATIC_LIBS # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want Kodi to support HDMI CEC.
 
-comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
+comment "hdmi cec support needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_KODI_LIRC
 	bool "lirc"
@@ -184,15 +178,11 @@ config BR2_PACKAGE_KODI_RTMPDUMP
 
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
-	depends on !BR2_STATIC_LIBS # libshairplay -> avahi
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
-comment "shairport support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 comment "samba support needs a (e)glibc or uClibc toolchain w/ RPC"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC && \
 		!BR2_TOOLCHAIN_USES_UCLIBC) || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -228,14 +218,10 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool
 
