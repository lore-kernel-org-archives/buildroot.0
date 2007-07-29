From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:15:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atstk1002 atstk1002/kernel-patches atst etc...
Message-ID: <20070729071537.99135A4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:15:35 -0700 (Sun, 29 Jul 2007)
New Revision: 19317

Log:
Add stk1002 target

Added:
   trunk/buildroot/target/device/Atmel/atstk1002/
   trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-linux-2.6.22.config
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config
   trunk/buildroot/target/device/Atmel/atstk1002/device_table.txt
   trunk/buildroot/target/device/Atmel/atstk1002/kernel-patches/
   trunk/buildroot/target/device/Atmel/atstk1002/kernel-patches/linux-2.6.22-atmel.3-avr32-updates.patch
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/TZ
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/asound.state
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/default/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/default/ntpdate
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/dnsmasq.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/fb.modes
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hostname
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/hosts.dnsmasq
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/httpd.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inetd.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K20alsa-utils
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K70sendsig
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K80netfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K85network
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/K90localfs
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S00mountvirtfs
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
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99gpio
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/S99splash
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcK
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/inittab
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/modules
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/mtab
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/network/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/ntp.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/passwd
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/protocols
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/samba/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/samba/smb.conf
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/samba/smbpasswd
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/services
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/shells
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/stk1000bootsplash.jpg
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/stk1000splash.jpg
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/usr/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/usr/share/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/usr/share/udhcpc/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/usr/share/udhcpc/default.script


Changeset:

Sorry, the patch is too large to include (21996 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19317
