From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:09:20 +0200
Subject: [Buildroot] [git commit] package/g*: fix wrapping of Config.in help
	text
Message-ID: <20170731170652.7FDCD7FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be9d731edf6d5fbd138c4fb4cc09d0fa6ae2d147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter g in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/Config.in                         |  4 ++--
 package/gdbm/Config.in                         |  4 ++--
 package/genpart/Config.in                      |  6 +++---
 package/genpart/Config.in.host                 |  6 +++---
 package/ghostscript-fonts/Config.in            |  6 +++---
 package/git/Config.in                          |  5 +++--
 package/gnuchess/Config.in                     |  3 ++-
 package/gnutls/Config.in                       |  3 ++-
 package/google-material-design-icons/Config.in |  4 ++--
 package/gpm/Config.in                          | 10 +++++-----
 package/gpsd/Config.in                         |  9 +++++----
 package/gptfdisk/Config.in                     | 18 ++++++++++--------
 package/gssdp/Config.in                        |  3 ++-
 package/gtkperf/Config.in                      |  4 ++--
 package/gupnp-av/Config.in                     |  4 ++--
 15 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 36e70eb..a065243 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_GAWK
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  A special-purpose programming language which is data driven
-	  rather than procedural. Allows for simple data-reformatting jobs
-	  with just a few lines of code.
+	  rather than procedural. Allows for simple data-reformatting
+	  jobs with just a few lines of code.
 
 	  http://www.gnu.org/software/gawk/
 
diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index 8ad0fc6..3646bd0 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GDBM
 	bool "gdbm"
 	help
-	  GNU dbm is a set of database routines that use extensible hashing.
-	  It works similar to the standard UNIX dbm routines.
+	  GNU dbm is a set of database routines that use extensible
+	  hashing. It works similar to the standard UNIX dbm routines.
 
 	  http://www.gnu.org/software/gdbm/gdbm.html
diff --git a/package/genpart/Config.in b/package/genpart/Config.in
index 8d9ec79..6428845 100644
--- a/package/genpart/Config.in
+++ b/package/genpart/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GENPART
 	bool "genpart"
 	help
-	  Generate a 16 byte partition table entry defined by command line
-	  arguments and dump it to stdout. No CHS magic is done, only lba
-	  entries are filled out.
+	  Generate a 16 byte partition table entry defined by command
+	  line arguments and dump it to stdout. No CHS magic is done,
+	  only lba entries are filled out.
 
 	  http://www.pengutronix.de/software/genpart/index_en.html
diff --git a/package/genpart/Config.in.host b/package/genpart/Config.in.host
index 6cc2a59..d8b9eb6 100644
--- a/package/genpart/Config.in.host
+++ b/package/genpart/Config.in.host
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_GENPART
 	bool "host genpart"
 	help
-	  Generate a 16 byte partition table entry defined by command line
-	  arguments and dump it to stdout. No CHS magic is done, only lba
-	  entries are filled out.
+	  Generate a 16 byte partition table entry defined by command
+	  line arguments and dump it to stdout. No CHS magic is done,
+	  only lba entries are filled out.
 
 	  http://www.pengutronix.de/software/genpart/index_en.html
diff --git a/package/ghostscript-fonts/Config.in b/package/ghostscript-fonts/Config.in
index 80bfbd0..9b9b8d0 100644
--- a/package/ghostscript-fonts/Config.in
+++ b/package/ghostscript-fonts/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GHOSTSCRIPT_FONTS
 	bool "ghostscript-fonts"
 	help
-	  Fonts and font metrics customarily distributed with Ghostscript.
-	  Currently includes the 35 standard PostScript fonts and a
-	  grab-bag of others.
+	  Fonts and font metrics customarily distributed with
+	  Ghostscript. Currently includes the 35 standard PostScript
+	  fonts and a grab-bag of others.
 
 	  http://sourceforge.net/projects/gs-fonts
diff --git a/package/git/Config.in b/package/git/Config.in
index 9babbec..d53921d 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_GIT
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  Git is a free and open source distributed version control system
-	  designed to handle everything from small to very large projects.
+	  Git is a free and open source distributed version control
+	  system designed to handle everything from small to very large
+	  projects.
 
 	  http://git-scm.com
diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
index aa446f4..0ddd288 100644
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_GNUCHESS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FLEX
 	help
-	  GNU Chess lets most modern computers play a full game of chess.
+	  GNU Chess lets most modern computers play a full game of
+	  chess.
 
 	  http://ftp.gnu.org/pub/gnu/chess
 
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 1db069c..176951a 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -20,7 +20,8 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 	select BR2_PACKAGE_ARGP_STANDALONE \
 		if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
-	  Install GnuTLS command line tools for various cryptographic tasks.
+	  Install GnuTLS command line tools for various cryptographic
+	  tasks.
 
 endif
 
diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
index a200429..775f258 100644
--- a/package/google-material-design-icons/Config.in
+++ b/package/google-material-design-icons/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons"
 	help
