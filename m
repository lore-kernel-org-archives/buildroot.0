From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 16:30:20 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] Update for 2020.08.3
Message-ID: <20201227151335.03AF782DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6a0f0d08de2d3942b63506cb4432f428ae3796f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ffe98aa294..bb0f02178e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2020.08.3, released December 27th, 2020
+
+	Important / security related fixes.
+
+	Infrastructure:
+	- cmake: fix host ccache handling for CMake 3.19
+	- meson: Forcibly disable binary stripping for
+	  target builds, enable for host builds
+	- golang: Fix HOST / TARGET directories for per-package builds
+
+	Defconfigs: Beaglebone Qt5: Fix ti-sgx related issues
+
+	Updated/fixed packages: apitrace, arm-trusted-firmware,
+	bustle, c-ares, ca-certificates, cage, cdrkit, cryptopp,
+	dhcpcd, docker-containerd, dtv-scan-tables, flare-engine,
+	ghostscript, gvfs, haproxy, imagemagick, imx-gpu-viv, jasper,
+	jemalloc, jpeg-turbo, libcamera, libcap, libcurl, libglib2,
+	libgpiod, libkrb5, libopenssl, libplist, libressl, libuv,
+	libuvw, lynx, mariadb, mbedtls, minidlna, mongodb, monkey,
+	musl, mutt, ncurses, netsnmp, netsurf, nodejs, opencv3,
+	openldap, openrc, opkg-utils, paho-mqtt-c, php, privoxy,
+	proftpd, python-crc16, python-flask-cors, python-lxml,
+	python-pip, python-pyparsing, python-pyqt5, qemu, qt5base,
+	raptor, rauc, ruby, setserial, shadowsocks-libev, slirp,
+	sqlcipher, thermald, ti-sgx-demos, tinycbor, unbound, vsftpd,
+	wireless-regdb, wireshark, wlroots, x11vnc, xen, xinetd,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13276: libcap builds libcap.pc incorrectly
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13336: thermald-1.9.1 compilation failure with musl 1.2.1
+	#13341: Mistake in /etc/init.d/S70vsftpd
+	#13416: dhcpcd start warning message: no such user dhcpcd
+
 2020.08.2, released November 16th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 5a2fad5a05..86a38aa7e8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08.2
+export BR2_VERSION := 2020.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1602507000
+BR2_VERSION_EPOCH = 1609083000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
