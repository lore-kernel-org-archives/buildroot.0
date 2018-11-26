From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 22:50:27 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] Update for 2018.08.3
Message-ID: <20181126214722.6508D88953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4ccaef6cc159cb8dfcee482060315c4e8a40b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 303ff8f7f4..46b2b43732 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,49 @@
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
diff --git a/Makefile b/Makefile
index 3179ee759b..ef0a8ab5ed 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08.2
+export BR2_VERSION := 2018.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1540470000
+BR2_VERSION_EPOCH = 1543269000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
