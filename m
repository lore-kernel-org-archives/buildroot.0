From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jul 2018 00:24:34 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.4
Message-ID: <20180720222018.0A7B68A294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4eaf7311dfffff7fd753f24ce2d01a6f5188292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f98790154f..9acc9c2e9e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2018.02.4, Released July 21th, 2018
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
+	Defconfigs: Raspberrypi3: Bump rootfs size, Minnowboard-max:
+	Support ethernet on Turbot variant.
+
+	Updated/fixed packages: bind, clamav, collectd, dos2unix,
+	edid-decode, gcc, gdb, heimdal, hidapi, imx-gpu-viv, libcurl,
+	libglib2, liblogging, libostree, libsoup, libv4l, lm-sensors,
+	ncurses, network-manager, patchelf, pinentry, procps-ng, qpdf,
+	qt5, qt53d, qt5base, qt5charts, qt5script, qt5serialport,
+	systemd, wireguard, wireless-regdb
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11101: host-patchelf Endian Issue with relative RPATH
+
 2018.02.3, Released June 18th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index c725f329d4..45194abf99 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.3
+export BR2_VERSION := 2018.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1529344000
+BR2_VERSION_EPOCH = 1532126000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
