From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2020 22:42:41 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.1
Message-ID: <20200410202919.F13298E301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e565bbebc61bf113bcd3b3475fa27a5127f466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 35 +++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7433147e3c..5b54eb0e35 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2020.02.1, released April 10th, 2020
+
+	Important / security related fixes.
+
+	core: Also fixup /lib references in libtool .la files, similar
+	to how it is done for /usr/*.
+
+	Various fixes for builds with per-package target/host
+	directories.
+
+	toolchain: Fix kernel headers validation check for external
+	toolchains. Fix make 4.3+ compatibility in external toolchain
+	logic.
+
+	fs/initramfs: fix show-info so it also shows the usual
+	rootfs-related variables.
+
+	Updated/fixed packages: arm-trusted-firmware, barebox-aux,
+	bluez5_utils, bubblewrap, busybox, civetweb, cog, collectd,
+	ffmpeg, gcc, gnutls, gssdp, gvfs, haproxy, hiredis, hostapd,
+	kmscube, kodi-screensaver-rsxs, libical, libinput, libexif,
+	libopenssl, libsndfile, linux, linux-tools, llvm, localedef,
+	mcrypt, mesa3d, meson, monit, nftables, ntp, opencv3,
+	oprofile, php, pinentry, polkit, pure-ftpd, python-pyyaml,
+	qt5, quagga, radvd, rcw, redis, rocksdb, samba4, screen,
+	sdbusplus, swupdate, sysdig, sysklogd, syslinux, syslog-ng,
+	tor, tslib, uacme, util-linux, vala, vlc,
+	wireguard-linux-compat, wireguard-tools, wireshark,
+	wpa_supplicant, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12711: host-localedef 2.30-20 fails to compile on fedora 32
+	#12746: "sysdig" package description points to http://sysdig.org, ..
+
 2020.02, released March 8th, 2020
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index c76d4cf70e..ddc1265d0b 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02
+export BR2_VERSION := 2020.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1583701800
+BR2_VERSION_EPOCH = 1586551000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
