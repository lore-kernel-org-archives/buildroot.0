From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 17 Aug 2007 06:01:49 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc:
	init.d
Message-ID: <20070817130149.EE4B9A4692@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-17 06:01:49 -0700 (Fri, 17 Aug 2007)
New Revision: 19539

Log:
Update atngw100 target skeleton

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts	2007-08-17 13:01:49 UTC (rev 19539)
@@ -1,11 +1,12 @@
-127.0.0.1	localhost.localdomain localhost
-127.0.1.1	ngw.example.net ngw
+127.0.0.1   localhost.localdomain localhost
+127.0.1.1   ngw.example.net ngw
 
 # The following lines are desirable for IPv6 capable hosts
-::1 ip6-localhost ip6-loopback
+::1     localhost
+::1     ip6-localhost ip6-loopback
+::1     ngw.example.net ngw
 fe00::0 ip6-localnet
 ff00::0 ip6-mcastprefix
 ff02::1 ip6-allnodes
 ff02::2 ip6-allrouters
 ff02::3 ip6-allhosts
-

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf	2007-08-17 13:01:49 UTC (rev 19539)
@@ -1,4 +1,3 @@
-ftp		stream	tcp nowait	root.root /usr/sbin/ftpd ftpd -a
 #netbios-ssn	stream	tcp nowait	root.root /usr/sbin/smbd smbd
 #netbios-ns	dgram	udp wait	root.root /usr/sbin/nmbd nmbd
 swat		stream	tcp nowait.400	root.root /usr/sbin/swat swat

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig	2007-08-17 13:01:49 UTC (rev 19539)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs	2007-08-17 13:01:49 UTC (rev 19539)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs	2007-08-17 13:01:49 UTC (rev 19539)
@@ -0,0 +1 @@
+#!/bin/sh

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug	2007-08-17 13:01:49 UTC (rev 19539)
@@ -1,8 +1,8 @@
 #! /bin/sh
 
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname	2007-08-17 13:01:49 UTC (rev 19539)
@@ -2,8 +2,8 @@
 
 PROGRAM=/bin/hostname
 
-echo -n "Setting hostname:"
-[ -x ${PROGRAM} ] || (echo " missing"; exit 0)
+echo -n "Setting hostname: "
+[ -x ${PROGRAM} ] || (echo "missing"; exit 0)
 
 if [ -f /etc/hostname ]; then
 	HOST="$(cat /etc/hostname)"
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables	2007-08-17 13:01:49 UTC (rev 19539)
@@ -2,7 +2,7 @@
 
 IPTABLES=`which iptables`
 
-echo "Enable NAT: "
+echo "Enable NAT:"
 echo -n "  IPv4 forwarding: "
 if echo 1 > /proc/sys/net/ipv4/ip_forward; then
 	echo "done"
@@ -17,7 +17,7 @@
 	exit 1
 fi
 
-if ${IPTABLES} -t nat -A POSTROUTING -o eth0 -j MASQUERADE > /dev/null 2> /dev/null; then
+if ${IPTABLES} -t nat -A POSTROUTING -o eth0 -j MASQUERADE; then
 	echo "done"
 else
 	echo "failed"
@@ -25,7 +25,7 @@
 fi
 
 echo -n "  iptables incoming trafic: "
-if ${IPTABLES} -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT > /dev/null 2> /dev/null; then
+if ${IPTABLES} -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT; then
 	echo "done"
 else
 	echo "failed"
@@ -33,7 +33,7 @@
 fi
 
 echo -n "  iptables outgoung trafic: "
-if ${IPTABLES} -A FORWARD -i eth1 -o eth0 -j ACCEPT > /dev/null 2> /dev/null; then
+if ${IPTABLES} -A FORWARD -i eth1 -o eth0 -j ACCEPT; then
 	echo "done"
 else
 	echo "failed"

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs	2007-08-17 13:01:49 UTC (rev 19539)
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

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd	2007-08-17 08:45:58 UTC (rev 19538)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd	2007-08-17 13:01:49 UTC (rev 19539)
@@ -1,4 +1,4 @@
-root:$1$rsjkLsTU$zdulfnYQgyKmN3e0Fiw7C1:0:0:root:/:/bin/ash
+root:$1$rsjkLsTU$zdulfnYQgyKmN3e0Fiw7C1:0:0:root:/:/bin/sh
 daemon:x:1:1:daemon:/usr/sbin:/bin/sh
 bin:x:2:2:bin:/bin:/bin/sh
 sys:x:3:3:sys:/dev:/bin/sh
