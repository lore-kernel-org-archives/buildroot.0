From: Darius Augulis <augulis.darius@gmail.com>
Date: Mon, 12 Jul 2010 23:48:34 +0300
Subject: [Buildroot] [PATCH 2/2] Add target skeleton for Alix2d3
In-Reply-To: <20100712204654.17842.63829.stgit@darius-desktop>
References: <20100712204654.17842.63829.stgit@darius-desktop>
Message-ID: <20100712204834.17842.49951.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 target/device/pcengines/alix2d3/Makefile.in        |    1 
 .../pcengines/alix2d3/target_skeleton/bin/.empty   |    0 
 .../alix2d3/target_skeleton/boot/grub/grub.conf    |    9 +
 .../alix2d3/target_skeleton/boot/grub/menu.lst     |    9 +
 .../pcengines/alix2d3/target_skeleton/dev/log      |    1 
 .../alix2d3/target_skeleton/dev/pts/.empty         |    0 
 .../pcengines/alix2d3/target_skeleton/etc/TZ       |    1 
 .../pcengines/alix2d3/target_skeleton/etc/fstab    |    7 
 .../pcengines/alix2d3/target_skeleton/etc/group    |   17 +
 .../pcengines/alix2d3/target_skeleton/etc/hostname |    1 
 .../pcengines/alix2d3/target_skeleton/etc/hosts    |    1 
 .../alix2d3/target_skeleton/etc/init.d/S20urandom  |   54 ++++
 .../alix2d3/target_skeleton/etc/init.d/S40network  |   25 ++
 .../alix2d3/target_skeleton/etc/init.d/rcS         |   27 ++
 .../pcengines/alix2d3/target_skeleton/etc/inittab  |   43 +++
 .../pcengines/alix2d3/target_skeleton/etc/inputrc  |   44 +++
 .../pcengines/alix2d3/target_skeleton/etc/issue    |    3 
 .../target_skeleton/etc/ld.so.conf.d/.empty        |    0 
 .../pcengines/alix2d3/target_skeleton/etc/mtab     |    1 
 .../alix2d3/target_skeleton/etc/network/interfaces |    4 
 .../pcengines/alix2d3/target_skeleton/etc/passwd   |   15 +
 .../pcengines/alix2d3/target_skeleton/etc/profile  |   48 +++
 .../alix2d3/target_skeleton/etc/protocols          |   31 ++
 .../alix2d3/target_skeleton/etc/random-seed        |  Bin
 .../alix2d3/target_skeleton/etc/resolv.conf        |    1 
 .../alix2d3/target_skeleton/etc/securetty          |   35 ++
 .../pcengines/alix2d3/target_skeleton/etc/services |  302 ++++++++++++++++++++
 .../pcengines/alix2d3/target_skeleton/etc/shadow   |   12 +
 .../pcengines/alix2d3/target_skeleton/home/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/lib/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/mnt/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/opt/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/proc/.empty  |    0 
 .../alix2d3/target_skeleton/root/.bash_history     |    0 
 .../alix2d3/target_skeleton/root/.bash_logout      |    7 
 .../alix2d3/target_skeleton/root/.bash_profile     |   15 +
 .../pcengines/alix2d3/target_skeleton/root/.bashrc |   48 +++
 .../pcengines/alix2d3/target_skeleton/root/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/sbin/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/sys/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/tmp/.empty   |    0 
 .../alix2d3/target_skeleton/usr/bin/.empty         |    0 
 .../alix2d3/target_skeleton/usr/lib/.empty         |    0 
 .../alix2d3/target_skeleton/usr/sbin/.empty        |    0 
 .../usr/share/udhcpc/default.script                |   39 +++
 .../pcengines/alix2d3/target_skeleton/var/cache    |    1 
 .../alix2d3/target_skeleton/var/lib/pcmcia         |    1 
 .../pcengines/alix2d3/target_skeleton/var/lock     |    1 
 .../pcengines/alix2d3/target_skeleton/var/log      |    1 
 .../pcengines/alix2d3/target_skeleton/var/pcmcia   |    1 
 .../pcengines/alix2d3/target_skeleton/var/run      |    1 
 .../pcengines/alix2d3/target_skeleton/var/spool    |    1 
 .../pcengines/alix2d3/target_skeleton/var/tmp      |    1 
 53 files changed, 809 insertions(+), 0 deletions(-)
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/bin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/boot/grub/grub.conf
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/boot/grub/menu.lst
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/dev/log
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/dev/pts/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/TZ
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/fstab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/group
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/hostname
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/hosts
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S20urandom
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S40network
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/rcS
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/inittab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/inputrc
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/issue
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/ld.so.conf.d/.empty
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/etc/mtab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/network/interfaces
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/passwd
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/profile
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/protocols
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/random-seed
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/etc/resolv.conf
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/securetty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/services
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/shadow
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/home/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/lib/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/mnt/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/opt/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/proc/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_history
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_logout
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_profile
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bashrc
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/sbin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/sys/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/tmp/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/bin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/lib/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/sbin/.empty
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/usr/share/udhcpc/default.script
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/cache
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/lib/pcmcia
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/lock
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/log
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/pcmcia
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/run
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/spool
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/tmp

