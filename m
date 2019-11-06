From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  6 Nov 2019 21:44:30 +0100
Subject: [Buildroot] [PATCH 1/5] configs/raspberrypi*: bump kernel version
 to 1.20190925-1
Message-ID: <20191106204434.24898-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 4.19.75 (from 4.19.66).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/raspberrypi0_defconfig       |  2 +-
 configs/raspberrypi0w_defconfig      |  2 +-
 configs/raspberrypi2_defconfig       |  2 +-
 configs/raspberrypi3_64_defconfig    |  2 +-
 configs/raspberrypi3_defconfig       |  2 +-
 configs/raspberrypi3_qt5we_defconfig |  2 +-
 configs/raspberrypi4_defconfig       |  2 +-
 configs/raspberrypi_defconfig        |  2 +-
 package/rpi-userland/S94vcfiled      | 47 ----------------------------
 package/rpi-userland/vcfiled.service |  9 ------
 10 files changed, 8 insertions(+), 64 deletions(-)
 delete mode 100644 package/rpi-userland/S94vcfiled
 delete mode 100644 package/rpi-userland/vcfiled.service

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 7255f8d067..1600e219d1 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"

 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 57276aa8f7..ea5856e8c0 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 73f5f349d3..e6c38e74b7 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 61cf730a19..de1cd10c22 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"

 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 744b16dca9..01aa239805 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 7fd834c502..775eb9114e 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index ec29c13804..6eea0ca816 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"

 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 11107c44a9..969a92820e 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y

 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"

 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
deleted file mode 100644
index 4d27b91bae..0000000000
--- a/package/rpi-userland/S94vcfiled
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh
-
-NAME=vcfiled
-DESC="VideoCore file server daemon $NAME"
-DAEMON="/usr/sbin/$NAME"
-DAEMON_ARGS=""
-CFGFILE="/etc/default/$NAME"
-PIDFILE="/var/run/$NAME.pid"
-
-# Read configuration variable file if it is present
-[ -r "$CFGFILE" ] && . "$CFGFILE"
-
-start()
-{
-	printf "Starting $DESC: "
-	start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
-			echo "done" || echo "failed"
-}
-
-stop()
-{
-	printf "Stopping $DESC: "
-	if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
-		# This daemon does not remove its PID file when it exits.
-		rm -f "$PIDFILE"
-		echo "done"
-	else
-		echo "failed"
-	fi
-}
-
-case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		stop
-		start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}" >&2
-		exit 1
-		;;
-esac
diff --git a/package/rpi-userland/vcfiled.service b/package/rpi-userland/vcfiled.service
deleted file mode 100644
index b09aa62774..0000000000
--- a/package/rpi-userland/vcfiled.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=VideoCore file server daemon
-
-[Service]
-ExecStart=/usr/sbin/vcfiled --foreground
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
--
2.23.0
