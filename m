From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 23:13:14 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] Update for 2020.08.2
Message-ID: <20201116215959.6132286724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a90d87d331aa440cd024c7269a0673d94792896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 27 +++++++++++++++++++++++++++
 Makefile |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 570be1f7dc..ffe98aa294 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,30 @@
+2020.08.2, released November 16th, 2020
+
+	Important / security related fixes.
+
+	Toolchain-wrapper: Pass -fno-tree-loop-distribute-patterns to
+	fix kernel build on microblaze with gcc 10.x when
+	optimizations are enabled.
+
+	Updated/fixed packages: apparmor, argp-standalone, asterisk,
+	bandwidthd, binutils, bitcoin, busybox, collectd, cryptsetup,
+	cups-filters, darkhttpd, davfs2, dvb-apps, docker-cli,
+	docker-containerd, docker-engine, dovecot-pigeonhole, elf2flt,
+	fastd, fbset, fbtft, freetype, gcc, ghostscript, grpc,
+	gst1-plugins-bad, jsoncpp, kernel-module-imx-gpu-viv,
+	keepalived, kmscube, libass, libexif, libiqrf,
+	libnetfilter_conntrack, libpam-tacplus, libraw,
+	linux-backports, linux-firmware, lzlib, mp4v2, netsnmp, nginx,
+	numactl, oniguruma, opencv3, openntpd, patchelf, php,
+	pistache, postgresql, python-pyqt5, qemu, qt5base, rauc,
+	redis, samba4, slirp, systemd, tcpdump, tinyproxy, tmux, tor,
+	waf, webkitgtk, wine, wireguard-linux-compat, wireshark,
+	wpewebkit, xen, xorriso, xvisor, zeromq, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11931: Bugs in support/scripts/apply-patches.sh
+
 2020.08.1, released October 12th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4ebf671af2..5a2fad5a05 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08.1
+export BR2_VERSION := 2020.08.2
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1602507000
 
