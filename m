From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 17:55:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.9
Message-ID: <20201227163805.3654582BD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15a05e6d5a875759d217d61b3c7b31ec87ea4eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 33 +++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 389e305a50..dfb3c5447b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2020.02.9, released December 27th, 2020
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
+	bustle, c-ares, ca-certificates, cdrkit, cryptopp, dhcpcd,
+	docker-containerd, dtv-scan-tables, flare-engine, ghostscript,
+	haproxy, imagemagick, imx-gpu-viv, jasper, jemalloc,
+	jpeg-turbo, libcap, libcurl, libglib2, libgpiod, libkrb5,
+	libopenssl, libplist, libressl, libuv, libuvw, lynx, mariadb,
+	mbedtls, minidlna, monkey, musl, mutt, ncurses, netsnmp,
+	nodejs, opencv3, openldap, openrc, opkg-utils, paho-mqtt-c,
+	php, privoxy, proftpd, python-crc16, python-flask-cors,
+	python-lxml, python-pip, python-pyparsing, python-pyqt5, qemu,
+	qt5base, raptor, rauc, ruby, setserial, shadowsocks-libev,
+	slirp, sqlcipher, ti-sgx-demos, tinycbor, vsftpd,
+	wireless-regdb, wireshark, x11vnc, xen, xinetd,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13276: libcap builds libcap.pc incorrectly
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13341: Mistake in /etc/init.d/S70vsftpd
+
 2020.02.8, released November 16th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a3fc46e6f2..514816978a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.8
+export BR2_VERSION := 2020.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1605567000
+BR2_VERSION_EPOCH = 1609088000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1695972664..b0c9ade199 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02.8'
+RELEASE='2020.02.9'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
