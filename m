From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:42 +0100
Subject: [Buildroot] [PATCH 11/55] Remove Busybox skeleton from
	target/device/Atmel
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2428564be88be545439ecf495b5272a835947a96.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/device/Atmel/root/skel_busybox.patch        |  215 --------------
 .../Atmel/root/target_busybox_skeleton/etc/TZ      |    1 -
 .../Atmel/root/target_busybox_skeleton/etc/fstab   |    9 -
 .../Atmel/root/target_busybox_skeleton/etc/group   |   16 -
 .../root/target_busybox_skeleton/etc/hostname      |    1 -
 .../Atmel/root/target_busybox_skeleton/etc/hosts   |    1 -
 .../target_busybox_skeleton/etc/init.d/S20urandom  |   54 ----
 .../target_busybox_skeleton/etc/init.d/S40network  |   35 ---
 .../root/target_busybox_skeleton/etc/init.d/rcS    |   27 --
 .../Atmel/root/target_busybox_skeleton/etc/inittab |   51 ----
 .../Atmel/root/target_busybox_skeleton/etc/inputrc |   44 ---
 .../Atmel/root/target_busybox_skeleton/etc/issue   |    3 -
 .../target_busybox_skeleton/etc/network/interfaces |    4 -
 .../Atmel/root/target_busybox_skeleton/etc/passwd  |   15 -
 .../Atmel/root/target_busybox_skeleton/etc/profile |   48 ---
 .../root/target_busybox_skeleton/etc/protocols     |   31 --
 .../root/target_busybox_skeleton/etc/random-seed   |  Bin 512 -> 0 bytes
 .../root/target_busybox_skeleton/etc/securetty     |   12 -
 .../root/target_busybox_skeleton/etc/services      |  302 --------------------
 .../Atmel/root/target_busybox_skeleton/etc/shadow  |   12 -
 20 files changed, 0 insertions(+), 881 deletions(-)
 delete mode 100644 target/device/Atmel/root/skel_busybox.patch
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/group
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/hosts
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/inputrc
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/issue
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/ld.so.conf.d/.empty
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/profile
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/protocols
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/random-seed
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/securetty
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/services
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/sys/.empty

