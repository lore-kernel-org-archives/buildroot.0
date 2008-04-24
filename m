From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 04:22:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atstk100x atstk100x/kernel-patches atst etc...
Message-ID: <20080424112206.CFC8A3C819@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 04:22:06 -0700 (Thu, 24 Apr 2008)
New Revision: 21830

Log:
This patch renames the Atmel atstk1002 target board to a more generic atstk100x name. This to make it easier to add support for other CPU-boards than atstk1002.
Submitted by Hans-Christian Egtvedt

Added:
   trunk/buildroot/target/device/Atmel/atstk100x/
   trunk/buildroot/target/device/Atmel/atstk100x/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.22.10.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.23.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.24.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-no-mplayer_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/busybox-1.9.1.config
   trunk/buildroot/target/device/Atmel/atstk100x/device_table.txt
   trunk/buildroot/target/device/Atmel/atstk100x/kernel-patches/
   trunk/buildroot/target/device/Atmel/atstk100x/kernel-patches/linux-2.6.23-200-gpio_mouse-setup-for-atstk1000-board.patch
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/TZ
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/asound.state
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/default/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/default/ntpdate
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/dnsmasq.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/fb.modes
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/hostname
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/hosts.dnsmasq
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/httpd.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/inetd.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K20alsa-utils
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K70sendsig
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K80netfs
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K85network
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K90localfs
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S00mountvirtfs
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S01hotplug
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S02hostname
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S03bootsplash
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S08syslog
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S09klog
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S10modules-init
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S15localfs
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S20network
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S40telnetd
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S41inetd
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S42httpd
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S43ntp
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S49netfs
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S50alsa-utils
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99splash
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/rcK
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/inittab
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/mdev.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/modules
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/mplayer.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/mtab
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/network/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/ntp.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/passwd
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/proftpd.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/protocols
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/samba/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/samba/smb.conf
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/samba/smbpasswd
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/services
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/shadow
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/etc/shells
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/root/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/root/.bash_logout
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/root/.bash_profile
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/root/.bashrc
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/usr/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/usr/share/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/usr/share/udhcpc/
   trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/usr/share/udhcpc/default.script

Removed:
   trunk/buildroot/target/device/Atmel/atstk1002/

Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:

Sorry, the patch is too large to include (11861 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21830
