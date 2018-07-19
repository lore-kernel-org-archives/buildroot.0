From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 00:39:18 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] Update for 2018.05.1
Message-ID: <20180719223434.190C489123@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef26ffddded912570ca3893271e2900aa8b27866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 32 ++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index baa85622ae..d41642b031 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2018.05.1, Released July 20th, 2018
+
+	Important / security related fixes.
+
+	U-Boot: Ensure host version of ncurses is picked up and not
+	host-ncurses built by buildroot, as that otherwise causes
+	widechar/non-widechar conflicts and corrupted menuconfig
+	menus.
+
+	Linux: Enable CONFIG_PERF_EVENTS when perf is enabled.
+
+	Toolchain: ARC tools updated to arc-2018.03.
+
+	pkg-stats: Fix python 3.x compatibility.
+
+	dl-wrapper: Fix support for URIs containing '+', fix
+	no-check-hash for inferred site method.
+
+	Defconfigs: Raspberrypi3: Bump rootfs size, Minnowboard-max:
+	Support ethernet on Turbot variant.
+
+	Updated/fixed packages: audit, bind, btrfs-progs, cifs-utils,
+	clamav, collectd, coreutils, docker-containerd, dos2unix,
+	edid-decode, file, gcc, gdb, gnupg, gnupg2, heimdal, hidapi,
+	imagemagick, libcurl, libgcrypt, libglib2, liblogging,
+	libostree, libressl, libsoup, libv4l, libvncserver, libvorbis,
+	libwebsockets, libxslt, lm-sensors, mariadb, mpg123, ncurses,
+	network-manager, nodejs, patchelf, perl, php-amqp, pinentry,
+	pixiewps, qpdf, qt53d, qt5base, qt5charts, qt5script, redis,
+	systemd, triggerhappy, uboot, wireguard, wireless-regdb,
+	wireshark
+
 2018.05, Released June 1st, 2018
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 9f32c96001..b4cc8956c0 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05
+export BR2_VERSION := 2018.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1527884000
+BR2_VERSION_EPOCH = 1532040000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
