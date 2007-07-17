From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:19:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	DataFlashBoot Linux Linux/kernel-patche etc...
Message-ID: <20070717121958.DBBA4A683E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:19:56 -0700 (Tue, 17 Jul 2007)
New Revision: 19133

Log:
Add AT91 targets

Added:
   trunk/buildroot/target/device/Atmel/AT91_Config.in
   trunk/buildroot/target/device/Atmel/AVR32_Config.in
   trunk/buildroot/target/device/Atmel/DataFlashBoot/
   trunk/buildroot/target/device/Atmel/DataFlashBoot/Config.in
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Linux/
   trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.20.4/
   trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.20.4/linux-2.6.20.4-atmel.patch
   trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.21.1/
   trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.21.1/2.6.21.1-at91.patch
   trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.21.1/linux-2.6.21.1-at91-1-update.patch
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/at91rm9200df/
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.21.1.config
   trunk/buildroot/target/device/Atmel/at91rm9200df/busybox-1.5.0-atmel.config
   trunk/buildroot/target/device/Atmel/at91rm9200df/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91rm9200df/u-boot/
   trunk/buildroot/target/device/Atmel/at91rm9200df/u-boot/at91rm9200df.h
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.20.4.config
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.21.1.config
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/u-boot/
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/u-boot/at91sam9260dfc.h
   trunk/buildroot/target/device/Atmel/at91sam9261ek/
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.21.1.config
   trunk/buildroot/target/device/Atmel/at91sam9261ek/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91sam9261ek/u-boot/
   trunk/buildroot/target/device/Atmel/at91sam9261ek/u-boot/at91sam9261ek.h
   trunk/buildroot/target/device/Atmel/at91sam9263ek/
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.21.1.config
   trunk/buildroot/target/device/Atmel/at91sam9263ek/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91sam9263ek/u-boot/
   trunk/buildroot/target/device/Atmel/at91sam9263ek/u-boot/at91sam9263ek.h
   trunk/buildroot/target/device/Atmel/root/
   trunk/buildroot/target/device/Atmel/root/busybox.config
   trunk/buildroot/target/device/Atmel/root/depmod.pl
   trunk/buildroot/target/device/Atmel/root/device_table.txt
   trunk/buildroot/target/device/Atmel/root/skel.patch
   trunk/buildroot/target/device/Atmel/root/skel.tar.gz
   trunk/buildroot/target/device/Atmel/root/skel_busybox.patch
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/TZ
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/hostname
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/inputrc
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/issue
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/network/
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/passwd
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/profile
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/protocols
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/random-seed
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/securetty
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/services
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/shadow
   trunk/buildroot/target/device/Atmel/root/target_skeleton/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/bin/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/boot/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/config/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/dev/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/TZ
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/hostname
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/hosts
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/init.d/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/init.d/S20urandom
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/init.d/S40network
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/init.d/rcS
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/inittab
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/inputrc
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/issue
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/network/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/network/interfaces
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/passwd
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/profile
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/protocols
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/random-seed
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/securetty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/services
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/shadow
   trunk/buildroot/target/device/Atmel/root/target_skeleton/home/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/lib/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/mnt/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/opt/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/proc/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.bash_history
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.bash_logout
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.bash_profile
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.bashrc
   trunk/buildroot/target/device/Atmel/root/target_skeleton/sbin/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/tmp/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/bin/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/include/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/lib/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/man/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/sbin/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/share/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/share/udhcpc/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/share/udhcpc/default.script
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/src/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/cache/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lib/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lib/pcmcia/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lock/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/log/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/pcmcia/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/run/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/spool/
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/tmp/
   trunk/buildroot/target/device/Atmel/root/uClibc.config
   trunk/buildroot/target/device/Atmel/u-boot/
   trunk/buildroot/target/device/Atmel/u-boot/Config.in
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk

Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:

Sorry, the patch is too large to include (57161 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19133
