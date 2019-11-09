From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Nov 2019 23:02:48 +0100
Subject: [Buildroot] [git commit] Update for 2019.08.2
Message-ID: <20191109215912.35ABB8E23B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de6739c846947475a9f233273d9e6102414235fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a6493a3214ae78bcb163982824693c1e0b1d093c)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/CHANGES b/CHANGES
index f02f2a9f22..9161ba16e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -102,6 +102,42 @@
 	#12276: make clean/distclean does not remove BR2_DL_DIR and BR2_HOST_DIR
 	#12281: Custom configuration fails to build (based on raspberrypi3_..
 
+2019.08.2, released November 9th, 2019
+
+	Important / security related fixes.
+
+	Toolchain: Also copy libssp.so for external toolchains if SSP
+	to handle toolchains providing SSP support in libssp rather
+	than in the C library
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
+	Updated/fixed packages: asterisk, azmq, binutils,
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
+
 2019.08.1, released October 3rd, 2019
 
 	Important / security related fixes.
