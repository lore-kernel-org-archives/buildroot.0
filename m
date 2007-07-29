From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:17:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100 atngw100/kernel-patches atngw1 etc...
Message-ID: <20070729071703.D8BC2A606E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:17:01 -0700 (Sun, 29 Jul 2007)
New Revision: 19318

Log:
Add atngw100 target

Added:
   trunk/buildroot/target/device/Atmel/atngw100/
   trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.22.config
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config
   trunk/buildroot/target/device/Atmel/atngw100/device_table.txt
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/linux-2.6.22-atmel.3-avr32-updates.patch
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/TZ
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/default/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/default/ntpdate
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/dnsmasq.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/ethers
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hostname
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/hosts.dnsmasq
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/httpd.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S21dnsmasq
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcK
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/inittab
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/modules
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/mtab
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/network/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/ntp.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/protocols
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/samba/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/samba/smb.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/samba/smbpasswd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/services
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/shells
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/usr/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/usr/share/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/usr/share/udhcpc/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/usr/share/udhcpc/default.script


Changeset:

Sorry, the patch is too large to include (21775 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19318
