From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 15:23:34 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] Update for 2020.11.1
Message-ID: <20201227140706.CC9E282B9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=804a9e18656c1584b059129e0b5cebe2a2405fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 29 +++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3894193d39..a33ad56a71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2020.11.1, released December 27th, 2020
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
+	ca-certificates, cryptopp, dhcpcd, dtv-scan-tables,
+	flare-engine, ghostscript, go, haproxy, imagemagick,
+	imx-gpu-viv, jasper, kismet, libcurl, libglib2, libhtp,
+	libopenssl, libressl, libuv, libuvw, lua, mbedtls, mongodb,
+	mutt, ncurses, netsnmp, nodejs, opencv3, openldap, opkg-utils,
+	paho-mqtt-c, python-crc16, python-lxml, python-pyparsing,
+	python-pyqt5, qt5base, rauc, shadowsocks-libev, sqlcipher,
+	suricata, ti-sgx-demos, tinycbor, uclibc-ng-test, unbound,
+	webkitgtk, wpewebkit, wireshark, x11vnc, xen,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13416: dhcpcd start warning message: no such user dhcpcd
+
 2020.11, released December 2nd, 2020
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 34237a2125..06f1ef6aea 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11
+export BR2_VERSION := 2020.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1606948000
+BR2_VERSION_EPOCH = 1609079000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index db2a752c3b..753a9bdcdc 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11'
+RELEASE='2020.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
