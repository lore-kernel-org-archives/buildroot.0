From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Apr 2021 12:18:44 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.1
Message-ID: <20210407095334.564777FE54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb10b0dfe690a77e137395ad91290d799bf018c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 +--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f7b69af806..372082cbe7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,66 @@
+2021.02.1, released April 7, 2021
+
+	Important / security related fixes.
+
+	Dependencies: Explicitly detect and bail out if PATH contains
+	spaces or tabs. A number of packages fail to build in such
+	setups, so explicitly inform about this.
+
+	utils/scanpypi: Explicitly use python3 for compatibility with
+	packages using python3 syntax in setup.py
+
+	support/download: Fix tarball generation (from git/svn repos)
+	including symlinks pointing to ./<something>. Fix svn download
+	for <1.9 clients or repos using CVS-style keywords.
+
+	Meson: Use correct C++ host compiler (rather than C compiler)
+
+	Toolchain: Add logic to work around binutils bug 21464,
+	affecting OpenRISC, and drop the now longer applicable bug
+	19615 / 20006 handling.
+
+	Python{,3}: Fix byte compiling python files with short (single
+	character before .py) file names.
+
+	CPE meta data has been added for a large number of packages
+
+	Defconfigs: Correct Beaglebone QT file system overlay
+
+	Updated/fixed packages: alsa-utils, at91bootstrap3,
+	batman-adv, binutils, botan, bridge-utils, ca-certificates,
+	cog, coreutils, diffutils, dmidecode, docker-cli,
+	docker-containerd, docker-engine, efivar, fetchmail, frr,
+	genimage, git, gnutls, go, grub2, gst-omx, gst1-devtools,
+	gst1-libav, gst1-plugins-bad, gst1-plugins-base,
+	gst1-plugins-good, gst1-plugins-ugly, gst1-python,
+	gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, haproxy, haserl, hwloc,
+	irqbalance, jasper, kexec, kexec-lite, kismet, kodi, libcurl,
+	libfreeglut, libgcrypt, libgeos, libglib2, libopenssl, libqmi,
+	libressl, libupnp, libvips, libvpx, libwebsockets, linux,
+	lldpd, logrotate, lttng-libust, lttng-tools, mariadb, mbedtls,
+	mcelog, mender, micropython, mongoose, mosquitto, mpd,
+	netsnmp, nodejs, openmpi, openssh, openvpn, opkg-utils,
+	optee-client, optee-test, perl, php, proftpd, protobuf,
+	python-jinja2, python-lxml, python-paramiko, python-py,
+	python-pygments, python-rpi-ws281x, python-urllib3, python3,
+	qt5webkit, qwt, rpm, samba4, sconeserver, sdl2, shim,
+	sqlcipher, squid, sysklogd, syslinux, sysvinit, tor,
+	transmission, tzdata, uboot, uclibc, upx, webkitgtk,
+	wireshark, wpebackend-fdo, wpewebkit, xen, zstd
+
+	New packages: perl-parse-yapp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13516: utils/scanpypi: Failure when parsing diffoscope
+	#13576: Issues compiling buildroot for 5x86
+	#13601: Gen image :Iappropriate ioctl error
+	#13616: tar file from git repository generation issue
+	#13641: glibc on raspberrypi
+	#13646: Gen image version 14 error : no sub -section title/..
+	#13671: openSSH server closes connection before authentication..
+
 2021.02, released March 6th, 2021
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 9d6b962477..01352eec5d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02
+export BR2_VERSION := 2021.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1615065000
+BR2_VERSION_EPOCH = 1617790000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 685d8e3b75..5dd75ad8d7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02'
+RELEASE='2021.02.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
