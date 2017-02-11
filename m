From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:41:10 +0100
Subject: [Buildroot] [git commit] CHANGES: prepare for 2017.02-rc1
Message-ID: <20170211144127.9464D81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f17e8cfcce1f8625f11a38a1739bf0fe35eeeae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/CHANGES b/CHANGES
index ec749a1..db7a541 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,85 @@
+2017.02-rc1, Released February 11th, 2017
+
+	Fixes all over the tree and new features.
+
+	Infrastructure:
+
+	  - numerous improvements to support reproducible builds
+
+	  - new waf-package package infrastructure to support packages
+	    that use the Waf build system. 6 packages converted to
+	    this infrastructure.
+
+	  - add support for the OpenRISC CPU architecture
+
+	  - merge description of the ARM and ARM64 options, and add
+	    support for selecting a specific ARM64 core
+
+	Toolchain:
+
+	  - major rework of the external toolchain support. It is now
+	    split into several packages, one per external toolchain,
+	    and a common infrastructure.
+
+	  - important fix for musl to prevent a conflict between musl
+	    and kernel headers (fixes the build of numerous packages
+	    with musl)
+
+	  - uClibc-ng bumped to 1.0.22, and therefore enable uClibc
+	    for ARM64, mips32r6 and mips64r6
+
+	  - add gdb 7.12.1, and switch to gdb 7.11 as the default
+
+	  - Linaro toolchains updated to 2016.11, ARC toolchain
+	    components updated to arc-2016.09, MIPS Codescape
+	    toolchains bumped to 2016.05-06, CodeSourcery AMD64 bumped
+	    to 2016.11-19
+
+	  - remove Analog Devices toolchain for the Blackfin
+	    architecture
+
+	New defconfigs: Freescale i.MX23EVK, Qemu OpenRISC emulation,
+	Grinn chiliBoard, Freescale i.MX6Q SabreSD, BeagleBoard X15,
+	OrangePi One, ARC HS38 HAPS
+
+	New packages: angular-websocket, aubio, bctoolbox, darkhttpd,
+	ddrescue, easydbus, fakedate, git-crypt, hiredis, ifenslave,
+	jsmn, libgpiod, libgsm, linux-syscall-support, mariadb, mimic,
+	nginx-dav-ext, nmon, opkg-utils, policycoreutils,
+	pru-software-support, python-arrow, python-attrs,
+	python-babel, python-bitstring, python-chardet,
+	python-constantly, python-flask-babel, python-gunicorn,
+	python-incremental, python-jsonschema, python-logbook,
+	python-markdown2, python-mbstrdecoder, python-mutagen,
+	python-pathpy, python-pudb, python-pyqrcode,
+	python-pytablereader, python-setuptools-scm, python-sh,
+	python-toml, python-vcversioner, python-whoosh,
+	raspberrypi-usbboot, riemann-c-client, rtl8723bs, skalibs,
+	sslh, sngrep, ti-cgt-pru, uclibc-ng-test, udpxy, uhttpd,
+	upower, ustream-ssl, waf, xlib_libXfont2
+
+	Removed packages: perl-db-file, snowball-hdmiservice,
+	snowball-init
+
+	Tooling: addition of a test-pkg script to help contributors
+	build test their package.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#8946: Valgrind fails to build with stack protection turned on
+	#9461: odroidc2 - toolchain Linaro AArch64 2016.11 compile error
+	#9466: VIM_REMOVE_DOCS removes rgb.txt
+	#9486: xorg-server 1.19 fails to compile for glibc with systemd init (x86_64)
+	#9501: eudev fails to build with older kernel headers
+	#9526: Embedded NPM fails to start with "no such file or directory" error
+	#9541: Platform drivers autoloading from info in device tree does not work
+	#9546: seems BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS do nothing
+	#9551: Coreutils fails to build target src/src_libsinglebin_pinky_a-pinky.o
+	#9566: [kmod] Compilation fails with uclibc
+	#9571: buildroot fails while building opencv for arm64 platform
+	#9576: External tree with BR 2016.11 does not work anymore
+	#9606: xorg-server cannot build for ARM target
+
 2016.11.2, Released January 25th, 2017
 
 	Important / security related fixes.
