From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 09:32:14 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] Update for 2020.05.1
Message-ID: <20200725072747.B20A686E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=667adccb927395ab99d17fc8877b21bf70614218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3cda0af8df..8f3d879722 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,66 @@
+2020.05.1, released July 25th, 2020
+
+	Important / security related fixes.
+
+	Toolchain:
+	- Make external toolchain version check also work for
+	  toolchains configured with --with-gcc-major-version-only
+
+	- Do not handle SOURCE_DATE_EPOCH in toolchain wrapper if the
+	  compiler supports it, fixing an issue with precompiled
+	  headers
+
+	- Ensure debug libs from external toolchains are not installed
+          into target if debugging is disabled
+
+	Download:
+	- Correct reproducibility issue in handling of git submodules
+	  for older git versions.
+
+	- Fix file locking over NFS
+
+	fs: Ensure cpio archive element order is reproducible
+
+	Br2-external: Fix error reporting for invalid br2-external trees
+
+	Per-package:
+	- Fix an issue with python3 sysconfig data not getting
+	correctly expanded
+
+	- Fix per-package building for packages using the qmake
+          infrastructure
+
+	Updated/fixed packages: a10disp, asterisk, bind, brltty,
+	cdrkit, clamav, cryptodev-linux, dbus, docker-cli,
+	docker-engine, dvb-apps, e2fsprogs, exim, exiv2, freerdp, gdb,
+	gdk-pixbuf, gerbera, gnutls, go, granite, grub2, gssdp,
+	gst1-plugins-good, gst1-plugins-ugly, gupnp, intel-microcode,
+	iproute2, irrlicht, iwd, jq, kodi, libcamera, libcec,
+	libconfuse, libcurl, libevdev, libhttpserver, libmicrohttpd,
+	libnss, libressl, libvncserver, libxml2, libxmlrpc, lxc,
+	mbedtls, mediastreamer, mesa3d, meson, minizip, mongodb,
+	mtools, mutt, nano, network-manager, nghttp2, ngircd, nodejs,
+	ntp, open-plc-utils, open2300, openjdk-bin, openssh,
+	oracle-mysql, paho-mqtt-c, pango, php, poco, prosody, putty,
+	python-greenlet, python-urllib3, python-validators, python3,
+	readline, redis, rpi-firmware, rtl8821au, samba4, sdl2,
+	sqlite, squid, strace, sunxi-mali-mainline-driver, syslog-ng,
+	systemd, tcpreplay, tinydtls, upmpdcli, upx, vlc, webkitgtk,
+	wireguard-linux-compat, wireshark, wpebackend-fdo, wpewebkit,
+	x11vnc, znc, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12941: Python GObject fails to build when using BR2_PER_PACKAGE_..
+	#12946: Grub: Decompressor is too big.
+	#12986: Mtools: Error converting to codepage 850
+	#13001: openjdk-bin replaces libfreetype.so from host-freetype
+	#13011: Incorrect selection of gcc version
+	#13021: Minor code error when building granite-0.4.1
+	#13026: rpi-firmware: must not rename start files
+	#13031: nodejs: RangeError at new ArrayBuffer()
+	#13046: Optimize for fast -Ofast is not compliant
+
 2020.05, released June 1st, 2020
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index b90ec32b25..3c2707c54a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.05
+export BR2_VERSION := 2020.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1591045000
+BR2_VERSION_EPOCH = 1595662000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
