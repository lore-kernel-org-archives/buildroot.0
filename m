From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 13 Jan 2009 18:43:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090113184347.345ED76C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-13 18:43:46 +0000 (Tue, 13 Jan 2009)
New Revision: 24820

Log:
Update buildall.sh script

Modified:
   trunk/buildroot/scripts/buildall.sh


Changeset:
Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-13 18:42:37 UTC (rev 24819)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-13 18:43:46 UTC (rev 24820)
@@ -90,7 +90,7 @@
 mk	libdaemon
 mk	libelf
 mk	libevent
-mk	libfloat
+nmk	libfloat	# obsolete
 mk	libgcrypt
 mk	libgpg-error
 mk	libiconv
@@ -121,7 +121,6 @@
 fi
 
 mk	screen
-mk	startup-notification
 mk	strace
 mk	sudo
 
@@ -167,7 +166,7 @@
 mk	haserl
 mk	hostap
 mk	ifplugd
-mk	irda-utils
+nmk	irda-utils	# makefile is broken
 mk	iperf
 mk	iproute2
 mk	ipsec-tools
@@ -206,7 +205,7 @@
 mk	nfs-utils
 mk	ntp
 mk	olsr
-mk	openntpd
+mk	ntpd
 mk	openssh
 mk	openssl
 mk	openvpn
@@ -280,7 +279,7 @@
 mk	ntfs-3g
 mk	pciutils
 mk	pcmcia
-mk	raidtools
+mk	raidtools2
 mk	setserial
 if	[ ${busybox-tools} == 1 ] ; then
 	# busybox has fdisk
@@ -350,7 +349,7 @@
 mk	sdl
 mk	sdl_image
 mk	sdl_mixer
-mk	sdl_net
+mk	SDL_net
 mk	sdl_ttf
 mk	tiff
 
@@ -391,6 +390,8 @@
 mk	tslib
 mk	webkit
 
+nmk	startup-notification		# Depends on X11
+
 echo "X Window managers"
 mk	matchbox
 mk	metacity
