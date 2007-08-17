From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 17 Aug 2007 06:02:52 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc:
	init.d
Message-ID: <20070817130252.CE227A45E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-17 06:02:52 -0700 (Fri, 17 Aug 2007)
New Revision: 19540

Log:
Update atstk1002 target skeleton

Modified:
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/asound.state
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inetd.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K20alsa-utils
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K70sendsig
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K80netfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K85network
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K90localfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S01hotplug
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S02hostname
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S03bootsplash
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S08syslog
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S09klog
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S10modules-init
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S15localfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S20network
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S40telnetd
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S41inetd
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S42httpd
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S43ntp
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S49netfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S50alsa-utils
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99splash
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/passwd


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/asound.state
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/asound.state	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/asound.state	2007-08-17 13:02:52 UTC (rev 19540)
@@ -7,7 +7,7 @@
 		iface MIXER
 		name 'Master Playback Volume'
 		value.0 21
-		value.1 20
+		value.1 21
 	}
 	control.2 {
 		comment.access 'read write'

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts	2007-08-17 13:02:52 UTC (rev 19540)
@@ -1,11 +1,12 @@
-127.0.0.1	localhost.localdomain localhost
-127.0.1.1	stk1000.example.net stk1000
+127.0.0.1   localhost.localdomain localhost
+127.0.1.1   stk1000.example.net stk1000
 
 # The following lines are desirable for IPv6 capable hosts
-::1 ip6-localhost ip6-loopback
+::1     localhost
+::1     ip6-localhost ip6-loopback
+::1     stk1000.example.net stk1000
 fe00::0 ip6-localnet
 ff00::0 ip6-mcastprefix
 ff02::1 ip6-allnodes
 ff02::2 ip6-allrouters
 ff02::3 ip6-allhosts
-

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inetd.conf
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inetd.conf	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inetd.conf	2007-08-17 13:02:52 UTC (rev 19540)
@@ -1,4 +1,3 @@
-ftp		stream	tcp nowait	root.root /usr/sbin/ftpd ftpd -a
 #netbios-ssn	stream	tcp nowait	root.root /usr/sbin/smbd smbd
 #netbios-ns	dgram	udp wait	root.root /usr/sbin/nmbd nmbd
-swat		stream	tcp nowait.400	root.root /usr/sbin/swat swat
+#swat		stream	tcp nowait.400	root.root /usr/sbin/swat swat

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K20alsa-utils
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K20alsa-utils	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K20alsa-utils	2007-08-17 13:02:52 UTC (rev 19540)
@@ -5,10 +5,10 @@
 # Exit silently if alsa-utils isn't installed
 [ -x ${PROGRAM} ] || exit 0
 
-echo -n "Saving mixer state:"
-if ${PROGRAM} store > /dev/null 2> /dev/null; then
-	echo " done"
+echo -n "Saving mixer state: "
+if ${PROGRAM} store; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K70sendsig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K70sendsig	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K70sendsig	2007-08-17 13:02:52 UTC (rev 19540)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K80netfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K80netfs	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K80netfs	2007-08-17 13:02:52 UTC (rev 19540)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K85network
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K85network	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K85network	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,10 +2,10 @@
 
 IFDOWN=/sbin/ifdown
 
-echo -n "Stopping networking:"
+echo -n "Stopping networking: "
 if ${IFDOWN} -a; then
-	echo " done"
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K90localfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K90localfs	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K90localfs	2007-08-17 13:02:52 UTC (rev 19540)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S01hotplug
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S01hotplug	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S01hotplug	2007-08-17 13:02:52 UTC (rev 19540)
@@ -1,8 +1,8 @@
-#! /bin/sh
+#!/bin/sh
 
-echo -n "Setting up mdev:"
+echo -n "Setting up mdev: "
 set -e
-trap 'echo " failed"' EXIT
+trap 'echo "failed"' EXIT
 /bin/ln -s /proc/self/fd /dev/fd
 /bin/ln -s /proc/self/fd/0 /dev/stdin
 /bin/ln -s /proc/self/fd/1 /dev/stdout
@@ -11,4 +11,4 @@
 /bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
 /sbin/mdev -s
 trap - EXIT
-echo " done"
+echo "done"

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S02hostname
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S02hostname	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S02hostname	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,7 +2,7 @@
 
 PROGRAM=/bin/hostname
 
-echo -n "Setting hostname:"
+echo -n "Setting hostname: "
 [ -x ${PROGRAM} ] || (echo " missing"; exit 0)
 
 if [ -f /etc/hostname ]; then
@@ -12,10 +12,10 @@
 fi
 
 start() {
-	if ${PROGRAM} "${HOST}" > /dev/null 2> /dev/null; then
-		echo " '${HOST}'"
+	if ${PROGRAM} "${HOST}"; then
+		echo "'${HOST}'"
 	else
-		echo " failed"
+		echo "failed"
 		exit 1
 	fi
 }

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S03bootsplash
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S03bootsplash	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S03bootsplash	2007-08-17 13:02:52 UTC (rev 19540)
@@ -5,22 +5,21 @@
 FBMODEFILE="/etc/fb.modes"
 SPLASHFILE="/etc/stk1000bootsplash.jpg"
 
-echo -n "Bootsplash image:"
+echo -n "Bootsplash image: "
 if [ ! -x "${FBV}" -o ! -x "${FBSET}" -o \
 		! -f "${SPLASHFILE}" -o ! -f "${FBMODEFILE}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ! ${FBSET} 320x240-68 > /dev/null 2> /dev/null; then
-	echo " failed"
+if ! ${FBSET} 320x240-68; then
+	echo "failed"
 	exit 1
 fi
 
-${FBV} ${SPLASHFILE} < /dev/null > /dev/null 2> /dev/null &
+${FBV} ${SPLASHFILE} > /dev/null &
 if [ $? -eq 0 ]; then
-	echo " loaded"
-	kill `pidof ${FBV}` > /dev/null 2> /dev/null
+	echo "loaded"
 else
-	echo " failed"
+	echo "failed"
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S08syslog
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S08syslog	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S08syslog	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,23 +2,23 @@
 
 SYSLOGD=/sbin/syslogd
 
-echo -n "Starting syslogd:"
+echo -n "Starting syslogd: "
 if [ ! -x "${SYSLOGD}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${SYSLOGD} > /dev/null 2> /dev/null; then
-	echo " done"
+if ${SYSLOGD}; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi
 
-echo -n "Log messages to syslog:"
-if echo 4 4 1 7 > /proc/sys/kernel/printk 2> /dev/null; then
-	echo " done"
+echo -n "Log messages to syslog: "
+if echo 4 4 1 7 > /proc/sys/kernel/printk; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S09klog
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S09klog	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S09klog	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,15 +2,15 @@
 
 KLOGD=/sbin/klogd
 
-echo -n "Starting klogd:"
+echo -n "Starting klogd: "
 if [ ! -x "${KLOGD}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${KLOGD} > /dev/null 2> /dev/null; then
-	echo " done"
+if ${KLOGD}; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S10modules-init
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S10modules-init	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S10modules-init	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,9 +2,9 @@
 
 MODPROBE=/sbin/modprobe
 
-echo -n "Probing modules:"
+echo -n "Probing modules: "
 if [ ! -x "${MODPROBE}" -o ! -f "/etc/modules" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 else
 	echo
@@ -13,7 +13,7 @@
 grep '^[^#]' "/etc/modules" | \
 while read module args; do
 	[ "$module" ] || continue
-	if ${MODPROBE} $module $args > /dev/null 2> /dev/null; then
+	if ${MODPROBE} $module $args; then
 		echo "  $module loaded"
 	else
 		echo "  $module failed"

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S15localfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S15localfs	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S15localfs	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,10 +2,10 @@
 
 MOUNT=/bin/mount
 
-echo -n "Mounting local filesystems:"
-if ${MOUNT} -a > /dev/null 2> /dev/null; then
-	echo " done"
+echo -n "Mounting local filesystems: "
+if ${MOUNT} -a; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S20network
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S20network	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S20network	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,10 +2,10 @@
 
 IFUP=/sbin/ifup
 
-echo -n "Network interfaces:"
-if ${IFUP} -a > /dev/null 2> /dev/null; then
-	echo " done"
+echo -n "Network interfaces: "
+if ${IFUP} -a; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S40telnetd
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S40telnetd	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S40telnetd	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,15 +2,15 @@
 
 TELNETD=/usr/sbin/telnetd
 
-echo -n "Starting telnetd:"
+echo -n "Starting telnetd: "
 if [ ! -x "${TELNETD}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${TELNETD} -l /bin/ash > /dev/null 2> /dev/null; then
-	echo " done"
+if ${TELNETD} -l /bin/ash; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S41inetd
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S41inetd	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S41inetd	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,15 +2,15 @@
 
 INETD=/usr/sbin/inetd
 
-echo -n "Starting inted:"
+echo -n "Starting inted: "
 if [ ! -x "${INETD}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${INETD} > /dev/null 2> /dev/null; then
-	echo " done"
+if ${INETD}; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S42httpd
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S42httpd	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S42httpd	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,15 +2,15 @@
 
 HTTPD=/usr/sbin/httpd
 
-echo -n "Starting httpd:"
+echo -n "Starting httpd: "
 if [ ! -x "${HTTPD}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${HTTPD} -h /www > /dev/null 2> /dev/null; then
-	echo " done"
+if ${HTTPD} -h /www; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S43ntp
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S43ntp	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S43ntp	2007-08-17 13:02:52 UTC (rev 19540)
@@ -5,22 +5,22 @@
 if [ -f /etc/default/ntpdate ]; then
     . /etc/default/ntpdate
 else
-	echo " missing /etc/default/ntpdate"
+	echo "WARNING: missing /etc/default/ntpdate"
 	exit 1
 fi
 
-echo -n "Starting ntpdate:"
+echo -n "Starting ntpdate: "
 if [ ! -x ${NTPDATE} ]; then
-	echo " missing"
+	echo "missing"
 	echo -n "  WARNING: could not syncronize clock, "
 	echo "edit NTPSERVERS in /etc/default/ntpdate."
 	exit 1
 fi
 
-if ${NTPDATE} $NTPOPTIONS $NTPSERVERS > /dev/null 2> /dev/null; then
-	echo " done"
+if ${NTPDATE} $NTPOPTIONS $NTPSERVERS; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	echo -n "  WARNING: could not syncronize clock, "
 	echo "edit NTPSERVERS in /etc/default/ntpdate."
 	exit 1

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S49netfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S49netfs	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S49netfs	2007-08-17 13:02:52 UTC (rev 19540)
@@ -2,10 +2,10 @@
 
 MOUNT=/bin/mount
 
-echo -n "Mounting remote filesystems:"
-if ${MOUNT} -t nfs -a > /dev/null 2> /dev/null; then
-	echo " done"
+echo -n "Mounting remote filesystems: "
+if ${MOUNT} -t nfs -a; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S50alsa-utils
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S50alsa-utils	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S50alsa-utils	2007-08-17 13:02:52 UTC (rev 19540)
@@ -5,15 +5,15 @@
 # Exit silently if alsa-utils isn't installed
 [ -x ${PROGRAM} ] || exit 0
 
-echo -n "Restoring mixer state:"
+echo -n "Restoring mixer state: "
 if [ ! -f /etc/asound.state ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-if ${PROGRAM} restore > /dev/null 2> /dev/null; then
-	echo " done"
+if ${PROGRAM} restore; then
+	echo "done"
 else
-	echo " failed"
+	echo "failed"
 	exit 1
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99splash
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99splash	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99splash	2007-08-17 13:02:52 UTC (rev 19540)
@@ -3,16 +3,15 @@
 PROGRAM=/usr/bin/fbv
 SPLASHFILE="/etc/stk1000splash.jpg"
 
-echo -n "Splash image:"
+echo -n "Splash image: "
 if [ ! -x "${PROGRAM}" -o ! -f "${SPLASHFILE}" ]; then
-	echo " missing"
+	echo "missing"
 	exit 1
 fi
 
-${PROGRAM} ${SPLASHFILE} < /dev/null > /dev/null 2>/dev/null &
+${PROGRAM} ${SPLASHFILE} > /dev/null &
 if [ $? -eq 0 ]; then
-	echo " loaded"
-	kill `pidof ${PROGRAM}` > /dev/null 2> /dev/null
+	echo "loaded"
 else
-	echo " failed"
+	echo "failed"
 fi

Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/passwd
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/passwd	2007-08-17 13:01:49 UTC (rev 19539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/passwd	2007-08-17 13:02:52 UTC (rev 19540)
@@ -1,4 +1,4 @@
-root:$1$rsjkLsTU$zdulfnYQgyKmN3e0Fiw7C1:0:0:root:/:/bin/ash
+root:$1$rsjkLsTU$zdulfnYQgyKmN3e0Fiw7C1:0:0:root:/:/bin/sh
 daemon:x:1:1:daemon:/usr/sbin:/bin/sh
 bin:x:2:2:bin:/bin:/bin/sh
 sys:x:3:3:sys:/dev:/bin/sh
