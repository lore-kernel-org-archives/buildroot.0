From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  1 Oct 2007 09:15:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/acpid
	package/alsa-lib p etc...
Message-ID: <20071001161534.5CD743003F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-01 09:15:31 -0700 (Mon, 01 Oct 2007)
New Revision: 20163

Log:
- just use the strip binary to avoid confusing libtool (quotes)
- use $(STRIPCMD) in packages to avoid clashes with $(STRIP)


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/asterisk/asterisk.mk
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/bridge/bridge.mk
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/curl/curl.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/dhcp/dhcp.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/dnsmasq/dnsmasq.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/fbset/fbset.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/hdparm/hdparm.mk
   trunk/buildroot/package/hotplug/hotplug.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/iostat/iostat.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/iptables/iptables.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/l2tp/l2tp.mk
   trunk/buildroot/package/libaio/libaio.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/libelf/libelf.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libid3tag/libid3tag.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libungif/libungif.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lm-sensors/lm-sensors.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/lrzsz/lrzsz.mk
   trunk/buildroot/package/lsof/lsof.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/madplay/madplay.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/memtester/memtester.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/mkdosfs/mkdosfs.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/mplayer/mplayer.mk
   trunk/buildroot/package/mtd/20050122/mtd.mk
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk
   trunk/buildroot/package/mutt/mutt.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/netcat/netcat.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/netkittelnet/netkittelnet.mk
   trunk/buildroot/package/netplug/netplug.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/olsr/olsr.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/pcmcia/pcmcia.mk
   trunk/buildroot/package/php/php.mk
   trunk/buildroot/package/pptp-linux/pptp-linux.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/rp-pppoe/rp-pppoe.mk
   trunk/buildroot/package/rxvt/rxvt.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/sfdisk/sfdisk.mk
   trunk/buildroot/package/slang/slang.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/sysklogd/sysklogd.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tinyx-old/tinyx.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/tslib/tslib.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/uemacs/uemacs.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/package/wireless-tools/wireless-tools.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/package/zlib/zlib.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:

Sorry, the patch is too large to include (2486 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=20163
