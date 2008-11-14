From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 04:59:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio database
	editors games java
Message-ID: <20081114125914.907203C8D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 04:59:14 -0800 (Fri, 14 Nov 2008)
New Revision: 24039

Log:
package: Kconfig: use menu instead of menuconfig for sub menus

As discussed on the list - These things should normally not be
(un)selectable.

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/audio/Config.in
   trunk/buildroot/package/database/Config.in
   trunk/buildroot/package/editors/Config.in
   trunk/buildroot/package/games/Config.in
   trunk/buildroot/package/java/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -26,15 +26,6 @@
 source "package/tar/Config.in"
 endif
 
-#menuconfig BR2_APPLICATION_SUPPORT
-#	bool "Common Applications"
-#	default y
-#	help
-#	  A set of applications, utilities and libraries for
-#	  text processing, toolchain generation and other things.
-
-
-#if BR2_APPLICATION_SUPPORT
 comment "Other development stuff"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
@@ -130,13 +121,8 @@
 
 endif
 
-menuconfig BR2_NETWORK_SUPPORT
-	bool "Networking"
-	default y
-	help
-	  Support for communication, networking and related packages
+menu "Networking"
 
-if BR2_NETWORK_SUPPORT
 comment "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
@@ -229,16 +215,9 @@
 endif
 source "package/wireless-tools/Config.in"
 
-endif
+endmenu
 
-menuconfig BR2_BLOCKDEV_SUPPORT
-	bool "Hardware handling / blockdevices and filesystem maintenance"
-	default y
-	help
-	  Support for hardware handling and maintenance, block devices,
-	  filesystem creation and maintenance.
-
-if BR2_BLOCKDEV_SUPPORT
+menu "Hardware handling / blockdevices and filesystem maintenance"
 source "package/acpid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
@@ -287,19 +266,12 @@
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
 source "package/xfsprogs/Config.in"
-endif
+endmenu
 
 # Audio support
 source "package/audio/Config.in"
 
-menuconfig BR2_GRAPHIC_SUPPORT
-	bool "Graphic libraries and applications (graphic/text)"
-	default y
-	help
-	  Support for graphic libraries, X Window system and related
-	  packages, graphical toolkits, etc.
-
-if BR2_GRAPHIC_SUPPORT
+menu "Graphic libraries and applications (graphic/text)"
 comment "text rendering libraries"
 source "package/ncurses/Config.in"
 source "package/newt/Config.in"
@@ -413,65 +385,45 @@
 comment "Video libraries/codecs and applications"
 source "package/mplayer/Config.in"
 source "package/vlc/Config.in"
-endif
+endmenu
 
-menuconfig BR2_COMPRESSOR_SUPPORT
-	bool "Compressors / decompressors"
-	default y
-	help
-	  Support for compressors and decompressors like lzo, lzma, bzip2
+menu "Compressors / decompressors"
 
-if BR2_COMPRESSOR_SUPPORT
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/lzo/Config.in"
 source "package/lzma/Config.in"
 source "package/zlib/Config.in"
-endif
+endmenu
 
-menuconfig BR2_PACKAGEMGRS_SUPPORT
-	bool "Package managers"
-	default y
-	help
-	  Support for package managers like rpm, portage, ipkg, ..
+menu "Package managers"
 
-if BR2_PACKAGEMGRS_SUPPORT
 source "package/ipkg/Config.in"
 source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/rpm/Config.in"
 endif
-endif
+endmenu
 
-menuconfig BR2_SCRIPTING_SUPPORT
-	bool "Interpreter languages / Scripting"
-	default y
-	help
-	  Support for scripting languages, interpreter languages.
+menu "Interpreter languages / Scripting"
 
-if BR2_SCRIPTING_SUPPORT
 source "package/lua/Config.in"
 source "package/microperl/Config.in"
 source "package/python/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 source "package/php/Config.in"
-endif
+endmenu
 
-menuconfig BR2_XML_SUPPORT
-	bool "XML handling"
-	default y
-	help
-	  Support for XML handling
+menu "XML handling"
 
-if BR2_XML_SUPPORT
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/xerces/Config.in"
-endif
+endmenu
 
 # java support
 source "package/java/Config.in"

Modified: trunk/buildroot/package/audio/Config.in
===================================================================
--- trunk/buildroot/package/audio/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/audio/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -1,10 +1,4 @@
-menuconfig BR2_AUDIO_SUPPORT
-	bool "Audio libraries and applications"
-	default y
-	help
-	  Support for audio libraries and applications
-
-if BR2_AUDIO_SUPPORT
+menu "Audio libraries and applications"
 source "package/audio/alsa-lib/Config.in"
 source "package/audio/alsa-utils/Config.in"
 source "package/audio/asterisk/Config.in"
@@ -18,4 +12,4 @@
 source "package/audio/mpg123/Config.in"
 source "package/audio/speex/Config.in"
 source "package/audio/festival/Config.in"
-endif
+endmenu

Modified: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/database/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -1,8 +1,4 @@
-menuconfig BR2_DATABASE_SUPPORT
-	bool "Database"
-	default y
-
-if BR2_DATABASE_SUPPORT
+menu "Database"
 source "package/database/mysql_client/Config.in"
 source "package/database/sqlite/Config.in"
-endif
+endmenu

Modified: trunk/buildroot/package/editors/Config.in
===================================================================
--- trunk/buildroot/package/editors/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/editors/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -1,12 +1,6 @@
-menuconfig BR2_TEXTEDIT_SUPPORT
-	bool "Text editors"
-	default y
-	help
-	  Support for text editors
-
-if BR2_TEXTEDIT_SUPPORT
+menu "Text editors"
 source "package/editors/ed/Config.in"
 source "package/editors/nano/Config.in"
 source "package/editors/uemacs/Config.in"
 source "package/editors/vim/Config.in"
-endif
+endmenu

Modified: trunk/buildroot/package/games/Config.in
===================================================================
--- trunk/buildroot/package/games/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/games/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -1,10 +1,4 @@
-menuconfig BR2_GAMES
-	bool "Games"
-	default y
-	help
-	  Support for games
-
-if BR2_GAMES
+menu "Games"
 source "package/games/ace_of_penguins/Config.in"
 source "package/games/doom-wad/Config.in"
 source "package/games/gnuchess/Config.in"
@@ -14,4 +8,4 @@
 source "package/games/rubix/Config.in"
 source "package/games/vice/Config.in"
 source "package/games/xboard/Config.in"
-endif
+endmenu

Modified: trunk/buildroot/package/java/Config.in
===================================================================
--- trunk/buildroot/package/java/Config.in	2008-11-14 11:06:01 UTC (rev 24038)
+++ trunk/buildroot/package/java/Config.in	2008-11-14 12:59:14 UTC (rev 24039)
@@ -1,11 +1,5 @@
-menuconfig BR2_JAVA_SUPPORT
-        bool "Java"
-        default y
-        help
-          Support java programs (classpath, vm, osgi)
-
-if BR2_JAVA_SUPPORT
+menu "Java"
 source "package/java/classpath/Config.in"
 source "package/java/jamvm/Config.in"
 source "package/java/concierge/Config.in"
-endif
+endmenu
