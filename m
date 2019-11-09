From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Nov 2019 20:41:24 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] Update for 2019.08.2
Message-ID: <20191109193434.C01928E818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6493a3214ae78bcb163982824693c1e0b1d093c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 38 ++++++++++++++++++++++++++------------
 Makefile |  4 ++--
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index fba44dd52b..ae1730d1e6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,24 +1,38 @@
-2019.08.2, not yet released:
+2019.08.2, released November 9th, 2019
 
 	Important / security related fixes.
 
-	toolchain: Also copy libssp.so for external toolchains if SSP
+	Toolchain: Also copy libssp.so for external toolchains if SSP
 	to handle toolchains providing SSP support in libssp rather
 	than in the C library
 
+	Download: Also use the package download method for extra
+	downloads from the same site, so it does not get confused by
+	URLs containing '+'
+
+	Fakeroot now works correctly under Microsoft Windows 10
+	Services for Linux, which does not provide SYSV IPC support
+
 	utils/test-pkg: ensure to exit with an error upon failure
 
 	Updated/fixed packages: asterisk, azmq, binutils,
-	cups-filters, duma, exfat, exfat-utils, fdk-aac, file, gcc,
-	gd, ghostscript, go, gpsd, grpc, gst1-plugins-base, gvfs, icu,
-	intel-microcode, kvm-unit-tests, libnspr, libnss, libopenssl,
-	libpcap, libpciaccess, librsvg, libseccomp, libsigrok,
-	libtorrent, libunwind, libva, lua-sdl2, lxc, minizip,
-	mjpegtools, mongoose, mono, nbd, nfs-utils, php, python,
-	python-pysnmp-apps, python-tornado, qemu, qt5base, ruby,
-	safeclib, samba4, sdl_mixer, sox, sudo, suricata, tcpdump,
-	unscd, util-linux, vdr-plugin-vnsiserver, vtun, wireshark,
-	xvisor
+	cups-filters, domoticz, dtc, duma, elf2flt, eudev, exfat,
+	exfat-utils, fakeroot, fdk-aac, file, freerdp, gcc, gd,
+	ghostscript, go, gpsd, grpc, gst1-plugins-base, gvfs, icu,
+	intel-microcode, kvm-unit-tests, libfribidi, libnspr, libnss,
+	libopenssl, libpcap, libpciaccess, librsvg, libseccomp,
+	libsigrok, libtorrent, libunwind, libva, linux-tools,
+	lua-sdl2, lxc, minizip, mjpegtools, mongoose, mono, nbd,
+	nfs-utils, php, piglit, python, python-autobahn,
+	python-pysnmp-apps, python-tornado, python3, qemu, qt5base,
+	ruby, safeclib, samba4, sdl_mixer, sox, sudo, suricata,
+	systemd, tcpdump, unscd, util-linux, vdr-plugin-vnsiserver,
+	vtun, wireshark, xvisor, yaffs2utils
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11366: [2018.08] SysV IPC not available for fakeroot on WSL
+	#12261: sudo versions prior to 1.8.28 are affected
 
 2019.08.1, released October 3rd, 2019
 
diff --git a/Makefile b/Makefile
index 39c01135f8..9b0291372f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08.1
+export BR2_VERSION := 2019.08.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1570086600
+BR2_VERSION_EPOCH = 1573328000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
