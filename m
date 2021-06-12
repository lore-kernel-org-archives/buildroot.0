From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Jun 2021 16:58:31 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.3
Message-ID: <20210612142852.B8E688B73A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5293208a57ce78f9fc958704d7df52f28532cde6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 35f8fbec01..80c0125b80 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,48 @@
+2021.02.3, released June 12th, 2021
+
+	Important / security related fixes.
+
+	CPE meta data has been added for a large number of packages
+
+	Updated/fixed packages: acpid, apache, apcupsd, assimp, bird,
+	bitcoin, blktrace, boost, capnproto, chrony, dc3dd, dhcp,
+	directfb, dmalloc, docker-engine, ebtables, efibootmgr,
+	enlightenment, enscript, environment-setup, exempi, expat,
+	findutils, flatcc, fluidsynth, frr, gdb, go, gptfdisk, grpc,
+	gst1-plugins-bad, gst1-rtsp-server, gstreamer1, gupnp,
+	hostapd, hwloc, i2c-tools, iftop, imagemagick, imx-gpu-viv,
+	intel-mediadriver, intel-microcode, jquery-validation,
+	keepalived, kodi, less, libcamera, libcurl, libcutl, libesmtp,
+	libeXosip2, libffi, libfuse, libfuse3, libgeos, libgtk2,
+	libgtk3, libical, libidn, libidn2, libkcapi, libldns, libmms,
+	libmodbus, libmspack, libnids, libopenh264, liboping, libraw,
+	librelp, libsamplerate, libtirpc, libusb, libuv, libxcb,
+	libxml2, libxslt, live555, llvm, lmbench, localedef,
+	lttng-tools, lvm2, lz4, mesa3d, mimic, mini-snmpd, minidlna,
+	minissdpd, minizip, mono-gtksharp3, mpg123, mpv, msmtp, musl,
+	mutt, nasm, nbd, netperf, netsurf, nginx, odb, opencv3,
+	openssh, opentyrian, oprofile, p7zip, paho-mqtt-c, perl,
+	php-imagick, pifmrds, picocom, pigz, pngquant, poco,
+	postgresql, prosody, proxychains-ng, pulseaudio, putty, pwgen,
+	python-autobahn, python-bluezero, python-engineio,
+	python-keyring, python-pillow, python-requests, python-tqdm,
+	qemu, qpdf, qt5base, redis, refpolicy, rt-tests, runc,
+	shellinabox, squid, strace, supervisor, synergy, taglib,
+	tclap, terminology, thermald, tini, tinyproxy, tinyxml2,
+	tpm2-tss, uclibc, udisks, uhd, unscd, vlc, waylandpp,
+	webkitgtk, weston, wireshark, wpa_supplicant, wpewebkit,
+	xlib_libdmx, xlib_libFS, xlib_libICE, xlib_libX11,
+	xlib_libXcursor, xlib_libXdmcp, xlib_libXext, xlib_libXfixes,
+	xlib_libXfont2, xlib_libXinerama, xlib_libXpm, xlib_libXres,
+	xlib_libXt, xlib_libXtst, xlib_libXxf86dga, xlib_libXxf86vm,
+	xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13781: isc dhcp-server package don't create file /usr/bin/dhcpd
+	#13801: toolchainfile.cmake CMAKE_BUILD_TYPE
+	#13806: Building host-localedef fails on fedora 34/gcc 11
+
 2021.02.2, released May 12th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 83e90317e9..7e896e9077 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.2
+export BR2_VERSION := 2021.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1620810000
+BR2_VERSION_EPOCH = 1623509900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 3c1f55033d..303e266c68 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.2'
+RELEASE='2021.02.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
