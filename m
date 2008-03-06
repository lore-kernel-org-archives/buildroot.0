From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:40:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080306184009.3C4EC1202BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:40:08 -0800 (Thu, 06 Mar 2008)
New Revision: 21248

Log:
updated config.in with all the new swag

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-06 18:39:42 UTC (rev 21247)
+++ trunk/buildroot/package/Config.in	2008-03-06 18:40:08 UTC (rev 21248)
@@ -61,9 +61,13 @@
 source "package/at/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bsdiff/Config.in"
+source "package/cups/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
 source "package/file/Config.in"
+source "package/gamin/Config.in"
+source "package/icu/Config.in"
+source "package/ipkg/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
@@ -85,6 +89,7 @@
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
 endif
+source "package/ng-spice-rework/Config.in"
 source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
@@ -93,6 +98,7 @@
 source "package/psmisc/Config.in"
 endif
 source "package/sqlite/Config.in"
+source "package/startup-notification/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -138,7 +144,7 @@
 source "package/avahi/Config.in"
 source "package/boa/Config.in"
 source "package/bind/Config.in"
-source "package/bridge/Config.in"
+source "package/bridge-utils/Config.in"
 source "package/curl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
@@ -378,16 +384,35 @@
 source "package/libgtk12/Config.in"
 source "package/libgtk2/Config.in"
 source "package/gtk2-engines/Config.in"
+source "package/gtk2-themes/Config.in"
+source "package/libsexy/Config.in"
+source "package/fltk/Config.in"
+source "package/openmotif/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 source "package/tslib/Config.in"
+
 comment "X Window managers"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
+source "package/blackbox/Config.in"
+
 comment "X applications"
 source "package/dillo/Config.in"
+source "package/midori/Config.in"
+source "package/webkit/Config.in"
 source "package/rdesktop/Config.in"
 source "package/rxvt/Config.in"
+source "package/synergy/Config.in"
+source "package/gqview/Config.in"
+source "package/leafpad/Config.in"
+source "package/torsmo/Config.in"
+source "package/pcmanfm/Config.in"
+source "package/xstroke/Config.in"
+source "package/sylpheed/Config.in"
+source "package/xpdf/Config.in"
+source "package/x11vnc/Config.in"
+source "package/xvkbd/Config.in"
 
 comment "Video libraries/codecs and applications"
 source "package/mplayer/Config.in"
@@ -437,6 +462,18 @@
 source "package/xerces/Config.in"
 endif
 
+menuconfig BR2_JAVA_SUPPORT
+        bool "Java"
+        default n
+        help
+          Support java programs (classpath, vm, osgi)
+
+if BR2_JAVA_SUPPORT
+source "package/classpath/Config.in"
+source "package/jamvm/Config.in"
+source "package/concierge/Config.in"
+endif
+
 menuconfig BR2_GAMES
 	bool "Games"
 	default y
@@ -445,6 +482,14 @@
 
 if BR2_GAMES
 source "package/lxdoom/Config.in"
+source "package/ace_of_penguins/Config.in"
+source "package/gnuchess/Config.in"
+source "package/xboard/Config.in"
+source "package/rubix/Config.in"
+source "package/magiccube4d/Config.in"
+source "package/vice/Config.in"
 endif
 
+source "package/editors/Config.in"
+
 endmenu
