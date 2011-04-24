From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 22:34:50 +0200
Subject: [Buildroot] [git commit] popt: bump version,
	use alternative upstream location
Message-ID: <20110424203602.D204482A32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd58efbac7040c58429b765853306c3e8052e984
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3643

rpm5.org seems to be gone/down, so use linuxfromscratch mirror instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    7 ++++---
 package/popt/popt.mk |    7 +++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5d29693..07e4935 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,9 +5,9 @@
 	ffmpeg, file, gnuconfig, gst-ffmpeg, gst-plugins-good, icu,
 	imagemagick, iproute2, less, libdnet, libpng, libxml2,
 	libxslt, lighttpd, makedevs, midori, mpg123, mpd, mtd-utils,
-	ncurses, netsnmp, openssl, pkg-config, procps, qt, quagga,
-	readline, rsync, samba, squid, socat, squashfs, tslib, webkit,
-	xerces, xlib_xtrans, xorg-server, xterm, xz
+	ncurses, netsnmp, openssl, pkg-config, popt, procps, qt,
+	quagga, readline, rsync, samba, squid, socat, squashfs, tslib,
+	webkit, xerces, xlib_xtrans, xorg-server, xterm, xz
 
 	New packages: can-utils, htop, libv4l
 
@@ -19,6 +19,7 @@
 	#3475: Calling sync on large filesystems when not always necessary
 	#3511: make busybox-menuconfig does not download busybox package
 	#3541: Quotes in the top Makefile:217 break buildroot/kernel config...
+	#3643: popt source url is not responding
 
 2011.02, Released February 28th, 2011:
 
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 0f9d313..4fdc01d 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -3,11 +3,10 @@
 # popt
 #
 #############################################################
-POPT_VERSION:=1.15
-POPT_SITE:=http://rpm5.org/files/popt
+POPT_VERSION = 1.16
+# rpm5.org down
+POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
 POPT_INSTALL_STAGING = YES
-POPT_INSTALL_TARGET = YES
-
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-- 
1.7.3.4
