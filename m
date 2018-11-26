From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 23:14:06 +0100
Subject: [Buildroot] [git commit] Update for 2018.08.3
Message-ID: <20181126221336.55E808896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccfdcd1769872a7df9787456d115eb0fd1cacde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b4ccaef6cc159cb8dfcee482060315c4e8a40b4)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/CHANGES b/CHANGES
index dedd2755a0..bf5054ccb1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -137,6 +137,52 @@
 	#11451: Can't find libmpfr.so.4 when using external toolchain on ubuntu..
 	#11481: Docs: Is external.desc required?
 
+2018.08.3, Released November 26th, 2018
+
+	Important / security related fixes.
+
+	fs: Drop intermediate tarball from the filesystem handling to
+	fix an issue with xattrs handling related to fakeroot. Ensure
+	tarball target includes xattrs.
+
+	download: Fix confusion in git submodule handling if dl/ is a
+	symlink.
+
+	toolchain: Only allow enabling stack protection on
+	architectures with control flow integrity (CFI) support. Only
+	allow FORTIFY_SOURCE support on gcc >= 6.
+
+	genrandconfig: Fix missing newline in BR2_WGET handling,
+	causing the following line to be ignored. This would affect
+	BR2_ENABLE_DEBUG, BR2_INIT_BUSYBOX, BR2_INIT_SYSTEMD,
+	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV, BR2_STATIC_LIBS or
+	BR2_PACKAGE_PYTHON_PY_ONLY depending on the randomization.
+
+	show-build-order: Also include the dependencies of
+	rootfs-common.
+
+	Defconfigs: Fixes for Armadeus APF27, imx6sabre, Olimex A20
+	olinuxino lime legacy, Orangepi zero plus 2.
+
+	graph-depends: Fix for package names starting with a non-alpha
+	character.
+
+	Updated/fixed packages: attr, audit, bind, brotli, busybox,
+	dtc, easydbus, elfutils, flare-engine, flatcc, gauche, gcc,
+	giflib, gpsd, lcdproc, libcurl, libiscsi, libkcapi, libnfs,
+	libnspr, libnss, libsemanage, liburiparser, lighttpd,
+	lua-curl, mariadb, mmc, mosquitto, mysql, ncmpc, neardal,
+	netplug, network-manager, nfs-utils, nginx, openocd, openswan,
+	p11-kit, postgresql, prosody, qemu, qt, rpm, ruby, samba4,
+	squid, supertuxkart, systemd, tar, trace-cmd, traceroute,
+	twolame, uclibc, usb_modeswitch, vtun, webkitgtk, weston,
+	xdriver_xf86-video-geode, xlib_libfontenc, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11086: download/git submodule breaks on symlinked dl folder
+	#11481: Docs: Is external.desc required?
+
 2018.08.2, Released October 25th, 2018
 
 	Important / security related fixes.
