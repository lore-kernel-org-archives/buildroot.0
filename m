From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:09:34 +0200
Subject: [Buildroot] [git commit] package/i*: fix wrapping of Config.in help
	text
Message-ID: <20170731170652.9846C7FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0b45144c3001593869fc5dfb12f1a119b960ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter i in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/Config.in        |  6 +++---
 package/iftop/Config.in            |  7 ++++---
 package/ifupdown-scripts/Config.in |  4 ++--
 package/imagemagick/Config.in      | 13 +++++++------
 package/inotify-tools/Config.in    |  4 ++--
 package/iozone/Config.in           |  3 ++-
 package/iperf3/Config.in           |  8 ++++----
 package/ipmitool/Config.in         | 13 +++++++------
 package/iptraf-ng/Config.in        |  9 +++++----
 9 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 82ee334..d9b8dd9 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_I2C_TOOLS
 	help
 	  Heterogeneous set of I2C tools for Linux
 
-	  This package contains a heterogeneous set of I2C tools for Linux:
-	  a bus probing tool, a chip dumper, register-level access helpers,
-	  EEPROM decoding scripts, and more.
+	  This package contains a heterogeneous set of I2C tools for
+	  Linux: a bus probing tool, a chip dumper, register-level
+	  access helpers, EEPROM decoding scripts, and more.
 
 	  https://i2c.wiki.kernel.org/index.php/I2C_Tools
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
index f80a831..514101c 100644
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -5,9 +5,10 @@ config BR2_PACKAGE_IFTOP
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  iftop does for network usage what top(1) does for CPU usage.
-	  It listens to network traffic on a named interface and displays
-	  a table of current bandwidth usage by pairs of hosts. Handy for
-	  answering the question "why is our ADSL link so slow?".
+	  It listens to network traffic on a named interface and
+	  displays a table of current bandwidth usage by pairs of hosts.
+	  Handy for answering the question "why is our ADSL link so
+	  slow?".
 
 	  http://www.ex-parrot.com/pdw/iftop/
 
diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 7064d58..9cd0395 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
 	default y if BR2_ROOTFS_SKELETON_DEFAULT
 	help
-	  Set of scripts used by ifupdown (either the standalone one, or the
-	  busybox one) to bring network up, or tear it down.
+	  Set of scripts used by ifupdown (either the standalone one,
+	  or the busybox one) to bring network up, or tear it down.
diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index 0bd4df2..4bd81db 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -3,12 +3,13 @@ config BR2_PACKAGE_IMAGEMAGICK
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  ImageMagick(R) is a software suite to create, edit, and compose
-	  bitmap images. It can read, convert and write images in a variety of
-	  formats (about 100) including DPX, EXR, GIF, JPEG, JPEG-2000, PDF,
-	  PhotoCD, PNG, Postscript, SVG, and TIFF. Use ImageMagick to
-	  translate, flip, mirror, rotate, scale, shear and transform images,
-	  adjust image colors, apply various special effects, or draw text,
+	  ImageMagick(R) is a software suite to create, edit, and
+	  compose bitmap images. It can read, convert and write images
+	  in a variety of formats (about 100) including DPX, EXR, GIF,
+	  JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF.
+	  Use ImageMagick to translate, flip, mirror, rotate, scale,
+	  shear and transform images, adjust image colors, apply various
+	  special effects, or draw text,
 	  lines, polygons, ellipses and B??zier curves.
 
 	  http://www.imagemagick.org/
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index df440d5..1ca01b6 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 	  inotify-tools is a C library and a set of command-line
 	  programs for Linux providing a simple interface to inotify.
 	  These programs can be used to monitor and act upon
-	  filesystem events. Provides the 'inotifywait' and 'inotifywatch'
-	  binaries.
+	  filesystem events. Provides the 'inotifywait' and
+	  'inotifywatch' binaries.
 
 	  https://github.com/rvoicilas/inotify-tools
diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 33c938e..c66def2 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_IOZONE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  IOzone is a filesystem benchmark tool.
-	  The benchmark generates and measures a variety of file operations
+	  The benchmark generates and measures a variety of file
+	  operations
 
 	  http://www.iozone.org/
 
diff --git a/package/iperf3/Config.in b/package/iperf3/Config.in
index 074c1d3..5b2204c 100644
--- a/package/iperf3/Config.in
+++ b/package/iperf3/Config.in
@@ -5,10 +5,10 @@ config BR2_PACKAGE_IPERF3
 	  iperf is a tool for active measurements of the maximum
 	  achievable bandwidth on IP networks.
 	  It supports tuning of various parameters related to timing,
-	  protocols, and buffers. For each test it reports the bandwidth,
-	  loss, and other parameters.
-	  It's a redesign of the NLANR/DAST iperf(2) and is not
-	  backward compatible.
+	  protocols, and buffers. For each test it reports the
+	  bandwidth, loss, and other parameters.
+	  It's a redesign of the NLANR/DAST iperf(2) and is not backward
+	  compatible.
 
 	  http://software.es.net/iperf/index.html
 
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 554a12c..826bc09 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_IPMITOOL
 	bool "ipmitool"
 	depends on BR2_USE_MMU # fork()
 	help
-	  IPMItool provides a simple command-line interface to IPMI-enabled devices.
+	  IPMItool provides a simple command-line interface to
+	  IPMI-enabled devices.
 
 	  http://sourceforge.net/projects/ipmitool/
 
@@ -12,11 +13,11 @@ config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
 	select BR2_PACKAGE_OPENSSL
 	help
-	  Enables the IPMI v2.0 RMCP+ LAN interface typically used to send IPMI
-	  commands to the BMC of a remote server.
-	  Not needed if you only want to communicate with the local BMC of your
-	  device using the OpenIPMI ipmi_si kernel module, or if using the
-	  legacy IPMI v1.5 RMCP LAN interface.
+	  Enables the IPMI v2.0 RMCP+ LAN interface typically used to
+	  send IPMI commands to the BMC of a remote server.
+	  Not needed if you only want to communicate with the local BMC
+	  of your device using the OpenIPMI ipmi_si kernel module, or if
+	  using the legacy IPMI v1.5 RMCP LAN interface.
 
 config BR2_PACKAGE_IPMITOOL_USB
 	bool "enable usb interface"
diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index 5afb81d..5c3b484 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -3,10 +3,11 @@ config BR2_PACKAGE_IPTRAF_NG
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
-	  IPTraf-ng is a ncurses-based network monitoring utility. It gathers
-	  data like TCP connection packet and byte counts, interface statistics
-	  and activity indicators.
+	  IPTraf-ng is a ncurses-based network monitoring utility. It
+	  gathers data like TCP connection packet and byte counts,
+	  interface statistics and activity indicators.
 
 	  https://fedorahosted.org/iptraf-ng/
 
-	  IPTraf-ng is a fork of original IPTraf v3.0.0 (http://iptraf.seul.org).
+	  IPTraf-ng is a fork of original IPTraf v3.0.0
+	  (http://iptraf.seul.org).
