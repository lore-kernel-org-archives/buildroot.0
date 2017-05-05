From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  5 May 2017 10:08:06 -0400
Subject: [Buildroot] [PATCH v2 2/4] fix help text wrapping for configs b
In-Reply-To: <20170505140808.17696-1-aduskett@codeblue.com>
References: <20170505140808.17696-1-aduskett@codeblue.com>
Message-ID: <20170505140808.17696-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter b in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2:
  - Added patch to series.

 package/babeld/Config.in       |  4 ++--
 package/batman-adv/Config.in   |  3 ++-
 package/bc/Config.in           |  9 +++++----
 package/bcache-tools/Config.in |  9 +++++----
 package/berkeleydb/Config.in   |  7 ++++---
 package/bind/Config.in         | 15 +++++++++------
 package/biosdevname/Config.in  | 12 ++++++------
 package/bluez5_utils/Config.in |  3 ++-
 package/bluez_utils/Config.in  |  5 +++--
 package/bmon/Config.in         |  4 ++--
 package/bootutils/Config.in    |  8 ++++----
 package/bridge-utils/Config.in |  4 ++--
 package/busybox/Config.in      | 12 +++++++-----
 13 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index 5d08c08..c7010e1 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BABELD
 	bool "babeld"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Babel is a loop-avoiding distance-vector routing protocol for IPv6
-	  and IPv4 with fast convergence properties.
+	  Babel is a loop-avoiding distance-vector routing protocol for
+	  IPv6 and IPv4 with fast convergence properties.
 
 	  http://www.pps.univ-paris-diderot.fr/~jch/software/babel/
diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
index fbef0d8..9d3d796 100644
--- a/package/batman-adv/Config.in
+++ b/package/batman-adv/Config.in
@@ -28,7 +28,8 @@ config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
 	bool "enable B.A.T.M.A.N. V protocol (experimental)"
 	help
 	  Enables B.A.T.M.A.N. V network protocol.
-	  This is the next-gen protocol and is experimental at this time.
+	  This is the next-gen protocol and is experimental at this
+	  time.
 
 	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
 
diff --git a/package/bc/Config.in b/package/bc/Config.in
index a28978d..54c4422 100644
--- a/package/bc/Config.in
+++ b/package/bc/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_BC
 	  areas. It supports interactive execution of statements. 'Bc'
 	  is a utility included in the POSIX P1003.2/D11 draft standard.
 	  This version does not use the historical method of having bc
