From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 Jan 2009 15:47:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package/customize/source
	target/device/A etc...
Message-ID: <20090105154701.7234E77404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-05 15:47:00 +0000 (Mon, 05 Jan 2009)
New Revision: 24691

Log:
add .empty files for git-svn

git-svn (and git) doesn't handle empty directories, so add .empty files
to those dirs like elsewhere in buildroot.

Those empty directories are normally not a big deal, but the recent changes
to u-boot broke the build.


Added:
   trunk/buildroot/package/customize/source/.empty
   trunk/buildroot/target/device/ARM/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/Linux/.empty
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22.1/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.20.4/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.21.5/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/.empty
   trunk/buildroot/target/device/Atmel/at91rm9200df/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9260pf/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9261ek/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9263ek/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/u-boot/.empty
   trunk/buildroot/target/device/Atmel/atngw100-base/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/atstk1005/kernel-patches/.empty
   trunk/buildroot/target/device/Atmel/root/target_busybox_skeleton/etc/ld.so.conf.d/.empty
   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.4/.empty
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.0/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/bin/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-down.d/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-post-down.d/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-pre-up.d/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/etc/network/if-up.d/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/home/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/lib/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/proc/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/tmp/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/bin/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/lib/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/usr/sbin/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/log/.empty
   trunk/buildroot/target/device/KwikByte/kb9202/target_skeleton/var/run/.empty
   trunk/buildroot/target/device/x86/i386/kernel-header-patches/.empty
   trunk/buildroot/target/device/x86/i386/kernel-patches/.empty
   trunk/buildroot/target/generic/target_busybox_skeleton/config/.empty
   trunk/buildroot/target/generic/target_busybox_skeleton/dev/.empty
   trunk/buildroot/target/generic/target_busybox_skeleton/tmp/.empty
   trunk/buildroot/target/generic/target_busybox_skeleton/usr/sbin/.empty
   trunk/buildroot/target/u-boot/1.2.0-atmel/.empty
   trunk/buildroot/target/u-boot/1.3.4/.empty
   trunk/buildroot/target/u-boot/2008.10/.empty
   trunk/buildroot/target/u-boot/2009.01/.empty
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.0/.empty
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.3/.empty
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.5/.empty
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.18-avr32-1.0.1/.empty
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/.empty
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/.empty
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/.empty
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/.empty
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/.empty
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.0/.empty
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.1.3/.empty
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.7.1-avr32-2.1.5/.empty
   trunk/buildroot/toolchain/kernel-headers/empty/.empty
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.3/.empty
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.5/.empty
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/.empty


Changeset:
