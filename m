From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 23:05:39 +0200
Subject: [Buildroot] [git commit] Update for 2020.05.3
Message-ID: <20201012205853.A4DF18AC05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d41e799c45d3c7101e714ebfb111b98d4e7dbf60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0269b2e6e224bd0ca04e4f25ccef86809108df0c)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/CHANGES b/CHANGES
index 31a9d1aede..8e81edbb69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -188,6 +188,57 @@
 	#13081: host-e2fsprogs attempts to create udev  rules.d on build host if not exists
 	#13101: BR audit2allow support
 
+2020.05.3, released October 12th, 2020
+
+	Important / security related fixes.
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
+	Updated/fixed packages: alsa-utils, apparmor, avahi,
+	bandwidthd, barebox, bash, bison, brotli, busybox, cifs-utils,
+	cryptsetup, cups, dhcpcd, dhcpdump, docker-cli, docker-engine,
+	ecryptfs-utils, efl, fail2ban, freetype, gcc, gdb,
+	ghostscript, gnutls, go, graphite2, gst1-plugins-base,
+	gst1-plugins-ugly, imagemagick, ipmitool, jbig2dec, libhtp,
+	libraw, libssh, libxml2, libxml-parser-perl, linux-headers,
+	localedef, lua, mbedtls, memcached, mesa3d, meson, minidlna,
+	mongodb, nginx, nodejs, nss-pam-ldapd, openvmtools,
+	paho-mqtt-c, php, postgresql, python, python-aenum,
+	python-django, python-engineio, python-fire, python-pymodbus,
+	python-scapy, python-semver, python-sentry-sdk,
+	python-socketio, python-texttable, python-tinyrpc,
+	python-txtorcon, python3, qt5base, rsh-redone, runc, samba4,
+	strace, supertux, suricata, systemd, uclibc, usb_modeswitch,
+	vlc, vsftpd, wayland-protocols, wireguard-linux-compat,
+	wireshark, wlroots, wolfssl, xserver_xorg-server, ympd,
+	zeromq, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12911: usb_modeswitch installation race condition
+	#13251: cryptsetup does not work on branch 2020.02 following..
+
 2020.05.2, released August 29th, 2020
 
 	Important / security related fixes.
