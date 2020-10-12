From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 14:55:06 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] Update for 2020.08.1
Message-ID: <20201012124432.D849C86E51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91107e16a7c2fcbd0b1b73e5a46d295fd9190d17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index fc51a0d0c9..570be1f7dc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,63 @@
+2020.08.1, released October 12th, 2020
+
+	Important / security related fixes.
+
+	Fixes for various compilation issues with GCC 10.x.
+
+	meson: Correct SDK cross-compilation.conf file when
+	per-package builds were used to build SDK.
+
+	systemd: Use /run rather than /var/run for PID files in units.
+
+	Toolchain: use Secure-PLT rather than BSS-PLT for PowerPC 32.
+
+	Fakeroot scripts (BR2_ROOTFS_POST_FAKEROOT_SCRIPT) are now run
+	after all finalization hooks (including pre-rootfs) to ensure
+	they can override any late configuration done by packages.
+
+	support/script/pycompile: Rework logic to ensure .pyc files
+	contain absolute target paths, fixing code inspection at
+	runtime when executed with cwd != '/'.
+
+	support/scripts/setlocalversion: Correct Mercurial output to
+	match behaviour with Git.
+
+	support/scripts/apply-patches.sh: Use patch
+	--no-backup-if-mismatch, so we no longer blindly have to
+	remove *.orig files after patching, fixing issues with
+	packages containing such files.
+
+	fs/jffs2: Now correcly handle xattrs
+
+	Updated/fixed packages: acpica, afboot-stm32, alsa-utils,
+	apparmor, bandwidthd, barebox, bash, bison, brotli,
+	cifs-utils, cups, dhcpcd, dhcpdump, docker-cli, docker-engine,
+	ecryptfs-utils, efl, fail2ban, fbterm, ffmpeg, fontconfig,
+	freetype, gcc, gdb, ghostscript, gnupg2, gnutls, go, gqview,
+	gst1-plugins-base, gst1-plugins-ugly, ipmitool, jbig2dec,
+	kexec, lcdproc, libcamera, libhtp, libnetconf2, libraw,
+	libssh, libxml2, libxml-parser-perl, libzip, linux-headers,
+	live555, localedef, ltp-testsuite, lua, matchbox, memcached,
+	memtester, mesa3d, meson, minidlna, mongodb, mongrel2, motion,
+	mraa, mtd, musepack, neardal, netatalk, netperf, netsniff-ng,
+	nginx, nodejs, nss-pam-ldapd, open-plc-utils, openswan,
+	opentyrian, openvmtools, php, postgresql, python,
+	python-aenum, python-cycler, python-engineio, python-fire,
+	python-pymodbus, python-scapy, python-semver,
+	python-sentry-sdk, python-socketio, python-texttable,
+	python-tinyrpc, python-txtorcon, python3, qt5base, quagga,
+	read-edid, redis, rsh-redone, runc, samba4, socketcand,
+	strace, supertux, suricata, systemd, ti-utils, trinity,
+	uclibc, usb_modeswitch, vlc, vsftpd, wampcc,
+	wayland-protocols, wireguard-linux-compat, wireshark, wlroots,
+	wolfssl, w_scan, xerces, xfsprogs, xdriver-xf86-video-ati,
+	xserver_xorg-server, ympd, zeromq, zlib-ng, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12911: usb_modeswitch installation race condition
+	#13236: Can't compile linux 5.4.8 (with gcc 10 on host)
+
 2020.08, released September 1st, 2020
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index a6b99d0868..4ebf671af2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08
+export BR2_VERSION := 2020.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1598992000
+BR2_VERSION_EPOCH = 1602507000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
