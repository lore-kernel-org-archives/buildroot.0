From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 23:33:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.7
Message-ID: <20201012212410.E1F818F6C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8082db677046e004a6537828b3e4f4b9a818a4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 43 +++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 370becaf20..77e274f5ce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,46 @@
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
diff --git a/Makefile b/Makefile
index 1778ae8671..bf17f52f8a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.6
+export BR2_VERSION := 2020.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1599333000
+BR2_VERSION_EPOCH = 1602538000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index bbb66a5c24..f08806df97 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02'
+RELEASE='2020.02.7'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
