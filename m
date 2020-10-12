From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 23:58:24 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.7
Message-ID: <20201012214941.5F6328F6BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edeef3a04b977d796a696b7f5acc4f51cfc0672b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d8082db677046e004a6537828b3e4f4b9a818a4f)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8e81edbb69..31542fd972 100644
--- a/CHANGES
+++ b/CHANGES
@@ -504,6 +504,49 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.7, released October 12th, 2020
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
+	Updated/fixed packages: bandwidthd, barebox, bash, bison,
+	brotli, cifs-utils, cryptsetup, dhcpcd, dhcpdump, docker-cli,
+	docker-engine, ecryptfs-utils, efl, fail2ban, freetype, gcc,
+	gdb, ghostscript, gnutls, go, gst1-plugins-base,
+	gst1-plugins-ugly, ipmitool, libhtp, libraw, libssh, libxml2,
+	libxml-parser-perl, localedef, lua, memcached, mesa3d, meson,
+	minidlna, nginx, nodejs, nss-pam-ldapd, openvmtools, php,
+	postgresql, python, python-aenum, python-autobahn,
+	python-engineio, python-fire, python-pymodbus, python-scapy,
+	python-semver, python-sentry-sdk, python-socketio,
+	python-texttable, python-tinyrpc, python-txtorcon, python3,
+	qt5base, runc, samba4, strace, supertux, suricata, systemd,
+	vlc, wayland-protocols, wireguard-linux-compat, wireshark,
+	xserver_xorg-server, zeromq, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12911: usb_modeswitch installation race condition
+	#13251: cryptsetup does not work on branch 2020.02 following..
+
 2020.02.6, released September 5th, 2020
 
 	Important / security related fixes.
