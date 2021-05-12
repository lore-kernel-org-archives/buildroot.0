From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 11:06:28 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.2
Message-ID: <20210512083834.A4009873A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76b4f9e9b658d3a4a72266e4aa2e63aa7a3f54f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 34 +++++++++++++++++-----------------
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 38b8e5b033..35f8fbec01 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2021.02.2, not yet released
+2021.02.2, released May 12th, 2021
 
 	Important / security related fixes.
 
@@ -9,7 +9,7 @@
 	ijson backend for older (< 2.5) ijson versions rather than the
 	slow python default, speeding up pkg-stats by ~2x.
 
-	CMake infrastructure: Use CMAKE_EXE_LINKERFLAGS rather than
+	CMake infrastructure: Use CMAKE_EXE_LINKER_FLAGS rather than
 	CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility
 	issue with poppler.
 
@@ -18,22 +18,22 @@
 	correct directory for both in-tree / out-of-tree builds.
 
 	Updated/fixed packages: at91bootstrap, avahi, bash, bind,
-	bridge-utils, cegui, cifs-utils, clamav, cmake, coremark-pro,
-	coreutils, cryptsetup, dmalloc, dnsmasq, docker-cli,
-	docker-engine, domoticz, efl, exim, ffmpeg, flex, gcc,
-	genext2fs, go, gst1-interpipe, haproxy, hostapd, i2c-tools,
-	imx-vpu, kexec, kf5-kcoreaddons, kismet, libcamera, libcurl,
-	libdrm, libfreefare, libfuse3, libgeos, libgpiod, libnpupnp,
-	libopenssl, libp11, librsync, libtomcrypt, libupnp, localedef,
-	lxc, m4, makedevs, mender, mesa3d, mesa3d-headers, mkpasswd,
-	mkpimage, modem-manager, monkey, mpd, ncurses, nettle,
-	network-manager, nginx, numactl, openjdk, openjdk-bin,
-	openldap, openvpn, php, pipewire, python-aioconsole,
-	python-asgiref, python-botocore, python-django,
-	python-dnspython, python-flup, python-httplib2,
+	bridge-utils, boost, cegui, cifs-utils, clamav, cmake,
+	coremark-pro, coreutils, cryptsetup, dmalloc, dnsmasq,
+	docker-cli, docker-engine, domoticz, efl, exim, ffmpeg, flex,
+	gcc, genext2fs, go, gst1-interpipe, haproxy, hostapd,
+	i2c-tools, imx-vpu, kexec, kf5-kcoreaddons, kismet, libcamera,
+	libcurl, libdrm, libfreefare, libfuse3, libgeos, libgpiod,
+	libnpupnp, libopenssl, libp11, librsync, libtomcrypt, libupnp,
+	localedef, lvm2, lxc, m4, makedevs, mender, mesa3d,
+	mesa3d-headers, mkpasswd, mkpimage, modem-manager, monkey,
+	mpd, ncurses, nettle, network-manager, nginx, numactl,
+	openjdk, openjdk-bin, openldap, openvpn, php, pipewire,
+	python-aioconsole, python-asgiref, python-botocore,
+	python-django, python-dnspython, python-flup, python-httplib2,
 	python-markdown2, python-mbrstrdecoder, python3, quickjs,
-	readline, rsyslog, ruby, samba4, sconeserver, snort, sox,
-	systemd, tar, timescaledb, tio, tor, usb_modeswitch,
+	readline, rsyslog, ruby, rust, samba4, sconeserver, snort,
+	sox, systemd, tar, timescaledb, tio, tor, usb_modeswitch,
 	wpa_supplicant, xdriver_xf86-video-ati, xen, xlib_libXaw,
 	xserver_xorg-server
 
diff --git a/Makefile b/Makefile
index 01352eec5d..83e90317e9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.1
+export BR2_VERSION := 2021.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1617790000
+BR2_VERSION_EPOCH = 1620810000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 5dd75ad8d7..3c1f55033d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.1'
+RELEASE='2021.02.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
