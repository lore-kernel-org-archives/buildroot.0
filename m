From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 05:35:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/alsa-lib
	package/alsa-u etc...
Message-ID: <20070822123545.42C93A5D29@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 05:35:41 -0700 (Wed, 22 Aug 2007)
New Revision: 19645

Log:
- global whitespace trimming


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/package/config/Makefile
   trunk/buildroot/package/customize/customize.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gnuconfig/Makefile
   trunk/buildroot/package/gnuconfig/gnuconfig.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/hostap/hostap.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/iptables/iptables.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/libcgicc/libcgicc.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/libgpg-error/libgpg-error.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libid3tag/libid3tag.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/lsof/lsof.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/mtd/20050122/mtd.mk
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/netkittelnet/netkittelnet.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/ntp/ntp.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/portage/portage.mk
   trunk/buildroot/package/pppd/pppd.mk
   trunk/buildroot/package/proftpd/proftpd.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/sfdisk/sfdisk.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tinyx-old/tinyx.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/tslib/tslib.mk
   trunk/buildroot/package/ttcp/ttcp.mk
   trunk/buildroot/package/udhcp/udhcp.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/vsftpd/vsftpd.mk
   trunk/buildroot/package/wipe/wipe.mk
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
   trunk/buildroot/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
   trunk/buildroot/package/x11r7/xapp_xman/xapp_xman.mk
   trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
   trunk/buildroot/package/x11r7/xfont_encodings/xfont_encodings.mk
   trunk/buildroot/package/x11r7/xlib_libICE/xlib_libICE.mk
   trunk/buildroot/package/x11r7/xlib_libSM/xlib_libSM.mk
   trunk/buildroot/package/x11r7/xlib_libXTrap/xlib_libXTrap.mk
   trunk/buildroot/package/x11r7/xlib_libXau/xlib_libXau.mk
   trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk
   trunk/buildroot/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
   trunk/buildroot/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
   trunk/buildroot/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
   trunk/buildroot/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
   trunk/buildroot/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk
   trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk
   trunk/buildroot/package/x11r7/xlib_libXmu/xlib_libXmu.mk
   trunk/buildroot/package/x11r7/xlib_libXpm/xlib_libXpm.mk
   trunk/buildroot/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
   trunk/buildroot/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
   trunk/buildroot/package/x11r7/xlib_libXtst/xlib_libXtst.mk
   trunk/buildroot/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
   trunk/buildroot/package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk
   trunk/buildroot/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
   trunk/buildroot/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
   trunk/buildroot/package/x11r7/xlib_xtrans/xlib_xtrans.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/project/project.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Soekris/soekris_gpio/Makefile
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/linux-experimental/Makefile.in
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/elf2flt/elf2flt/Makefile.in
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (3530 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19645
