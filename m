From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 May 2017 12:21:23 +0200
Subject: [Buildroot] [git commit] CHANGES: Update for 2017.05-rc1
Message-ID: <20170508102142.C347581DCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c71edb8b9121701f3e3c7eb88b0496e72de5f365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 147 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/CHANGES b/CHANGES
index 332580f..8496b29 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,150 @@
+2017.05-rc1, Released May 8th, 2017
+
+	Fixes all over the tree and new features.
+
+	Infrastructure:
+
+	- Installed binaries are now checked for correct architecture
+	  to catch natively built binaries or binaries built for other
+	  architecture variants.
+
+	- Luarocks infrastructure improvements to extraction handling,
+	  support for upstream name != Buildroot package name.
+
+	- 'make printvars' output format has changed to make it easier
+	  to use in scripts. It now has options to quote the variables
+	  and to show the expanded/unexpanded values.
+
+	- Automatic ext2 rootfs size calculation has been removed. The
+	  logic was not working working reliable in all setups as it
+	  depends on the host filesystem behaviour, so instead now the
+	  size has to be specified explicitly (defaults to 60MB).
+
+	- The git download infrastructure now ensures that GNU format
+	  tar files are created.
+
+	- Fixed a variable clashing issue in the mkusers script with
+	  internal bash variables.
+
+	- Fakeroot now links against libacl to fix issues on
+	  distributions using acls.
+
+	- Correct permissions for /dev/pts/ptmx when systemd is used
+	  with recent glibc versions.
+
+	- br2-external: Improve error reporting.
+
+	- A wrapper script for genimage has been added in
+	  support/scripts/genimage.sh for easy use of genimage from
+	  post-image scripts.
+
+	- A script to check for common style issues in new packages
+	  before submitting has been added in support/scripts/check-package
+
+	- Defconfigs are now tested by gitlab-CI instead of Travis:
+	  https://gitlab.com/buildroot.org/buildroot
+
+	- Infrastructure for runtime testing has been added to
+          support/testing
+
+	Toolchain:
+
+	- External linaro toolchains updated to 2017.02, ARC toolchain
+          updated to 2017.03-rc1, NIOSII CodeSourcery to 2017.05
+
+	- A number of fixes and improvements to the external toolchain
+	  handling, including C library detection, multilib and ld.so
+	  handling
+
+	- Glibc 2.25 and uClibc-ng 1.0.24 added, wordexp support enabled
+          for uClibc-ng
+
+	- Binutils 2.28 added and default changed to 2.27
+
+
+	Architectures:
+
+	- Support for the C-SKY architecture has been added.
+
+
+	License handling:
+
+	- The package license markings for legal info now uses the
+	  SPDX short identifiers for the license string where possible.
+
+	- License info has been improved / added for a number of packages.
+
+
+	Misc:
+
+	- Cmake 3.7.x installed on the host is no longer ignored as a
+          workaround for the RPATH issues has been implemented.
+
+	- Docker-engine can now be built statically on an otherwise
+	  dynamic linked build for docker-in-docker setups.
+
+	- U-Boot now supports out-of-tree device trees, similar to
+          Linux
+
+	- Nodejs 0.10.x support (and with it, support for <ARMv6) has
+          been removed as this is now EOL upstream.
+
+	New defconfigs: AT91sam9x5ek dev/mmc/mmc-dev, banana pro,
+	Nationalchip gx6605s, MIPS creator ci40, nexbox a95x, 64bit
+	defconfig for raspberry pi 3, stm32f429-disc1.
+
+	The raspberry pi zero-w and rpi3 compute module are now also
+	supported by the rpi0 / rpi3 defconfigs, beaglebone green is
+	supported by the beaglebone defconfig.
+
+	Removed defconfig: minnowboard, via imx6 vab820, altera
+	socdk/sockit
+
+	New packages: arp-scan, atest, augeas, bluez-tools, daemon,
+	dc3dd, dieharder, execline, fmt, ghostscript, gqrx,
+	gst1-vaapi, jo, keepalived, kmscube, kodi-jsonschemabuilder,
+	kodi-skin-confluence, kodi-texturepacker, lensfun, leptonica,
+	libbson, libcsv, libgphoto2, libkcapi, libmaxminddb,
+	libmediaart, libnpth, libscrypt, lua-bit32, lua-resty-http,
+	lugaru, memtool, mpir, nanomsg, physfs, phytool, pngquant,
+	python-decorator, python-simplegeneric,
+	python-sortedcontainers, rpi-bt-firmware, rpi-wifi-firmware,
+	s6, s6-dns, s6-linux-init, s6-linux-utils, s6-networking,
+	s6-portable-utils, s6-rc, supertux, tesseract-ocr,
+	uccp420wlan, wilink-bt-firmware
+
+	Broken packages: ola
+
+	Removed packages: cosmo, kodi-visualisation-fountain,
+	polarssl, portmap, xdriver_xf86-video-glide,
+	xdriver_xf86-video-v4l, xdriver_xf86-video-wsfb
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#8831: image generation fails on host ZFS due to "no free space"
+	#9436: e2fsprogs remove busybox applets even of unselected e2fs..
+	#9456: mkusers script bash errors
+	#9496: mke2img fails during build on ntfs-3g host partition
+	#9531: NPM fails to build embedded modules
+	#9596: KODI: --enable-lirc needs "HAVE_LIRC" compiler definition..
+	#9691: Wrong cryptsetup package include files location
+	#9696: Wrong cryptsetup package include files location
+	#9706: Can't download newer revisions of package from PyPI
+	#9711: Recent libCEC version bump seems to break kodi package
+	#9716: exit, shutdown, reboot from kodi
+	#9721: version 2017.02: no acceptable m4 could be found in $PATH
+	#9726: Raspberry Pi version B - Problems with UART speed in..
+	#9751: expat legal info - manifest.csv: GPLv2 Source site: MIT..
+	#9756: glibc fails to build on buildroot-sh4*-buildroot-linux-gnu
+	#9766: support/scripts/pkgutil.py conflicts with the pkgutil.py..
+	#9776: libubox build failed
+	#9791: Python searches for packages in the user site directory
+	#9806: libseccomp is not available when BR2_arm=y
+	#9826: post-build scritp - symlinks created in post-build script..
+	#9836: triggerhappy: systemd unit broken
+	#9846: musl libc not installed correctly in target folder
+	#9856: build libubox failed on ubuntu 17.04 64bit
+
 2017.02.2, Released May 1st, 2017
 
 	Important / security related fixes.
