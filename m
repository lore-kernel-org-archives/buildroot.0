From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 11:37:23 +0200
Subject: [Buildroot] [git commit] Update for 2021.02.2
Message-ID: <20210512091131.A0B8F87416@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdb3291b8cb8d7fa0d0ba6a164f17a8f8e6323fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 76b4f9e9b658d3a4a72266e4aa2e63aa7a3f54f9)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 4cb218a56f..9f9f5e94ff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -74,6 +74,57 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.2, released May 12th, 2021
+
+	Important / security related fixes.
+
+	Toolchain: Add logic to mark toolchains affected by binutils
+	bug 27597 (Nios II).
+
+	support/scripts/cve.py: Use the (significantly) faster yajl2
+	ijson backend for older (< 2.5) ijson versions rather than the
+	slow python default, speeding up pkg-stats by ~2x.
+
+	CMake infrastructure: Use CMAKE_EXE_LINKER_FLAGS rather than
+	CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility
+	issue with poppler.
+
+	Infrastructure: Expose CONFIG_DIR to post-build/post-image
+	scripts, so they can call the Buildroot Makefile in the
+	correct directory for both in-tree / out-of-tree builds.
+
+	Updated/fixed packages: at91bootstrap, avahi, bash, bind,
+	bridge-utils, boost, cegui, cifs-utils, clamav, cmake,
+	coremark-pro, coreutils, cryptsetup, dmalloc, dnsmasq,
+	docker-cli, docker-engine, domoticz, efl, exim, ffmpeg, flex,
+	gcc, genext2fs, go, gst1-interpipe, haproxy, hostapd,
+	i2c-tools, imx-vpu, kexec, kf5-kcoreaddons, kismet, libcamera,
+	libcurl, libdrm, libfreefare, libfuse3, libgeos, libgpiod,
+	libnpupnp, libopenssl, libp11, librsync, libtomcrypt, libupnp,
+	localedef, lvm2, lxc, m4, makedevs, mender, mesa3d,
+	mesa3d-headers, mkpasswd, mkpimage, modem-manager, monkey,
+	mpd, ncurses, nettle, network-manager, nginx, numactl,
+	openjdk, openjdk-bin, openldap, openvpn, php, pipewire,
+	python-aioconsole, python-asgiref, python-botocore,
+	python-django, python-dnspython, python-flup, python-httplib2,
+	python-markdown2, python-mbrstrdecoder, python3, quickjs,
+	readline, rsyslog, ruby, rust, samba4, sconeserver, snort,
+	sox, systemd, tar, timescaledb, tio, tor, usb_modeswitch,
+	wpa_supplicant, xdriver_xf86-video-ati, xen, xlib_libXaw,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13271: systemd-resolved: /etc/resolv.conf link broken on per-pa..
+	#13551: 2021.02.rc2: Unicode not work on qt 5.15.2
+	#13651: pkg-golang cannot build when main.go is in the root
+	#13661: host-python2 build fails on aarch64
+	#13721: c-stack.c:55:26: error: missing binary operator before ..
+	#13731: Readline Patch is missing Author Information
+	#13741: genext2fs does not allow to set perms of root node
+	#13751: libopenssl (static): huge drop in performance in newer ..
+	#13771: package htop has undeclared dependency on host python
+
 2021.02.1, released April 7, 2021
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 5dd75ad8d7..3c1f55033d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.1'
+RELEASE='2021.02.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