diff --git a/target/device/pcengines/alix2d3/Makefile.in b/target/device/pcengines/alix2d3/Makefile.in
index 90bc557..75c0c62 100644
--- a/target/device/pcengines/alix2d3/Makefile.in
+++ b/target/device/pcengines/alix2d3/Makefile.in
@@ -1,4 +1,5 @@
 ifeq ($(BR2_TARGET_PCENGINES_ALIX2D3),y)
 BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
 BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
 endif
diff --git a/target/device/pcengines/alix2d3/target_skeleton/bin/.empty b/target/device/pcengines/alix2d3/target_skeleton/bin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/boot/grub/grub.conf b/target/device/pcengines/alix2d3/target_skeleton/boot/grub/grub.conf
new file mode 100644
index 0000000..da22767
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/boot/grub/grub.conf
@@ -0,0 +1,9 @@
+serial --speed=115200
+terminal serial
+timeout 2
+default 0
+
+title Alix Buildroot Linux 2.6
+root (hd0,0)
+kernel /boot/bzImage root=/dev/hda1 rw console=ttyS0,115200n8
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/boot/grub/menu.lst b/target/device/pcengines/alix2d3/target_skeleton/boot/grub/menu.lst
new file mode 100644
index 0000000..da22767
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/boot/grub/menu.lst
@@ -0,0 +1,9 @@
+serial --speed=115200
+terminal serial
+timeout 2
+default 0
+
+title Alix Buildroot Linux 2.6
+root (hd0,0)
+kernel /boot/bzImage root=/dev/hda1 rw console=ttyS0,115200n8
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/dev/log b/target/device/pcengines/alix2d3/target_skeleton/dev/log
new file mode 120000
index 0000000..d96b3b1
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/dev/log
@@ -0,0 +1 @@
+../tmp/log
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/dev/pts/.empty b/target/device/pcengines/alix2d3/target_skeleton/dev/pts/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/TZ b/target/device/pcengines/alix2d3/target_skeleton/etc/TZ
new file mode 100644
index 0000000..9fcb2a3
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/TZ
@@ -0,0 +1 @@
+MST7MDT
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/fstab b/target/device/pcengines/alix2d3/target_skeleton/etc/fstab
new file mode 100644
index 0000000..5e2e93d
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/fstab
@@ -0,0 +1,7 @@
+# /etc/fstab: static file system information.
+#
+# <file system> <mount pt>     <type>	<options>         <dump> <pass>
+proc		/proc	       proc     defaults	  0	 0
+devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
+tmpfs           /tmp           tmpfs    defaults          0      0
+sysfs		/sys	       sysfs    defaults	  0	 0
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/group b/target/device/pcengines/alix2d3/target_skeleton/etc/group
new file mode 100644
index 0000000..c600be0
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/group
@@ -0,0 +1,17 @@
+root:x:0:
+daemon:x:1:
+bin:x:2:
+sys:x:3:
+adm:x:4:
+tty:x:5:
+disk:x:6:
+wheel:x:10:root
+utmp:x:43:
+staff:x:50:
+haldaemon:x:68:
+dbus:x:81:
+netdev:x:82:
+nobody:x:99:
+nogroup:x:99:
+users:x:100:
+default:x:1000:
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/hostname b/target/device/pcengines/alix2d3/target_skeleton/etc/hostname
new file mode 100644
index 0000000..5b26b35
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/hostname
@@ -0,0 +1 @@
+buildroot
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/hosts b/target/device/pcengines/alix2d3/target_skeleton/etc/hosts
new file mode 100644
index 0000000..ba712fe
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/hosts
@@ -0,0 +1 @@
+127.0.0.1	localhost
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S20urandom b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S20urandom
new file mode 100755
index 0000000..f73cea5
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S20urandom
@@ -0,0 +1,54 @@
+#! /bin/sh
+#
+# urandom	This script saves the random seed between reboots.
+#		It is called from the boot, halt and reboot scripts.
+#
+# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
+#
+
+[ -c /dev/urandom ] || exit 0
+#. /etc/default/rcS
+
+case "$1" in
+	start|"")
+		if [ "$VERBOSE" != no ]
+		then
+			echo -n "Initializing random number generator... "
+		fi
+		# Load and then save 512 bytes,
+		# which is the size of the entropy pool
+		if [ -f /etc/random-seed ]
+		then
+			cat /etc/random-seed >/dev/urandom
+		fi
+		# check for read only file system
+		if ! touch /etc/random-seed 2>/dev/null
+		then
+			echo "read-only file system detected...done"
+			exit
+		fi
+		rm -f /etc/random-seed
+		umask 077
+		dd if=/dev/urandom of=/etc/random-seed count=1 \
+			>/dev/null 2>&1 || echo "urandom start: failed."
+		umask 022
+		[ "$VERBOSE" != no ] && echo "done."
+		;;
+	stop)
+		if ! touch /etc/random-seed 2>/dev/null
+                then
+                        exit
+                fi
+		# Carry a random seed from shut-down to start-up;
+		# see documentation in linux/drivers/char/random.c
+		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
+		umask 077
+		dd if=/dev/urandom of=/etc/random-seed count=1 \
+			>/dev/null 2>&1 || echo "urandom stop: failed."
+		[ "$VERBOSE" != no ] && echo "done."
+		;;
+	*)
+		echo "Usage: urandom {start|stop}" >&2
+		exit 1
+		;;
+esac
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S40network b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S40network
new file mode 100755
index 0000000..ad6d250
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S40network
@@ -0,0 +1,25 @@
+#!/bin/sh
+#
+# Start the network....
+#
+
+case "$1" in
+  start)
+ 	echo "Starting network..."
+	/sbin/ifup -a
+	;;
+  stop)
+	echo -n "Stopping network..."
+	/sbin/ifdown -a
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/rcS b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/rcS
new file mode 100755
index 0000000..de41153
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/init.d/rcS
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+
+# Start all init scripts in /etc/init.d
+# executing them in numerical order.
+#
+for i in /etc/init.d/S??* ;do
+
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set start
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i start
+	    ;;
+    esac
+done
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/inittab b/target/device/pcengines/alix2d3/target_skeleton/etc/inittab
new file mode 100644
index 0000000..eb4b658
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/inittab
@@ -0,0 +1,43 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+null::sysinit:/bin/mount -o remount,rw,noatime,nodiratime,norelatime /
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+
+# Load modules
+null::sysinit:/sbin/modprobe via-rhine
+null::sysinit:/sbin/modprobe ehci-hcd
+null::sysinit:/sbin/modprobe ohci-hcd
+null::sysinit:/sbin/modprobe ath5k
+
+# Mount usbfs
+null::sysinit:/bin/mount -t usbfs none /proc/bus/usb
+
+# Init networking
+null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
+null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
+null::sysinit:/sbin/ifconfig eth0 192.168.1.1 up
+null::sysinit:/sbin/ifconfig eth1 up
+null::sysinit:/sbin/ifconfig eth2 up
+
+# Put a getty on the serial port
+ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
+
+# Unmout all fs on shutdown
+null::shutdown:/bin/umount -a -r
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/inputrc b/target/device/pcengines/alix2d3/target_skeleton/etc/inputrc
new file mode 100644
index 0000000..2f1cb60
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/inputrc
@@ -0,0 +1,44 @@
+# /etc/inputrc - global inputrc for libreadline
+# See readline(3readline) and `info readline' for more information.
+
+# Be 8 bit clean.
+set input-meta on
+set output-meta on
+set bell-style visible
+
+# To allow the use of 8bit-characters like the german umlauts, comment out
+# the line below. However this makes the meta key not work as a meta key,
+# which is annoying to those which don't need to type in 8-bit characters.
+
+# set convert-meta off
+
+"\e0d": backward-word
+"\e0c": forward-word
+"\e[h": beginning-of-line
+"\e[f": end-of-line
+"\e[1~": beginning-of-line
+"\e[4~": end-of-line
+#"\e[5~": beginning-of-history
+#"\e[6~": end-of-history
+"\e[3~": delete-char
+"\e[2~": quoted-insert
+
+# Common standard keypad and cursor
+# (codes courtsey Werner Fink, <werner@suse.de>)
+#"\e[1~": history-search-backward
+"\e[2~": yank
+"\e[3~": delete-char
+#"\e[4~": set-mark
+"\e[5~": history-search-backward
+"\e[6~": history-search-forward
+# Normal keypad and cursor of xterm
+"\e[F": end-of-line
+"\e[H": beginning-of-line
+# Application keypad and cursor of xterm
+"\eOA": previous-history
+"\eOC": forward-char
+"\eOB": next-history
+"\eOD": backward-char
+"\eOF": end-of-line
+"\eOH": beginning-of-line
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/issue b/target/device/pcengines/alix2d3/target_skeleton/etc/issue
new file mode 100644
index 0000000..90f1779
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/issue
@@ -0,0 +1,3 @@
+
+Welcome to Buildroot
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/ld.so.conf.d/.empty b/target/device/pcengines/alix2d3/target_skeleton/etc/ld.so.conf.d/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/mtab b/target/device/pcengines/alix2d3/target_skeleton/etc/mtab
new file mode 120000
index 0000000..e1c2045
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/mtab
@@ -0,0 +1 @@
+../proc/mounts
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/network/interfaces b/target/device/pcengines/alix2d3/target_skeleton/etc/network/interfaces
new file mode 100644
index 0000000..218b82c
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/network/interfaces
@@ -0,0 +1,4 @@
+# Configure Loopback
+auto lo
+iface lo inet loopback
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/passwd b/target/device/pcengines/alix2d3/target_skeleton/etc/passwd
new file mode 100644
index 0000000..377d4df
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/passwd
@@ -0,0 +1,15 @@
+root:x:0:0:root:/root:/bin/sh
+daemon:x:1:1:daemon:/usr/sbin:/bin/sh
+bin:x:2:2:bin:/bin:/bin/sh
+sys:x:3:3:sys:/dev:/bin/sh
+sync:x:4:100:sync:/bin:/bin/sync
+mail:x:8:8:mail:/var/spool/mail:/bin/sh
+proxy:x:13:13:proxy:/bin:/bin/sh
+www-data:x:33:33:www-data:/var/www:/bin/sh
+backup:x:34:34:backup:/var/backups:/bin/sh
+operator:x:37:37:Operator:/var:/bin/sh
+haldaemon:x:68:68:hald:/:/bin/sh
+dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
+nobody:x:99:99:nobody:/home:/bin/sh
+sshd:x:103:99:Operator:/var:/bin/sh
+default:x:1000:1000:Default non-root user:/home/default:/bin/sh
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/profile b/target/device/pcengines/alix2d3/target_skeleton/etc/profile
new file mode 100644
index 0000000..979a446
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/profile
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+    if [ "$BASH" ]; then
+	export PS1="[\u@\h \W]\\$ "
+	alias ll='/bin/ls --color=tty -laFh'
+	alias ls='/bin/ls --color=tty -F'
+	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+    else
+      if [ "`id -u`" -eq 0 ]; then 
+	export PS1='[\u@\h \w]# '
+      else
+	export PS1='[\u@\h \w]$ '
+      fi
+    fi
+
+    export USER=`id -un`
+    export LOGNAME=$USER
+    export HOSTNAME=`/bin/hostname`
+    export HISTSIZE=1000
+    export HISTFILESIZE=1000
+    export PAGER='/bin/more '
+    export EDITOR='/bin/vi'
+    export INPUTRC=/etc/inputrc
+    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+
+    ### Some aliases
+    alias ps2='ps facux '
+    alias ps1='ps faxo "%U %t %p %a" '
+    alias af='ps af'
+    alias cls='clear'
+    alias df='df -h'
+    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
+    #alias bc='bc -l'
+    alias minicom='minicom -c on'
+    alias calc='calc -Cd '
+    alias bc='calc -Cd '
+fi;
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/protocols b/target/device/pcengines/alix2d3/target_skeleton/etc/protocols
new file mode 100644
index 0000000..1ac8a40
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/protocols
@@ -0,0 +1,31 @@
+# /etc/protocols:
+# $Id: protocols,v 1.1 2004/10/09 02:49:18 andersen Exp $
+#
+# Internet (IP) protocols
+#
+#	from: @(#)protocols	5.1 (Berkeley) 4/17/89
+#
+# Updated for NetBSD based on RFC 1340, Assigned Numbers (July 1992).
+
+ip	0	IP		# internet protocol, pseudo protocol number
+icmp	1	ICMP		# internet control message protocol
+igmp	2	IGMP		# Internet Group Management
+ggp	3	GGP		# gateway-gateway protocol
+ipencap	4	IP-ENCAP	# IP encapsulated in IP (officially ``IP'')
+st	5	ST		# ST datagram mode
+tcp	6	TCP		# transmission control protocol
+egp	8	EGP		# exterior gateway protocol
+pup	12	PUP		# PARC universal packet protocol
+udp	17	UDP		# user datagram protocol
+hmp	20	HMP		# host monitoring protocol
+xns-idp	22	XNS-IDP		# Xerox NS IDP
+rdp	27	RDP		# "reliable datagram" protocol
+iso-tp4	29	ISO-TP4		# ISO Transport Protocol class 4
+xtp	36	XTP		# Xpress Tranfer Protocol
+ddp	37	DDP		# Datagram Delivery Protocol
+idpr-cmtp	39	IDPR-CMTP	# IDPR Control Message Transport
+rspf	73	RSPF		#Radio Shortest Path First.
+vmtp	81	VMTP		# Versatile Message Transport
+ospf	89	OSPFIGP		# Open Shortest Path First IGP
+ipip	94	IPIP		# Yet Another IP encapsulation
+encap	98	ENCAP		# Yet Another IP encapsulation
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/random-seed b/target/device/pcengines/alix2d3/target_skeleton/etc/random-seed
new file mode 100644
index 0000000000000000000000000000000000000000..f26038adc5d057a0b9d6ce5d3cda02ccb4a4d12e
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/resolv.conf b/target/device/pcengines/alix2d3/target_skeleton/etc/resolv.conf
new file mode 120000
index 0000000..71f6f96
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/resolv.conf
@@ -0,0 +1 @@
+../tmp/resolv.conf
\ No newline@end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/securetty b/target/device/pcengines/alix2d3/target_skeleton/etc/securetty
new file mode 100644
index 0000000..b25f4a5
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/securetty
@@ -0,0 +1,35 @@
+tty1
+tty2
+tty3
+tty4
+tty5
+tty6
+tty7
+tty8
+ttyS0
+ttyS1
+ttyS2
+ttyS3
+ttyAMA0
+ttyAMA1
+ttyAMA2
+ttyAMA3
+ttySAC0
+ttySAC1
+ttySAC2
+ttySAC3
+ttyUL0
+ttyUL1
+ttyUL2
+ttyUL3
+ttyPSC0
+ttyPSC1
+ttyPSC2
+ttyPSC3
+ttyCPM0
+ttyCPM1
+ttyCPM2
+ttyCPM3
+ttymxc0
+ttymxc1
+ttymxc2
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/services b/target/device/pcengines/alix2d3/target_skeleton/etc/services
new file mode 100644
index 0000000..b287b63
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/services
@@ -0,0 +1,302 @@
+# /etc/services:
+# $Id: services,v 1.1 2004/10/09 02:49:18 andersen Exp $
+#
+# Network services, Internet style
+#
+# Note that it is presently the policy of IANA to assign a single well-known
+# port number for both TCP and UDP; hence, most entries here have two entries
+# even if the protocol doesn't support UDP operations.
+# Updated from RFC 1700, ``Assigned Numbers'' (October 1994).  Not all ports
+# are included, only the more common ones.
+
+tcpmux		1/tcp				# TCP port service multiplexer
+echo		7/tcp
+echo		7/udp
+discard		9/tcp		sink null
+discard		9/udp		sink null
+systat		11/tcp		users
+daytime		13/tcp
+daytime		13/udp
+netstat		15/tcp
+qotd		17/tcp		quote
+msp		18/tcp				# message send protocol
+msp		18/udp				# message send protocol
+chargen		19/tcp		ttytst source
+chargen		19/udp		ttytst source
+ftp-data	20/tcp
+ftp		21/tcp
+fsp		21/udp		fspd
+ssh		22/tcp				# SSH Remote Login Protocol
+ssh		22/udp				# SSH Remote Login Protocol
+telnet		23/tcp
+# 24 - private
+smtp		25/tcp		mail
+# 26 - unassigned
+time		37/tcp		timserver
+time		37/udp		timserver
+rlp		39/udp		resource	# resource location
+nameserver	42/tcp		name		# IEN 116
+whois		43/tcp		nicname
+re-mail-ck	50/tcp				# Remote Mail Checking Protocol
+re-mail-ck	50/udp				# Remote Mail Checking Protocol
+domain		53/tcp		nameserver	# name-domain server
+domain		53/udp		nameserver
+mtp		57/tcp				# deprecated
+bootps		67/tcp				# BOOTP server
+bootps		67/udp
+bootpc		68/tcp				# BOOTP client
+bootpc		68/udp
+tftp		69/udp
+gopher		70/tcp				# Internet Gopher
+gopher		70/udp
+rje		77/tcp		netrjs
+finger		79/tcp
+www		80/tcp		http		# WorldWideWeb HTTP
+www		80/udp				# HyperText Transfer Protocol
+link		87/tcp		ttylink
+kerberos	88/tcp		kerberos5 krb5	# Kerberos v5
+kerberos	88/udp		kerberos5 krb5	# Kerberos v5
+supdup		95/tcp
+# 100 - reserved
+hostnames	101/tcp		hostname	# usually from sri-nic
+iso-tsap	102/tcp		tsap		# part of ISODE.
+csnet-ns	105/tcp		cso-ns		# also used by CSO name server
+csnet-ns	105/udp		cso-ns
+# unfortunately the poppassd (Eudora) uses a port which has already
+# been assigned to a different service. We list the poppassd as an
+# alias here. This should work for programs asking for this service.
+# (due to a bug in inetd the 3com-tsmux line is disabled)
+#3com-tsmux	106/tcp		poppassd
+#3com-tsmux	106/udp		poppassd
+rtelnet		107/tcp				# Remote Telnet
+rtelnet		107/udp
+pop-2		109/tcp		postoffice	# POP version 2
+pop-2		109/udp
+pop-3		110/tcp				# POP version 3
+pop-3		110/udp
+sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper TCP
+sunrpc		111/udp		portmapper	# RPC 4.0 portmapper UDP
+auth		113/tcp		authentication tap ident
+sftp		115/tcp
+uucp-path	117/tcp
+nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
+ntp		123/tcp
+ntp		123/udp				# Network Time Protocol
+netbios-ns	137/tcp				# NETBIOS Name Service
+netbios-ns	137/udp
+netbios-dgm	138/tcp				# NETBIOS Datagram Service
+netbios-dgm	138/udp
+netbios-ssn	139/tcp				# NETBIOS session service
+netbios-ssn	139/udp
+imap2		143/tcp				# Interim Mail Access Proto v2
+imap2		143/udp
+snmp		161/udp				# Simple Net Mgmt Proto
+snmp-trap	162/udp		snmptrap	# Traps for SNMP
+cmip-man	163/tcp				# ISO mgmt over IP (CMOT)
+cmip-man	163/udp
+cmip-agent	164/tcp
+cmip-agent	164/udp
+xdmcp		177/tcp				# X Display Mgr. Control Proto
+xdmcp		177/udp
+nextstep	178/tcp		NeXTStep NextStep	# NeXTStep window
+nextstep	178/udp		NeXTStep NextStep	# server
+bgp		179/tcp				# Border Gateway Proto.
+bgp		179/udp
+prospero	191/tcp				# Cliff Neuman's Prospero
+prospero	191/udp
+irc		194/tcp				# Internet Relay Chat
+irc		194/udp
+smux		199/tcp				# SNMP Unix Multiplexer
+smux		199/udp
+at-rtmp		201/tcp				# AppleTalk routing
+at-rtmp		201/udp
+at-nbp		202/tcp				# AppleTalk name binding
+at-nbp		202/udp
+at-echo		204/tcp				# AppleTalk echo
+at-echo		204/udp
+at-zis		206/tcp				# AppleTalk zone information
+at-zis		206/udp
+qmtp		209/tcp				# The Quick Mail Transfer Protocol
+qmtp		209/udp				# The Quick Mail Transfer Protocol
+z3950		210/tcp		wais		# NISO Z39.50 database
+z3950		210/udp		wais
+ipx		213/tcp				# IPX
+ipx		213/udp
+imap3		220/tcp				# Interactive Mail Access
+imap3		220/udp				# Protocol v3
+ulistserv	372/tcp				# UNIX Listserv
+ulistserv	372/udp
+https		443/tcp				# MCom
+https		443/udp				# MCom
+snpp		444/tcp				# Simple Network Paging Protocol
+snpp		444/udp				# Simple Network Paging Protocol
+saft		487/tcp				# Simple Asynchronous File Transfer
+saft		487/udp				# Simple Asynchronous File Transfer
+npmp-local	610/tcp		dqs313_qmaster	# npmp-local / DQS
+npmp-local	610/udp		dqs313_qmaster	# npmp-local / DQS
+npmp-gui	611/tcp		dqs313_execd	# npmp-gui / DQS
+npmp-gui	611/udp		dqs313_execd	# npmp-gui / DQS
+hmmp-ind	612/tcp		dqs313_intercell# HMMP Indication / DQS
+hmmp-ind	612/udp		dqs313_intercell# HMMP Indication / DQS
+#
+# UNIX specific services
+#
+exec		512/tcp
+biff		512/udp		comsat
+login		513/tcp
+who		513/udp		whod
+shell		514/tcp		cmd		# no passwords used
+syslog		514/udp
+printer		515/tcp		spooler		# line printer spooler
+talk		517/udp
+ntalk		518/udp
+route		520/udp		router routed	# RIP
+timed		525/udp		timeserver
+tempo		526/tcp		newdate
+courier		530/tcp		rpc
+conference	531/tcp		chat
+netnews		532/tcp		readnews
+netwall		533/udp				# -for emergency broadcasts
+uucp		540/tcp		uucpd		# uucp daemon
+afpovertcp	548/tcp				# AFP over TCP
+afpovertcp	548/udp				# AFP over TCP
+remotefs	556/tcp		rfs_server rfs	# Brunhoff remote filesystem
+klogin		543/tcp				# Kerberized `rlogin' (v5)
+kshell		544/tcp		krcmd		# Kerberized `rsh' (v5)
+kerberos-adm	749/tcp				# Kerberos `kadmin' (v5)
+#
+webster		765/tcp				# Network dictionary
+webster		765/udp
+#
+# From ``Assigned Numbers'':
+#
+#> The Registered Ports are not controlled by the IANA and on most systems
+#> can be used by ordinary user processes or programs executed by ordinary
+#> users.
+#
+#> Ports are used in the TCP [45,106] to name the ends of logical
+#> connections which carry long term conversations.  For the purpose of
+#> providing services to unknown callers, a service contact port is
+#> defined.  This list specifies the port used by the server process as its
+#> contact port.  While the IANA can not control uses of these ports it
+#> does register or list uses of these ports as a convienence to the
+#> community.
+#
+nfsdstatus	1110/tcp
+nfsd-keepalive	1110/udp
+
+ingreslock	1524/tcp
+ingreslock	1524/udp
+prospero-np	1525/tcp			# Prospero non-privileged
+prospero-np	1525/udp
+datametrics	1645/tcp	old-radius	# datametrics / old radius entry
+datametrics	1645/udp	old-radius	# datametrics / old radius entry
+sa-msg-port	1646/tcp	old-radacct	# sa-msg-port / old radacct entry
+sa-msg-port	1646/udp	old-radacct	# sa-msg-port / old radacct entry
+radius		1812/tcp			# Radius
+radius		1812/udp			# Radius
+radacct		1813/tcp			# Radius Accounting
+radacct		1813/udp			# Radius Accounting
+nfsd		2049/tcp	nfs
+nfsd		2049/udp	nfs
+cvspserver	2401/tcp			# CVS client/server operations
+cvspserver	2401/udp			# CVS client/server operations
+mysql		3306/tcp			# MySQL
+mysql		3306/udp			# MySQL
+rfe		5002/tcp			# Radio Free Ethernet
+rfe		5002/udp			# Actually uses UDP only
+cfengine	5308/tcp			# CFengine
+cfengine	5308/udp			# CFengine
+bbs		7000/tcp			# BBS service
+#
+#
+# Kerberos (Project Athena/MIT) services
+# Note that these are for Kerberos v4, and are unofficial.  Sites running
+# v4 should uncomment these and comment out the v5 entries above.
+#
+kerberos4	750/udp		kerberos-iv kdc	# Kerberos (server) udp
+kerberos4	750/tcp		kerberos-iv kdc	# Kerberos (server) tcp
+kerberos_master	751/udp				# Kerberos authentication
+kerberos_master	751/tcp				# Kerberos authentication
+passwd_server	752/udp				# Kerberos passwd server
+krb_prop	754/tcp				# Kerberos slave propagation
+krbupdate	760/tcp		kreg		# Kerberos registration
+kpasswd		761/tcp		kpwd		# Kerberos "passwd"
+kpop		1109/tcp			# Pop with Kerberos
+knetd		2053/tcp			# Kerberos de-multiplexor
+zephyr-srv	2102/udp			# Zephyr server
+zephyr-clt	2103/udp			# Zephyr serv-hm connection
+zephyr-hm	2104/udp			# Zephyr hostmanager
+eklogin		2105/tcp			# Kerberos encrypted rlogin
+#
+# Unofficial but necessary (for NetBSD) services
+#
+supfilesrv	871/tcp				# SUP server
+supfiledbg	1127/tcp			# SUP debugging
+#
+# Datagram Delivery Protocol services
+#
+rtmp		1/ddp				# Routing Table Maintenance Protocol
+nbp		2/ddp				# Name Binding Protocol
+echo		4/ddp				# AppleTalk Echo Protocol
+zip		6/ddp				# Zone Information Protocol
+#
+# Services added for the Debian GNU/Linux distribution
+poppassd	106/tcp				# Eudora
+poppassd	106/udp				# Eudora
+mailq		174/tcp				# Mailer transport queue for Zmailer
+mailq		174/tcp				# Mailer transport queue for Zmailer
+omirr		808/tcp		omirrd		# online mirror
+omirr		808/udp		omirrd		# online mirror
+rmtcfg		1236/tcp			# Gracilis Packeten remote config server
+xtel		1313/tcp			# french minitel
+coda_opcons	1355/udp			# Coda opcons            (Coda fs)
+coda_venus	1363/udp			# Coda venus             (Coda fs)
+coda_auth	1357/udp			# Coda auth              (Coda fs)
+coda_udpsrv	1359/udp			# Coda udpsrv            (Coda fs)
+coda_filesrv	1361/udp			# Coda filesrv           (Coda fs)
+codacon		1423/tcp	venus.cmu	# Coda Console           (Coda fs)
+coda_aux1	1431/tcp			# coda auxiliary service (Coda fs)
+coda_aux1	1431/udp			# coda auxiliary service (Coda fs)
+coda_aux2	1433/tcp			# coda auxiliary service (Coda fs)
+coda_aux2	1433/udp			# coda auxiliary service (Coda fs)
+coda_aux3	1435/tcp			# coda auxiliary service (Coda fs)
+coda_aux3	1435/udp			# coda auxiliary service (Coda fs)
+cfinger		2003/tcp			# GNU Finger
+afbackup	2988/tcp			# Afbackup system
+afbackup	2988/udp			# Afbackup system
+icp		3130/tcp			# Internet Cache Protocol (Squid)
+icp		3130/udp			# Internet Cache Protocol (Squid)
+postgres	5432/tcp			# POSTGRES
+postgres	5432/udp			# POSTGRES
+fax		4557/tcp			# FAX transmission service        (old)
+hylafax		4559/tcp			# HylaFAX client-server protocol  (new)
+noclog		5354/tcp			# noclogd with TCP (nocol)
+noclog		5354/udp			# noclogd with UDP (nocol)
+hostmon		5355/tcp			# hostmon uses TCP (nocol)
+hostmon		5355/udp			# hostmon uses TCP (nocol)
+ircd		6667/tcp			# Internet Relay Chat
+ircd		6667/udp			# Internet Relay Chat
+webcache	8080/tcp			# WWW caching service
+webcache	8080/udp			# WWW caching service
+tproxy		8081/tcp			# Transparent Proxy
+tproxy		8081/udp			# Transparent Proxy
+mandelspawn	9359/udp	mandelbrot	# network mandelbrot
+amanda		10080/udp			# amanda backup services
+amandaidx	10082/tcp			# amanda backup services
+amidxtape	10083/tcp			# amanda backup services
+isdnlog		20011/tcp			# isdn logging system
+isdnlog		20011/udp			# isdn logging system
+vboxd		20012/tcp			# voice box system
+vboxd		20012/udp			# voice box system
+binkp           24554/tcp			# Binkley
+binkp           24554/udp			# Binkley
+asp		27374/tcp			# Address Search Protocol
+asp		27374/udp			# Address Search Protocol
+tfido           60177/tcp			# Ifmail
+tfido           60177/udp			# Ifmail
+fido            60179/tcp			# Ifmail
+fido            60179/udp			# Ifmail
+
+# Local services
+
diff --git a/target/device/pcengines/alix2d3/target_skeleton/etc/shadow b/target/device/pcengines/alix2d3/target_skeleton/etc/shadow
new file mode 100644
index 0000000..4941a1a
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/etc/shadow
@@ -0,0 +1,12 @@
+root::10933:0:99999:7:::
+bin:*:10933:0:99999:7:::
+daemon:*:10933:0:99999:7:::
+adm:*:10933:0:99999:7:::
+lp:*:10933:0:99999:7:::
+sync:*:10933:0:99999:7:::
+shutdown:*:10933:0:99999:7:::
+halt:*:10933:0:99999:7:::
+uucp:*:10933:0:99999:7:::
+operator:*:10933:0:99999:7:::
+nobody:*:10933:0:99999:7:::
+default::10933:0:99999:7:::
diff --git a/target/device/pcengines/alix2d3/target_skeleton/home/.empty b/target/device/pcengines/alix2d3/target_skeleton/home/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/lib/.empty b/target/device/pcengines/alix2d3/target_skeleton/lib/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/mnt/.empty b/target/device/pcengines/alix2d3/target_skeleton/mnt/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/opt/.empty b/target/device/pcengines/alix2d3/target_skeleton/opt/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/proc/.empty b/target/device/pcengines/alix2d3/target_skeleton/proc/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/root/.bash_history b/target/device/pcengines/alix2d3/target_skeleton/root/.bash_history
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/root/.bash_logout b/target/device/pcengines/alix2d3/target_skeleton/root/.bash_logout
new file mode 100644
index 0000000..77ef1f9
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/root/.bash_logout
@@ -0,0 +1,7 @@
+# ~/.bash_logout: executed by bash(1) when login shell exits.
+
+# when leaving the console clear the screen to increase privacy
+
+case "`tty`" in
+    /dev/tty[0-9]*) clear
+esac
diff --git a/target/device/pcengines/alix2d3/target_skeleton/root/.bash_profile b/target/device/pcengines/alix2d3/target_skeleton/root/.bash_profile
new file mode 100644
index 0000000..27bf149
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/root/.bash_profile
@@ -0,0 +1,15 @@
+# .bash_profile
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+umask 022
+
+if [ -f ~/.bashrc ]; then
+    source ~/.bashrc
+fi
diff --git a/target/device/pcengines/alix2d3/target_skeleton/root/.bashrc b/target/device/pcengines/alix2d3/target_skeleton/root/.bashrc
new file mode 100644
index 0000000..d13c8f9
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/root/.bashrc
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+    if [ "$BASH" ]; then
+	export PS1="[\u@\h \W]\\$ "
+    else
+      if [ "`id -u`" -eq 0 ]; then 
+	export PS1='# '
+      else
+	export PS1='$ '
+      fi
+    fi
+
+    export USER=`id -un`
+    export LOGNAME=$USER
+    export HOSTNAME=`/bin/hostname`
+    export HISTSIZE=1000
+    export HISTFILESIZE=1000
+    export PAGER='/bin/more '
+    export EDITOR='/bin/vi'
+    export INPUTRC=/etc/inputrc
+    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+
+    ### Some aliases
+    alias ps2='ps facux '
+    alias ps1='ps faxo "%U %t %p %a" '
+    alias af='ps af'
+    alias cls='clear'
+    alias ll='/bin/ls --color=tty -laFh'
+    alias ls='/bin/ls --color=tty -F'
+    alias df='df -h'
+    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
+    #alias bc='bc -l'
+    alias minicom='minicom -c on'
+    alias calc='calc -Cd '
+    alias bc='calc -Cd '
+fi;
diff --git a/target/device/pcengines/alix2d3/target_skeleton/root/.empty b/target/device/pcengines/alix2d3/target_skeleton/root/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/sbin/.empty b/target/device/pcengines/alix2d3/target_skeleton/sbin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/sys/.empty b/target/device/pcengines/alix2d3/target_skeleton/sys/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/tmp/.empty b/target/device/pcengines/alix2d3/target_skeleton/tmp/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/usr/bin/.empty b/target/device/pcengines/alix2d3/target_skeleton/usr/bin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/usr/lib/.empty b/target/device/pcengines/alix2d3/target_skeleton/usr/lib/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/usr/sbin/.empty b/target/device/pcengines/alix2d3/target_skeleton/usr/sbin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/pcengines/alix2d3/target_skeleton/usr/share/udhcpc/default.script b/target/device/pcengines/alix2d3/target_skeleton/usr/share/udhcpc/default.script
new file mode 100755
index 0000000..a52a7f8
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/usr/share/udhcpc/default.script
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# udhcpc script edited by Tim Riker <Tim@Rikers.org>
+
+[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
+
+RESOLV_CONF="/etc/resolv.conf"
+[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
+[ -n "$subnet" ] && NETMASK="netmask $subnet"
+
+case "$1" in
+	deconfig)
+		/sbin/ifconfig $interface 0.0.0.0
+		;;
+
+	renew|bound)
+		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+
+		if [ -n "$router" ] ; then
+			echo "deleting routers"
+			while route del default gw 0.0.0.0 dev $interface ; do
+				:
+			done
+
+			for i in $router ; do
+				route add default gw $i dev $interface
+			done
+		fi
+
+		echo -n > $RESOLV_CONF
+		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
+		for i in $dns ; do
+			echo adding dns $i
+			echo nameserver $i >> $RESOLV_CONF
+		done
+		;;
+esac
+
+exit 0
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/cache b/target/device/pcengines/alix2d3/target_skeleton/var/cache
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/cache
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/lib/pcmcia b/target/device/pcengines/alix2d3/target_skeleton/var/lib/pcmcia
new file mode 120000
index 0000000..f1fde8c
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/lib/pcmcia
@@ -0,0 +1 @@
+../../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/lock b/target/device/pcengines/alix2d3/target_skeleton/var/lock
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/lock
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/log b/target/device/pcengines/alix2d3/target_skeleton/var/log
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/log
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/pcmcia b/target/device/pcengines/alix2d3/target_skeleton/var/pcmcia
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/pcmcia
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/run b/target/device/pcengines/alix2d3/target_skeleton/var/run
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/run
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/spool b/target/device/pcengines/alix2d3/target_skeleton/var/spool
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/spool
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/pcengines/alix2d3/target_skeleton/var/tmp b/target/device/pcengines/alix2d3/target_skeleton/var/tmp
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/target_skeleton/var/tmp
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