-	  Material design icons are the official icon set from Google that
-	  are designed under the material design guidelines.
+	  Material design icons are the official icon set from Google
+	  that are designed under the material design guidelines.
 
 	  https://github.com/google/material-design-icons
 
diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 2d0d366..1158479 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -3,11 +3,11 @@ config BR2_PACKAGE_GPM
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	help
-	  "gpm" means general purpose mouse (server) and provides mouse support
-	  for Linux virtual consoles.
-	  gpm-root (to draw menus in current virtual console; config file in
-	  /etc/gpm-root.conf) and disable-paste (to disable paste buffer for
-	  security reasons), will also be installed.
+	  "gpm" means general purpose mouse (server) and provides mouse
+	  support for Linux virtual consoles.
+	  gpm-root (to draw menus in current virtual console; config
+	  file in /etc/gpm-root.conf) and disable-paste (to disable
+	  paste buffer for security reasons), will also be installed.
 
 	  http://www.nico.schottelius.org/software/gpm/
 
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 876ab9b..68d3e2e 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -10,10 +10,11 @@ menuconfig BR2_PACKAGE_GPSD
 	# Always tries to build a shared library
 	depends on !BR2_STATIC_LIBS
 	help
-	  gpsd is a service daemon that monitors one or more GPSes or AIS
-	  receivers attached to a host computer through serial or USB ports,
-	  making all data on the location/course/velocity of the sensors
-	  available to be queried on TCP port 2947 of the host computer.
+	  gpsd is a service daemon that monitors one or more GPSes or
+	  AIS receivers attached to a host computer through serial or
+	  USB ports, making all data on the location/course/velocity of
+	  the sensors available to be queried on TCP port 2947 of the
+	  host computer.
 
 	  The D-Bus interface is included if dbus-glib is enabled.
 
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index d243b90..ede72f3 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -10,9 +10,10 @@ config BR2_PACKAGE_GPTFDISK
 		!(BR2_PACKAGE_GPTFDISK_SGDISK || BR2_PACKAGE_GPTFDISK_CGDISK)
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
-	  text-mode partitioning tool that works on Globally Unique Identifier
-	  (GUID) Partition Table (GPT) disks, rather than on the more common
-	  (through 2010) Master Boot Record (MBR) partition tables.
+	  text-mode partitioning tool that works on Globally Unique
+	  Identifier (GUID) Partition Table (GPT) disks, rather than on
+	  the more common (through 2010) Master Boot Record (MBR)
+	  partition tables.
 
 	  http://www.rodsbooks.com/gdisk/
 
@@ -22,16 +23,17 @@ config BR2_PACKAGE_GPTFDISK_GDISK
 	bool "interactive gdisk"
 	help
 	  Install the interactive GUID partition table (GPT) manipulator
-	  /usr/sbin/gdisk which is modelled after and quite similar in use
-	  to the traditional MBR based fdisk tool.
+	  /usr/sbin/gdisk which is modelled after and quite similar in
+	  use to the traditional MBR based fdisk tool.
 
 config BR2_PACKAGE_GPTFDISK_SGDISK
 	bool "command line sgdisk"
 	select BR2_PACKAGE_POPT
 	help
-	  Install the command-line GUID partition table (GPT) manipulator
-	  /usr/sbin/sgdisk which is named after the traditional MBR based
-	  sfdisk tool albeit with an entirely different option syntax.
+	  Install the command-line GUID partition table (GPT)
+	  manipulator /usr/sbin/sgdisk which is named after the
+	  traditional MBR based sfdisk tool albeit with an entirely
+	  different option syntax.
 
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
index 8314971..80c5edf 100644
--- a/package/gssdp/Config.in
+++ b/package/gssdp/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_GSSDP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSOUP
 	help
-	  GSSDP implements resource discovery and announcement over SSDP.
+	  GSSDP implements resource discovery and announcement over
+	  SSDP.
 
 	  http://www.gupnp.org
 
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
index 1089dbf..78c35e7 100644
--- a/package/gtkperf/Config.in
+++ b/package/gtkperf/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_GTKPERF
 	  GtkPerf is an application designed to test GTK+ performance.
 	  The point is to create common testing platform to run
 	  predefined GTK+ widgets
-	  e.g. (opening comboboxes, toggling buttons, scrolling text yms.)
-	  and this way define the speed of device/platform.
+	  e.g. (opening comboboxes, toggling buttons, scrolling text
+	  yms.) and this way define the speed of device/platform.
diff --git a/package/gupnp-av/Config.in b/package/gupnp-av/Config.in
index 5320b82..7b618f5 100644
--- a/package/gupnp-av/Config.in
+++ b/package/gupnp-av/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_GUPNP_AV
 	select BR2_PACKAGE_GUPNP
 	select BR2_PACKAGE_LIBXML2
 	help
-	  GUPnP-AV is a collection of helpers for building AV (audio/video)
-	  applications using GUPnP.
+	  GUPnP-AV is a collection of helpers for building AV
+	  (audio/video) applications using GUPnP.
 
 	  http://www.gupnp.org/
 