diff --git a/target/device/Atmel/root/skel_busybox.patch b/target/device/Atmel/root/skel_busybox.patch
deleted file mode 100644
index d8902a7..0000000
--- a/target/device/Atmel/root/skel_busybox.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-diff -urN target_skeleton_atmel/etc/fstab target_busybox_skeleton/etc/fstab
---- target_skeleton_atmel/etc/fstab	2006-11-01 21:24:48.000000000 +0100
-+++ target_busybox_skeleton/etc/fstab	2007-04-05 12:37:04.000000000 +0200
-@@ -5,4 +5,5 @@
- proc		/proc	       proc     defaults	  0	 0
- devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
- tmpfs           /tmp           tmpfs    defaults          0      0
--
-+configfs	/config	       configfs defaults	  0	 0
-+sysfs		/sys	       sysfs    defaults	  0	 0
-diff -urN target_skeleton_atmel/etc/group target_busybox_skeleton/etc/group
---- target_skeleton_atmel/etc/group	2006-11-01 21:24:48.000000000 +0100
-+++ target_busybox_skeleton/etc/group	2007-04-05 12:37:04.000000000 +0200
-@@ -8,6 +8,8 @@
- wheel:x:10:root
- utmp:x:43:
- staff:x:50:
-+haldaemon:x:68:
-+dbus:x:81:
- nobody:x:99:
- nogroup:x:99:
- users:x:100:
-diff -urN target_skeleton_atmel/etc/inittab target_busybox_skeleton/etc/inittab
---- target_skeleton_atmel/etc/inittab	2006-11-01 21:24:48.000000000 +0100
-+++ target_busybox_skeleton/etc/inittab	2007-04-05 12:37:04.000000000 +0200
-@@ -14,27 +14,33 @@
- # process   == program to run
- 
- # Startup the system
--null::sysinit:/bin/mount -o remount,rw /
--null::sysinit:/bin/mount -t proc proc /proc
--null::sysinit:/bin/mount -a
--null::sysinit:/bin/hostname -F /etc/hostname
--null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
--null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
-+::sysinit:/bin/mount -t proc none /proc
-+::sysinit:/bin/mount -t sysfs none /sys
-+::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
-+::sysinit:/bin/mkdir /dev/pts
-+::sysinit:/bin/mount -t devpts devpts /dev/pts
-+::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
-+::sysinit:/sbin/mdev -s
-+::sysinit:/bin/mount -o remount,rw /
-+::sysinit:/bin/mount -a
-+::sysinit:/bin/hostname -F /etc/hostname
-+::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-+::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
- # now run any rc scripts
- ::sysinit:/etc/init.d/rcS
- 
- # Set up a couple of getty's
--#tty1::respawn:/sbin/getty 38400 tty1
--#tty2::respawn:/sbin/getty 38400 tty2
-+tty1::respawn:/sbin/getty 38400 tty1
-+tty2::respawn:/sbin/getty 38400 tty2
- 
- # Put a getty on the serial port
--ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
-+#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
- 
- # Logging junk
- null::sysinit:/bin/touch /var/log/messages
--null::respawn:/sbin/syslogd -n -m 0
-+null::respawn:/sbin/syslogd -n
- null::respawn:/sbin/klogd -n
--#tty3::respawn:/usr/bin/tail -f /var/log/messages
-+tty3::respawn:/usr/bin/tail -f /var/log/messages
- 
- # Stuff to do for the 3-finger salute
- ::ctrlaltdel:/sbin/reboot
-diff -urN target_skeleton_atmel/etc/passwd target_busybox_skeleton/etc/passwd
---- target_skeleton_atmel/etc/passwd	2006-11-01 21:24:48.000000000 +0100
-+++ target_busybox_skeleton/etc/passwd	2007-04-05 12:37:04.000000000 +0200
-@@ -8,6 +8,8 @@
- www-data:x:33:33:www-data:/var/www:/bin/sh
- backup:x:34:34:backup:/var/backups:/bin/sh
- operator:x:37:37:Operator:/var:/bin/sh
--sshd:x:103:99:Operator:/var:/bin/sh
-+haldaemon:x:68:68:hald:/:/bin/sh
-+dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
- nobody:x:99:99:nobody:/home:/bin/sh
-+sshd:x:103:99:Operator:/var:/bin/sh
- default:x:1000:1000:Default non-root user:/home/default:/bin/sh
-Filerna target_skeleton_atmel/etc/random-seed och target_busybox_skeleton/etc/random-seed skiljer
-diff -urN target_skeleton_atmel/etc/resolv.conf target_busybox_skeleton/etc/resolv.conf
---- target_skeleton_atmel/etc/resolv.conf	2006-11-01 21:24:48.000000000 +0100
-+++ target_busybox_skeleton/etc/resolv.conf	1970-01-01 01:00:00.000000000 +0100
-@@ -1,2 +0,0 @@
--domain dev.null
--nameserver 127.0.0.1
-diff -urN target_skeleton_atmel/root/.bash_logout target_busybox_skeleton/root/.bash_logout
---- target_skeleton_atmel/root/.bash_logout	2006-11-01 21:24:49.000000000 +0100
-+++ target_busybox_skeleton/root/.bash_logout	1970-01-01 01:00:00.000000000 +0100
-@@ -1,7 +0,0 @@
--# ~/.bash_logout: executed by bash(1) when login shell exits.
--
--# when leaving the console clear the screen to increase privacy
--
--case "`tty`" in
--    /dev/tty[0-9]*) clear
--esac
-diff -urN target_skeleton_atmel/root/.bash_profile target_busybox_skeleton/root/.bash_profile
---- target_skeleton_atmel/root/.bash_profile	2006-11-01 21:24:49.000000000 +0100
-+++ target_busybox_skeleton/root/.bash_profile	1970-01-01 01:00:00.000000000 +0100
-@@ -1,15 +0,0 @@
--# .bash_profile
--
--export PATH=\
--/bin:\
--/sbin:\
--/usr/bin:\
--/usr/sbin:\
--/usr/bin/X11:\
--/usr/local/bin
--
--umask 022
--
--if [ -f ~/.bashrc ]; then
--    source ~/.bashrc
--fi
-diff -urN target_skeleton_atmel/root/.bashrc target_busybox_skeleton/root/.bashrc
---- target_skeleton_atmel/root/.bashrc	2006-11-01 21:24:49.000000000 +0100
-+++ target_busybox_skeleton/root/.bashrc	1970-01-01 01:00:00.000000000 +0100
-@@ -1,48 +0,0 @@
--# ~/.bashrc: executed by bash(1) for non-login interactive shells.
--
--export PATH=\
--/bin:\
--/sbin:\
--/usr/bin:\
--/usr/sbin:\
--/usr/bin/X11:\
--/usr/local/bin
--
--# If running interactively, then:
--if [ "$PS1" ]; then
--
--    if [ "$BASH" ]; then
--	export PS1="[\u@\h \W]\\$ "
--    else
--      if [ "`id -u`" -eq 0 ]; then 
--	export PS1='# '
--      else
--	export PS1='$ '
--      fi
--    fi
--
--    export USER=`id -un`
--    export LOGNAME=$USER
--    export HOSTNAME=`/bin/hostname`
--    export HISTSIZE=1000
--    export HISTFILESIZE=1000
--    export PAGER='/bin/more '
--    export EDITOR='/bin/vi'
--    export INPUTRC=/etc/inputrc
--    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
--    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
--
--    ### Some aliases
--    alias ps2='ps facux '
--    alias ps1='ps faxo "%U %t %p %a" '
--    alias af='ps af'
--    alias cls='clear'
--    alias ll='/bin/ls -laFh'
--    alias ls='/bin/ls -F'
--    alias df='df -h'
--    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
--    #alias bc='bc -l'
--    alias minicom='minicom -c on'
--    alias calc='calc -Cd '
--    alias bc='calc -Cd '
--fi;
-diff -urN target_skeleton_atmel/usr/share/udhcpc/default.script target_busybox_skeleton/usr/share/udhcpc/default.script
---- target_skeleton_atmel/usr/share/udhcpc/default.script	2006-11-01 21:24:49.000000000 +0100
-+++ target_busybox_skeleton/usr/share/udhcpc/default.script	1970-01-01 01:00:00.000000000 +0100
-@@ -1,39 +0,0 @@
--#!/bin/sh
--
--# udhcpc script edited by Tim Riker <Tim@Rikers.org>
--
--[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
--
--RESOLV_CONF="/etc/resolv.conf"
--[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
--[ -n "$subnet" ] && NETMASK="netmask $subnet"
--
--case "$1" in
--	deconfig)
--		/sbin/ifconfig $interface 0.0.0.0
--		;;
--
--	renew|bound)
--		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
--
--		if [ -n "$router" ] ; then
--			echo "deleting routers"
--			while route del default gw 0.0.0.0 dev $interface ; do
--				:
--			done
--
--			for i in $router ; do
--				route add default gw $i dev $interface
--			done
--		fi
--
--		echo -n > $RESOLV_CONF
--		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
--		for i in $dns ; do
--			echo adding dns $i
--			echo nameserver $i >> $RESOLV_CONF
--		done
--		;;
--esac
--
--exit 0
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/TZ b/target/device/Atmel/root/target_busybox_skeleton/etc/TZ
deleted file mode 100644
index 9fcb2a3..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/TZ
+++ /dev/null
@@ -1 +0,0 @@
-MST7MDT
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/fstab b/target/device/Atmel/root/target_busybox_skeleton/etc/fstab
deleted file mode 100644
index 5a351e2..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/fstab
+++ /dev/null
@@ -1,9 +0,0 @@
-# /etc/fstab: static file system information.
-#
-# <file system> <mount pt>     <type>	<options>         <dump> <pass>
-/dev/root       /              ext2	rw,noauto         0      1
-proc		/proc	       proc     defaults	  0	 0
-devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
-tmpfs           /tmp           tmpfs    defaults          0      0
-configfs	/config	       configfs defaults	  0	 0
-sysfs		/sys	       sysfs    defaults	  0	 0
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/group b/target/device/Atmel/root/target_busybox_skeleton/etc/group
deleted file mode 100644
index f78c22c..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/group
+++ /dev/null
@@ -1,16 +0,0 @@
-root:x:0:
-daemon:x:1:
-bin:x:2:
-sys:x:3:
-adm:x:4:
-tty:x:5:
-disk:x:6:
-wheel:x:10:root
-utmp:x:43:
-staff:x:50:
-haldaemon:x:68:
-dbus:x:81:
-nobody:x:99:
-nogroup:x:99:
-users:x:100:
-default:x:1000:
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/hostname b/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
deleted file mode 100644
index 5b26b35..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
+++ /dev/null
@@ -1 +0,0 @@
-buildroot
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/hosts b/target/device/Atmel/root/target_busybox_skeleton/etc/hosts
deleted file mode 100644
index ba712fe..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/hosts
+++ /dev/null
@@ -1 +0,0 @@
-127.0.0.1	localhost
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom b/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom
deleted file mode 100755
index f73cea5..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom
+++ /dev/null
@@ -1,54 +0,0 @@
-#! /bin/sh
-#
-# urandom	This script saves the random seed between reboots.
-#		It is called from the boot, halt and reboot scripts.
-#
-# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
-#
-
-[ -c /dev/urandom ] || exit 0
-#. /etc/default/rcS
-
-case "$1" in
-	start|"")
-		if [ "$VERBOSE" != no ]
-		then
-			echo -n "Initializing random number generator... "
-		fi
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		if [ -f /etc/random-seed ]
-		then
-			cat /etc/random-seed >/dev/urandom
-		fi
-		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			echo "read-only file system detected...done"
-			exit
-		fi
-		rm -f /etc/random-seed
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom start: failed."
-		umask 022
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	stop)
-		if ! touch /etc/random-seed 2>/dev/null
-                then
-                        exit
-                fi
-		# Carry a random seed from shut-down to start-up;
-		# see documentation in linux/drivers/char/random.c
-		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom stop: failed."
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	*)
-		echo "Usage: urandom {start|stop}" >&2
-		exit 1
-		;;
-esac
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network b/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network
deleted file mode 100755
index d835d9c..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-#
-# Start the network....
-#
-
-start() {
- 	echo "Starting network..."
-	/sbin/ifup -a
-}	
-stop() {
-	echo -n "Stopping network..."
-	/sbin/ifdown -a
-}
-restart() {
-	stop
-	start
-}	
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo $"Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS b/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS
deleted file mode 100755
index de41153..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS
+++ /dev/null
@@ -1,27 +0,0 @@
-#!/bin/sh
-
-
-# Start all init scripts in /etc/init.d
-# executing them in numerical order.
-#
-for i in /etc/init.d/S??* ;do
-
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
-
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set start
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i start
-	    ;;
-    esac
-done
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab b/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
deleted file mode 100644
index b394548..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
+++ /dev/null
@@ -1,51 +0,0 @@
-# /etc/inittab
-#
-# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
-#
-# Note: BusyBox init doesn't support runlevels.  The runlevels field is
-# completely ignored by BusyBox init. If you want runlevels, use
-# sysvinit.
-#
-# Format for each entry: <id>:<runlevels>:<action>:<process>
-#
-# id        == tty to run on, or empty for /dev/console
-# runlevels == ignored
-# action    == one of sysinit, respawn, askfirst, wait, and once
-# process   == program to run
-
-# Startup the system
-::sysinit:/bin/mount -t proc none /proc
-::sysinit:/bin/mount -t sysfs none /sys
-::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
-::sysinit:/bin/mkdir /dev/pts
-::sysinit:/bin/mount -t devpts devpts /dev/pts
-::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
-::sysinit:/sbin/mdev -s
-::sysinit:/bin/mount -o remount,rw /
-::sysinit:/bin/mount -a
-::sysinit:/bin/hostname -F /etc/hostname
-# now run any rc scripts
-::sysinit:/etc/init.d/rcS
-
-# Set up a couple of getty's
-tty1::respawn:/sbin/getty 38400 tty1
-tty2::respawn:/sbin/getty 38400 tty2
-
-# Put a getty on the serial port
-#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
-
-# Logging junk
-null::sysinit:/bin/touch /var/log/messages
-null::respawn:/sbin/syslogd -n
-null::respawn:/sbin/klogd -n
-tty3::respawn:/usr/bin/tail -f /var/log/messages
-
-# Stuff to do for the 3-finger salute
-::ctrlaltdel:/sbin/reboot
-
-# Stuff to do before rebooting
-null::shutdown:/usr/bin/killall klogd
-null::shutdown:/usr/bin/killall syslogd
-null::shutdown:/bin/umount -a -r
-null::shutdown:/sbin/swapoff -a
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/inputrc b/target/device/Atmel/root/target_busybox_skeleton/etc/inputrc
deleted file mode 100644
index 2f1cb60..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/inputrc
+++ /dev/null
@@ -1,44 +0,0 @@
-# /etc/inputrc - global inputrc for libreadline
-# See readline(3readline) and `info readline' for more information.
-
-# Be 8 bit clean.
-set input-meta on
-set output-meta on
-set bell-style visible
-
-# To allow the use of 8bit-characters like the german umlauts, comment out
-# the line below. However this makes the meta key not work as a meta key,
-# which is annoying to those which don't need to type in 8-bit characters.
-
-# set convert-meta off
-
-"\e0d": backward-word
-"\e0c": forward-word
-"\e[h": beginning-of-line
-"\e[f": end-of-line
-"\e[1~": beginning-of-line
-"\e[4~": end-of-line
-#"\e[5~": beginning-of-history
-#"\e[6~": end-of-history
-"\e[3~": delete-char
-"\e[2~": quoted-insert
-
-# Common standard keypad and cursor
-# (codes courtsey Werner Fink, <werner@suse.de>)
-#"\e[1~": history-search-backward
-"\e[2~": yank
-"\e[3~": delete-char
-#"\e[4~": set-mark
-"\e[5~": history-search-backward
-"\e[6~": history-search-forward
-# Normal keypad and cursor of xterm
-"\e[F": end-of-line
-"\e[H": beginning-of-line
-# Application keypad and cursor of xterm
-"\eOA": previous-history
-"\eOC": forward-char
-"\eOB": next-history
-"\eOD": backward-char
-"\eOF": end-of-line
-"\eOH": beginning-of-line
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/issue b/target/device/Atmel/root/target_busybox_skeleton/etc/issue
deleted file mode 100644
index 90f1779..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/issue
+++ /dev/null
@@ -1,3 +0,0 @@
-
-Welcome to Buildroot
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/ld.so.conf.d/.empty b/target/device/Atmel/root/target_busybox_skeleton/etc/ld.so.conf.d/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces b/target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces
deleted file mode 100644
index 218b82c..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces
+++ /dev/null
@@ -1,4 +0,0 @@
-# Configure Loopback
-auto lo
-iface lo inet loopback
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/passwd b/target/device/Atmel/root/target_busybox_skeleton/etc/passwd
deleted file mode 100644
index 377d4df..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/passwd
+++ /dev/null
@@ -1,15 +0,0 @@
-root:x:0:0:root:/root:/bin/sh
-daemon:x:1:1:daemon:/usr/sbin:/bin/sh
-bin:x:2:2:bin:/bin:/bin/sh
-sys:x:3:3:sys:/dev:/bin/sh
-sync:x:4:100:sync:/bin:/bin/sync
-mail:x:8:8:mail:/var/spool/mail:/bin/sh
-proxy:x:13:13:proxy:/bin:/bin/sh
-www-data:x:33:33:www-data:/var/www:/bin/sh
-backup:x:34:34:backup:/var/backups:/bin/sh
-operator:x:37:37:Operator:/var:/bin/sh
-haldaemon:x:68:68:hald:/:/bin/sh
-dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
-nobody:x:99:99:nobody:/home:/bin/sh
-sshd:x:103:99:Operator:/var:/bin/sh
-default:x:1000:1000:Default non-root user:/home/default:/bin/sh
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/profile b/target/device/Atmel/root/target_busybox_skeleton/etc/profile
deleted file mode 100644
index cc2e0be..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/profile
+++ /dev/null
@@ -1,48 +0,0 @@
-# ~/.bashrc: executed by bash(1) for non-login interactive shells.
-
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin:\
-/usr/bin/X11:\
-/usr/local/bin
-
-# If running interactively, then:
-if [ "$PS1" ]; then
-
-    if [ "$BASH" ]; then
-	export PS1="[\u@\h \W]\\$ "
-	alias ll='/bin/ls --color=tty -laFh'
-	alias ls='/bin/ls --color=tty -F'
-	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
-    else
-      if [ "`id -u`" -eq 0 ]; then 
-	export PS1='# '
-      else
-	export PS1='$ '
-      fi
-    fi
-
-    export USER=`id -un`
-    export LOGNAME=$USER
-    export HOSTNAME=`/bin/hostname`
-    export HISTSIZE=1000
-    export HISTFILESIZE=1000
-    export PAGER='/bin/more '
-    export EDITOR='/bin/vi'
-    export INPUTRC=/etc/inputrc
-    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
-
-    ### Some aliases
-    alias ps2='ps facux '
-    alias ps1='ps faxo "%U %t %p %a" '
-    alias af='ps af'
-    alias cls='clear'
-    alias df='df -h'
-    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
-    #alias bc='bc -l'
-    alias minicom='minicom -c on'
-    alias calc='calc -Cd '
-    alias bc='calc -Cd '
-fi;
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/protocols b/target/device/Atmel/root/target_busybox_skeleton/etc/protocols
deleted file mode 100644
index 1ac8a40..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/protocols
+++ /dev/null
@@ -1,31 +0,0 @@
-# /etc/protocols:
-# $Id: protocols,v 1.1 2004/10/09 02:49:18 andersen Exp $
-#
-# Internet (IP) protocols
-#
-#	from: @(#)protocols	5.1 (Berkeley) 4/17/89
-#
-# Updated for NetBSD based on RFC 1340, Assigned Numbers (July 1992).
-
-ip	0	IP		# internet protocol, pseudo protocol number
-icmp	1	ICMP		# internet control message protocol
-igmp	2	IGMP		# Internet Group Management
-ggp	3	GGP		# gateway-gateway protocol
-ipencap	4	IP-ENCAP	# IP encapsulated in IP (officially ``IP'')
-st	5	ST		# ST datagram mode
-tcp	6	TCP		# transmission control protocol
-egp	8	EGP		# exterior gateway protocol
-pup	12	PUP		# PARC universal packet protocol
-udp	17	UDP		# user datagram protocol
-hmp	20	HMP		# host monitoring protocol
-xns-idp	22	XNS-IDP		# Xerox NS IDP
-rdp	27	RDP		# "reliable datagram" protocol
-iso-tp4	29	ISO-TP4		# ISO Transport Protocol class 4
-xtp	36	XTP		# Xpress Tranfer Protocol
-ddp	37	DDP		# Datagram Delivery Protocol
-idpr-cmtp	39	IDPR-CMTP	# IDPR Control Message Transport
-rspf	73	RSPF		#Radio Shortest Path First.
-vmtp	81	VMTP		# Versatile Message Transport
-ospf	89	OSPFIGP		# Open Shortest Path First IGP
-ipip	94	IPIP		# Yet Another IP encapsulation
-encap	98	ENCAP		# Yet Another IP encapsulation
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/random-seed b/target/device/Atmel/root/target_busybox_skeleton/etc/random-seed
deleted file mode 100644
index f26038adc5d057a0b9d6ce5d3cda02ccb4a4d12e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 512
zcmV+b0{{Iq0UOB42;n<rZ7)sf8Kr=fg87_s+y&vLYgGJP-sY`OWMEj0aQ&I{*g5$)
zH?Zu5*rX8>4xpAvJIL$H4mg*!B4&9jh)7+B2j-fX7o at K*bzj;pJ$FwoQzl&MuZ^Wy
zrYS)x9vq<)#e~&1uB|_ITW-fntEg1^KXs3>vvgL7?_kg!+6=fg{S7mwkr$#pm<zB(
zu)oAUWFK-u-)cWcuSL*8$Q<cmC?ll~NEK@l5k|75(YzZ_p!I6FJ}YI_3>PZ13liCc
zi|M+im&71p*p+Z|7f(m-aedNFtEezFN<xKEd-wQ71%XuGfKr+6VcDycMQ(v6+Z0G|
z-MPjg@JHu%y(|h1cTa=a4(m?GyU)ZD-T+-vLXX}cCXyn}vCXC3Hn1ft`zDTL(};Rr
z?3wX?Eh5%n+AXAeDtXvl!o>-nZHytAhV~}?OM$-f$(%cG(ioV{==Ub4mfZP}OaJJ7
z25tvCcku=>;L?}O-dvK9`}<^gmg@IrnfQm#P>RRF|C9c;GDgEg_bw26{dkIVt1`{`
z3#ol{Q_FL91TBD~{uZn<gw?^=VUuSaIf)=p`07n=>RRZ(Otf!KXM&;q)8B<Q8(T)k
z?Z}a{1Jyf~bQPL{qVQk6jFNfBr)0;57HwN`o6Kw{wdPGHUWrfsJ}0VmW|Tr22whlO
C+W_DI

diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/securetty b/target/device/Atmel/root/target_busybox_skeleton/etc/securetty
deleted file mode 100644
index 81616f3..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/securetty
+++ /dev/null
@@ -1,12 +0,0 @@
-tty1
-tty2
-tty3
-tty4
-tty5
-tty6
-tty7
-tty8
-ttyS0
-ttyS1
-ttyS2
-ttyS3
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/services b/target/device/Atmel/root/target_busybox_skeleton/etc/services
deleted file mode 100644
index b287b63..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/services
+++ /dev/null
@@ -1,302 +0,0 @@
-# /etc/services:
-# $Id: services,v 1.1 2004/10/09 02:49:18 andersen Exp $
-#
-# Network services, Internet style
-#
-# Note that it is presently the policy of IANA to assign a single well-known
-# port number for both TCP and UDP; hence, most entries here have two entries
-# even if the protocol doesn't support UDP operations.
-# Updated from RFC 1700, ``Assigned Numbers'' (October 1994).  Not all ports
-# are included, only the more common ones.
-
-tcpmux		1/tcp				# TCP port service multiplexer
-echo		7/tcp
-echo		7/udp
-discard		9/tcp		sink null
-discard		9/udp		sink null
-systat		11/tcp		users
-daytime		13/tcp
-daytime		13/udp
-netstat		15/tcp
-qotd		17/tcp		quote
-msp		18/tcp				# message send protocol
-msp		18/udp				# message send protocol
-chargen		19/tcp		ttytst source
-chargen		19/udp		ttytst source
-ftp-data	20/tcp
-ftp		21/tcp
-fsp		21/udp		fspd
-ssh		22/tcp				# SSH Remote Login Protocol
-ssh		22/udp				# SSH Remote Login Protocol
-telnet		23/tcp
-# 24 - private
-smtp		25/tcp		mail
-# 26 - unassigned
-time		37/tcp		timserver
-time		37/udp		timserver
-rlp		39/udp		resource	# resource location
-nameserver	42/tcp		name		# IEN 116
-whois		43/tcp		nicname
-re-mail-ck	50/tcp				# Remote Mail Checking Protocol
-re-mail-ck	50/udp				# Remote Mail Checking Protocol
-domain		53/tcp		nameserver	# name-domain server
-domain		53/udp		nameserver
-mtp		57/tcp				# deprecated
-bootps		67/tcp				# BOOTP server
-bootps		67/udp
-bootpc		68/tcp				# BOOTP client
-bootpc		68/udp
-tftp		69/udp
-gopher		70/tcp				# Internet Gopher
-gopher		70/udp
-rje		77/tcp		netrjs
-finger		79/tcp
-www		80/tcp		http		# WorldWideWeb HTTP
-www		80/udp				# HyperText Transfer Protocol
-link		87/tcp		ttylink
-kerberos	88/tcp		kerberos5 krb5	# Kerberos v5
-kerberos	88/udp		kerberos5 krb5	# Kerberos v5
-supdup		95/tcp
-# 100 - reserved
-hostnames	101/tcp		hostname	# usually from sri-nic
-iso-tsap	102/tcp		tsap		# part of ISODE.
-csnet-ns	105/tcp		cso-ns		# also used by CSO name server
-csnet-ns	105/udp		cso-ns
-# unfortunately the poppassd (Eudora) uses a port which has already
-# been assigned to a different service. We list the poppassd as an
-# alias here. This should work for programs asking for this service.
-# (due to a bug in inetd the 3com-tsmux line is disabled)
-#3com-tsmux	106/tcp		poppassd
-#3com-tsmux	106/udp		poppassd
-rtelnet		107/tcp				# Remote Telnet
-rtelnet		107/udp
-pop-2		109/tcp		postoffice	# POP version 2
-pop-2		109/udp
-pop-3		110/tcp				# POP version 3
-pop-3		110/udp
-sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper TCP
-sunrpc		111/udp		portmapper	# RPC 4.0 portmapper UDP
-auth		113/tcp		authentication tap ident
-sftp		115/tcp
-uucp-path	117/tcp
-nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
-ntp		123/tcp
-ntp		123/udp				# Network Time Protocol
-netbios-ns	137/tcp				# NETBIOS Name Service
-netbios-ns	137/udp
-netbios-dgm	138/tcp				# NETBIOS Datagram Service
-netbios-dgm	138/udp
-netbios-ssn	139/tcp				# NETBIOS session service
-netbios-ssn	139/udp
-imap2		143/tcp				# Interim Mail Access Proto v2
-imap2		143/udp
-snmp		161/udp				# Simple Net Mgmt Proto
-snmp-trap	162/udp		snmptrap	# Traps for SNMP
-cmip-man	163/tcp				# ISO mgmt over IP (CMOT)
-cmip-man	163/udp
-cmip-agent	164/tcp
-cmip-agent	164/udp
-xdmcp		177/tcp				# X Display Mgr. Control Proto
-xdmcp		177/udp
-nextstep	178/tcp		NeXTStep NextStep	# NeXTStep window
-nextstep	178/udp		NeXTStep NextStep	# server
-bgp		179/tcp				# Border Gateway Proto.
-bgp		179/udp
-prospero	191/tcp				# Cliff Neuman's Prospero
-prospero	191/udp
-irc		194/tcp				# Internet Relay Chat
-irc		194/udp
-smux		199/tcp				# SNMP Unix Multiplexer
-smux		199/udp
-at-rtmp		201/tcp				# AppleTalk routing
-at-rtmp		201/udp
-at-nbp		202/tcp				# AppleTalk name binding
-at-nbp		202/udp
-at-echo		204/tcp				# AppleTalk echo
-at-echo		204/udp
-at-zis		206/tcp				# AppleTalk zone information
-at-zis		206/udp
-qmtp		209/tcp				# The Quick Mail Transfer Protocol
-qmtp		209/udp				# The Quick Mail Transfer Protocol
-z3950		210/tcp		wais		# NISO Z39.50 database
-z3950		210/udp		wais
-ipx		213/tcp				# IPX
-ipx		213/udp
-imap3		220/tcp				# Interactive Mail Access
-imap3		220/udp				# Protocol v3
-ulistserv	372/tcp				# UNIX Listserv
-ulistserv	372/udp
-https		443/tcp				# MCom
-https		443/udp				# MCom
-snpp		444/tcp				# Simple Network Paging Protocol
-snpp		444/udp				# Simple Network Paging Protocol
-saft		487/tcp				# Simple Asynchronous File Transfer
-saft		487/udp				# Simple Asynchronous File Transfer
-npmp-local	610/tcp		dqs313_qmaster	# npmp-local / DQS
-npmp-local	610/udp		dqs313_qmaster	# npmp-local / DQS
-npmp-gui	611/tcp		dqs313_execd	# npmp-gui / DQS
-npmp-gui	611/udp		dqs313_execd	# npmp-gui / DQS
-hmmp-ind	612/tcp		dqs313_intercell# HMMP Indication / DQS
-hmmp-ind	612/udp		dqs313_intercell# HMMP Indication / DQS
-#
-# UNIX specific services
-#
-exec		512/tcp
-biff		512/udp		comsat
-login		513/tcp
-who		513/udp		whod
-shell		514/tcp		cmd		# no passwords used
-syslog		514/udp
-printer		515/tcp		spooler		# line printer spooler
-talk		517/udp
-ntalk		518/udp
-route		520/udp		router routed	# RIP
-timed		525/udp		timeserver
-tempo		526/tcp		newdate
-courier		530/tcp		rpc
-conference	531/tcp		chat
-netnews		532/tcp		readnews
-netwall		533/udp				# -for emergency broadcasts
-uucp		540/tcp		uucpd		# uucp daemon
-afpovertcp	548/tcp				# AFP over TCP
-afpovertcp	548/udp				# AFP over TCP
-remotefs	556/tcp		rfs_server rfs	# Brunhoff remote filesystem
-klogin		543/tcp				# Kerberized `rlogin' (v5)
-kshell		544/tcp		krcmd		# Kerberized `rsh' (v5)
-kerberos-adm	749/tcp				# Kerberos `kadmin' (v5)
-#
-webster		765/tcp				# Network dictionary
-webster		765/udp
-#
-# From ``Assigned Numbers'':
-#
-#> The Registered Ports are not controlled by the IANA and on most systems
-#> can be used by ordinary user processes or programs executed by ordinary
-#> users.
-#
-#> Ports are used in the TCP [45,106] to name the ends of logical
-#> connections which carry long term conversations.  For the purpose of
-#> providing services to unknown callers, a service contact port is
-#> defined.  This list specifies the port used by the server process as its
-#> contact port.  While the IANA can not control uses of these ports it
-#> does register or list uses of these ports as a convienence to the
-#> community.
-#
-nfsdstatus	1110/tcp
-nfsd-keepalive	1110/udp
-
-ingreslock	1524/tcp
-ingreslock	1524/udp
-prospero-np	1525/tcp			# Prospero non-privileged
-prospero-np	1525/udp
-datametrics	1645/tcp	old-radius	# datametrics / old radius entry
-datametrics	1645/udp	old-radius	# datametrics / old radius entry
-sa-msg-port	1646/tcp	old-radacct	# sa-msg-port / old radacct entry
-sa-msg-port	1646/udp	old-radacct	# sa-msg-port / old radacct entry
-radius		1812/tcp			# Radius
-radius		1812/udp			# Radius
-radacct		1813/tcp			# Radius Accounting
-radacct		1813/udp			# Radius Accounting
-nfsd		2049/tcp	nfs
-nfsd		2049/udp	nfs
-cvspserver	2401/tcp			# CVS client/server operations
-cvspserver	2401/udp			# CVS client/server operations
-mysql		3306/tcp			# MySQL
-mysql		3306/udp			# MySQL
-rfe		5002/tcp			# Radio Free Ethernet
-rfe		5002/udp			# Actually uses UDP only
-cfengine	5308/tcp			# CFengine
-cfengine	5308/udp			# CFengine
-bbs		7000/tcp			# BBS service
-#
-#
-# Kerberos (Project Athena/MIT) services
-# Note that these are for Kerberos v4, and are unofficial.  Sites running
-# v4 should uncomment these and comment out the v5 entries above.
-#
-kerberos4	750/udp		kerberos-iv kdc	# Kerberos (server) udp
-kerberos4	750/tcp		kerberos-iv kdc	# Kerberos (server) tcp
-kerberos_master	751/udp				# Kerberos authentication
-kerberos_master	751/tcp				# Kerberos authentication
-passwd_server	752/udp				# Kerberos passwd server
-krb_prop	754/tcp				# Kerberos slave propagation
-krbupdate	760/tcp		kreg		# Kerberos registration
-kpasswd		761/tcp		kpwd		# Kerberos "passwd"
-kpop		1109/tcp			# Pop with Kerberos
-knetd		2053/tcp			# Kerberos de-multiplexor
-zephyr-srv	2102/udp			# Zephyr server
-zephyr-clt	2103/udp			# Zephyr serv-hm connection
-zephyr-hm	2104/udp			# Zephyr hostmanager
-eklogin		2105/tcp			# Kerberos encrypted rlogin
-#
-# Unofficial but necessary (for NetBSD) services
-#
-supfilesrv	871/tcp				# SUP server
-supfiledbg	1127/tcp			# SUP debugging
-#
-# Datagram Delivery Protocol services
-#
-rtmp		1/ddp				# Routing Table Maintenance Protocol
-nbp		2/ddp				# Name Binding Protocol
-echo		4/ddp				# AppleTalk Echo Protocol
-zip		6/ddp				# Zone Information Protocol
-#
-# Services added for the Debian GNU/Linux distribution
-poppassd	106/tcp				# Eudora
-poppassd	106/udp				# Eudora
-mailq		174/tcp				# Mailer transport queue for Zmailer
-mailq		174/tcp				# Mailer transport queue for Zmailer
-omirr		808/tcp		omirrd		# online mirror
-omirr		808/udp		omirrd		# online mirror
-rmtcfg		1236/tcp			# Gracilis Packeten remote config server
-xtel		1313/tcp			# french minitel
-coda_opcons	1355/udp			# Coda opcons            (Coda fs)
-coda_venus	1363/udp			# Coda venus             (Coda fs)
-coda_auth	1357/udp			# Coda auth              (Coda fs)
-coda_udpsrv	1359/udp			# Coda udpsrv            (Coda fs)
-coda_filesrv	1361/udp			# Coda filesrv           (Coda fs)
-codacon		1423/tcp	venus.cmu	# Coda Console           (Coda fs)
-coda_aux1	1431/tcp			# coda auxiliary service (Coda fs)
-coda_aux1	1431/udp			# coda auxiliary service (Coda fs)
-coda_aux2	1433/tcp			# coda auxiliary service (Coda fs)
-coda_aux2	1433/udp			# coda auxiliary service (Coda fs)
-coda_aux3	1435/tcp			# coda auxiliary service (Coda fs)
-coda_aux3	1435/udp			# coda auxiliary service (Coda fs)
-cfinger		2003/tcp			# GNU Finger
-afbackup	2988/tcp			# Afbackup system
-afbackup	2988/udp			# Afbackup system
-icp		3130/tcp			# Internet Cache Protocol (Squid)
-icp		3130/udp			# Internet Cache Protocol (Squid)
-postgres	5432/tcp			# POSTGRES
-postgres	5432/udp			# POSTGRES
-fax		4557/tcp			# FAX transmission service        (old)
-hylafax		4559/tcp			# HylaFAX client-server protocol  (new)
-noclog		5354/tcp			# noclogd with TCP (nocol)
-noclog		5354/udp			# noclogd with UDP (nocol)
-hostmon		5355/tcp			# hostmon uses TCP (nocol)
-hostmon		5355/udp			# hostmon uses TCP (nocol)
-ircd		6667/tcp			# Internet Relay Chat
-ircd		6667/udp			# Internet Relay Chat
-webcache	8080/tcp			# WWW caching service
-webcache	8080/udp			# WWW caching service
-tproxy		8081/tcp			# Transparent Proxy
-tproxy		8081/udp			# Transparent Proxy
-mandelspawn	9359/udp	mandelbrot	# network mandelbrot
-amanda		10080/udp			# amanda backup services
-amandaidx	10082/tcp			# amanda backup services
-amidxtape	10083/tcp			# amanda backup services
-isdnlog		20011/tcp			# isdn logging system
-isdnlog		20011/udp			# isdn logging system
-vboxd		20012/tcp			# voice box system
-vboxd		20012/udp			# voice box system
-binkp           24554/tcp			# Binkley
-binkp           24554/udp			# Binkley
-asp		27374/tcp			# Address Search Protocol
-asp		27374/udp			# Address Search Protocol
-tfido           60177/tcp			# Ifmail
-tfido           60177/udp			# Ifmail
-fido            60179/tcp			# Ifmail
-fido            60179/udp			# Ifmail
-
-# Local services
-
diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/shadow b/target/device/Atmel/root/target_busybox_skeleton/etc/shadow
deleted file mode 100644
index 4941a1a..0000000
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/shadow
+++ /dev/null
@@ -1,12 +0,0 @@
-root::10933:0:99999:7:::
-bin:*:10933:0:99999:7:::
-daemon:*:10933:0:99999:7:::
-adm:*:10933:0:99999:7:::
-lp:*:10933:0:99999:7:::
-sync:*:10933:0:99999:7:::
-shutdown:*:10933:0:99999:7:::
-halt:*:10933:0:99999:7:::
-uucp:*:10933:0:99999:7:::
-operator:*:10933:0:99999:7:::
-nobody:*:10933:0:99999:7:::
-default::10933:0:99999:7:::
diff --git a/target/device/Atmel/root/target_busybox_skeleton/sys/.empty b/target/device/Atmel/root/target_busybox_skeleton/sys/.empty
deleted file mode 100644
index e69de29..0000000
-- 
1.7.0.4
