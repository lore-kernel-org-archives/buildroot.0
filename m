From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2019 09:01:14 +0100
Subject: [Buildroot] [git commit] Update for 2019.02.7
Message-ID: <20191111075755.1560A8ED27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=046735f5d17d0faa0a008b62fd9e260ad1c55e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 83c2e5f6e3b0a27a171cad6de2b2e8b04dd8c517)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/CHANGES b/CHANGES
index 9161ba16e8..b3bef0d234 100644
--- a/CHANGES
+++ b/CHANGES
@@ -550,6 +550,42 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.7, Released November 10th, 2019
+
+	Important / security related fixes.
+
+	support/testing: use a kernel with HW_RANDOM_VIRTIO to work
+	around issues with lack of entrophy
+
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
+
+	utils/test-pkg: ensure to exit with an error upon failure
+
+	Updated/fixed packages: asterisk, azmq, cups-filters,
+	domoticz, duma, elf2flt, eudev, exfat, exfat-utils, fakeroot,
+	file, freerdp, gd, ghostscript, go, gvfs, intel-microcode,
+	kvm-unit-tests, libarchive, libnspr, libnss, libopenssl,
+	libpcap, libpciaccess, librsvg, libseccomp, libsigrok,
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
+
 2019.02.6, Released October 3rd, 2019
 
 	Important / security related fixes.
