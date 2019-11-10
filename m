From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2019 22:40:03 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.7
Message-ID: <20191110213303.BAD928ECEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83c2e5f6e3b0a27a171cad6de2b2e8b04dd8c517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 36 +++++++++++++++++++++++++-----------
 Makefile |  4 ++--
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3d5f55f6dd..3bea34bf4d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,24 +1,38 @@
-2019.02.7, not yet released:
+2019.02.7, Released November 10th, 2019
 
 	Important / security related fixes.
 
 	support/testing: use a kernel with HW_RANDOM_VIRTIO to work
 	around issues with lack of entrophy
 
-	toolchain: Also copy libssp.so for external toolchains if SSP
-	to handle toolchains providing SSP support in libssp rather
-	than in the C library
+	Toolchain: Also copy libssp.so for external toolchains if SSP
+	is enabled to handle toolchains providing SSP support in
+	libssp rather than in the C library
+
+	Download: Also use the package download method for extra
+	downloads from the same site, so it does not get confused by
+	URLs containing '+'
+
+	Fakeroot now works correctly under Microsoft Windows 10
+	Services for Linux, which does not provide SYSV IPC support
 
 	utils/test-pkg: ensure to exit with an error upon failure
 
-	Updated/fixed packages: asterisk, azmq, cups-filters, duma,
-	exfat, exfat-utils, file, gd, ghostscript, go, gvfs,
-	intel-microcode, kvm-unit-tests, libnspr, libnss, libopenssl,
+	Updated/fixed packages: asterisk, azmq, cups-filters,
+	domoticz, duma, elf2flt, eudev, exfat, exfat-utils, fakeroot,
+	file, freerdp, gd, ghostscript, go, gvfs, intel-microcode,
+	kvm-unit-tests, libarchive, libnspr, libnss, libopenssl,
 	libpcap, libpciaccess, librsvg, libseccomp, libsigrok,
-	libtorrent, libunwind, lua-sdl2, lxc, minizip, mjpegtools,
-	mongoose, php, python, python-pysnmp-apps, qemu, qt5base,
-	ruby, safeclib, samba4, sdl_mixer, sox, sudo, tcpdump, unscd,
-	util-lkinux, vtun, xvisor
+	libtorrent, libunwind, linux-tools, lua-sdl2, lxc, minizip,
+	mjpegtools, mongoose, php, python, python-pysnmp-apps,
+	python3, qemu, qt5base, ruby, safeclib, samba4, sdl_mixer,
+	sox, sudo, systemd, tcpdump, unscd, util-lkinux, vtun, xvisor,
+	yaffs2utils
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11366: [2018.08] SysV IPC not available for fakeroot on WSL
+	#12261: sudo versions prior to 1.8.28 are affected
 
 2019.02.6, Released October 3rd, 2019
 
diff --git a/Makefile b/Makefile
index 8bdf546097..43c4411e67 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.6
+export BR2_VERSION := 2019.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1570115000
+BR2_VERSION_EPOCH = 1573422000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