-	  be a compiler for the dc calculator (the POSIX document doesn't
-	  specify how bc must be implemented). This version has a single
-	  executable that both compiles the language and runs the resulting
-	  'byte code.' The byte code is not the dc language.
+	  be a compiler for the dc calculator (the POSIX document
+	  doesn't specify how bc must be implemented).
+	  This version has a single executable that both compiles the
+	  language and runs the resulting 'byte code.' The byte code is
+	  not the dc language.
 
 	  http://www.gnu.org/software/bc
diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
index 7e6319b..c8e3f6d 100644
--- a/package/bcache-tools/Config.in
+++ b/package/bcache-tools/Config.in
@@ -7,13 +7,14 @@ config BR2_PACKAGE_BCACHE_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  Bcache is a Linux kernel block layer cache. It allows one or
-	  more fast disk drives such as flash-based solid state drives (SSDs)
-	  to act as a cache for one or more slower hard disk drives.
+	  more fast disk drives such as flash-based solid state drives
+	  (SSDs) to act as a cache for one or more slower hard disk
+	  drives.
 
 	  http://bcache.evilpiepirate.org/
 
-	  This is the user space bcache tools, required to setup the linux
-	  bcache feature of the Linux kernel.
+	  This is the user space bcache tools, required to setup the
+	  linux bcache feature of the Linux kernel.
 
 comment "bcache-tools needs udev /dev management"
 	depends on BR2_USE_MMU
diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
index 5531b04..f32d13a 100644
--- a/package/berkeleydb/Config.in
+++ b/package/berkeleydb/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_BERKELEYDB
 	bool "berkeleydb"
 	help
-	  The Berkeley database. A very common library for database
-	  applications.
+	  The Berkeley database. A very common library for
+	  database applications.
 
 	  http://www.sleepycat.com/products/db.shtml
 
@@ -16,6 +16,7 @@ config BR2_PACKAGE_BERKELEYDB_COMPAT185
 config BR2_PACKAGE_BERKELEYDB_TOOLS
 	bool "install tools"
 	help
-	  Install berkeleydb tools, mostly useful for debugging purposes.
+	  Install berkeleydb tools, mostly useful for debugging
+	  purposes.
 
 endif
diff --git a/package/bind/Config.in b/package/bind/Config.in
index a580f0e..049a90c 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -4,14 +4,16 @@ config BR2_PACKAGE_BIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
-	  BIND (Berkeley Internet Name Domain) is an implementation of
-	  the Domain Name System (DNS) protocols and provides an openly
-	  redistributable reference implementation of the major
-	  components of the Domain Name System, including:
+	  BIND (Berkeley Internet Name Domain) is an
+	  implementation of the Domain Name System (DNS) protocols
+	  and provides an openly redistributable reference
+	  implementation of the major components of the Domain
+	  Name System, including:
 
 	    * a Domain Name System server (named)
 	    * a Domain Name System resolver library
-	    * tools for verifying the proper operation of the DNS server
+	    * tools for verifying the proper operation of the DNS
+	      server
 
 	  The BIND DNS Server is used on the vast majority of name
 	  serving machines on the Internet, providing a robust and
@@ -19,7 +21,8 @@ config BR2_PACKAGE_BIND
 	  architecture can be built. The resolver library included in
 	  the BIND distribution provides the standard APIs for
 	  translation between domain names and Internet addresses and is
-	  intended to be linked with applications requiring name service.
+	  intended to be linked with applications requiring name
+	  service.
 
 	  http://www.isc.org/sw/bind/
 
diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
index f9202ac..7047167 100644
--- a/package/biosdevname/Config.in
+++ b/package/biosdevname/Config.in
@@ -5,11 +5,11 @@ config BR2_PACKAGE_BIOSDEVNAME
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_ZLIB
 	help
-	  Biosdevname is a udev helper that looks at various BIOS tables to
-	  figure out what the actual hardware names are for Ethernet ports
-	  and renames the ports accordingly. This has the advantage of
-	  always referring to the same port regardless of system or
-	  hardware changes that might otherwise alter the typical ethX
-	  naming.
+	  Biosdevname is a udev helper that looks at various BIOS tables
+	  to figure out what the actual hardware names are for Ethernet
+	  ports and renames the ports accordingly. This has the
+	  advantage of always referring to the same port regardless of
+	  system or hardware changes that might otherwise alter the
+	  typical ethX naming.
 
 	  http://linux.dell.com/biosdevname/
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index bdb6682..615dc6d 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -87,7 +87,8 @@ config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
-	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock controller)
+	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock
+	  controller)
 
 comment "sixaxis plugin needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 3848162..ea44068 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -36,8 +36,9 @@ config BR2_PACKAGE_BLUEZ_UTILS_GATT
 	bool "GATT support"
 	select BR2_PACKAGE_READLINE
 	help
-	  Generic Attribute Profile (GATT) support. This provides profile
-	  discovery and description services for Bluetooth Low Energy.
+	  Generic Attribute Profile (GATT) support. This provides
+	  profile discovery and description services for Bluetooth Low
+	  Energy.
 	  This will install the gatttool utility.
 endif
 
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index bb79693..cb83cc2 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_BMON
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_NCURSES
 	help
-	  bmon is a bandwidth monitor capable of retrieving statistics from
-	  various input modules. It provides various output methods
+	  bmon is a bandwidth monitor capable of retrieving statistics
+	  from various input modules. It provides various output methods
 	  including a curses based interface.
 
 	  https://github.com/tgraf/bmon/
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index af4a170..30d647a 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  BootUtils is a collection of utilities to facilitate booting of
-	  Linux 2.6-based systems. The process of finding the root volume
-	  either by label or explicit label= on the kernel command line,
-	  mounting it, and 'switchroot'ing is automated.
+	  BootUtils is a collection of utilities to facilitate booting
+	  of Linux 2.6-based systems. The process of finding the root
+	  volume either by label or explicit label= on the kernel
+	  command line, mounting it, and 'switchroot'ing is automated.
 
 	  http://bootutils.sourceforge.net/
diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index fb9c7df..bc614b0 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BRIDGE_UTILS
 	bool "bridge-utils"
 	help
-	  Manage ethernet bridging; a way to connect networks together to
-	  form a larger network.
+	  Manage ethernet bridging; a way to connect networks together
+	  to form a larger network.
 
 	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7eb7eb9..116a72e 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
 	help
-	  The Swiss Army Knife of embedded Linux. It slices, it dices, it
-	  makes Julian Fries.
+	  The Swiss Army Knife of embedded Linux. It slices, it dices,
+	  it makes Julian Fries.
 
 	  http://busybox.net/
 
@@ -15,10 +15,12 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	default "package/busybox/busybox.config"
 	help
-	  Some people may wish to use their own modified BusyBox configuration
-	  file, and will specify their config file location with this option.
+	  Some people may wish to use their own modified BusyBox
+	  configuration file, and will specify their config file
+	  location with this option.
 
-	  Most people will just use the default BusyBox configuration file.
+	  Most people will just use the default BusyBox configuration
+	  file.
 
 config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
 	string "Additional BusyBox configuration fragment files"
-- 
2.9.3
