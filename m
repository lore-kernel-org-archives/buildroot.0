From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 12:20:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/alsa-lib
	package/alsa-ut etc...
Message-ID: <20070821192026.B798DA4606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 12:20:18 -0700 (Tue, 21 Aug 2007)
New Revision: 19627

Log:
- sed -i -e "/;$/s/;$//g" $(egrep  ";$" package/* package/*/*.mk toolchain/* toolchain/*/*.mk */Makefile.in  -l)


Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/aumix/aumix.mk
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/bridge/bridge.mk
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/curl/curl.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dash/dash.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/dhcp/dhcp.mk
   trunk/buildroot/package/dialog/dialog.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/ed/ed.mk
   trunk/buildroot/package/ethtool/ethtool.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/package/fbset/fbset.mk
   trunk/buildroot/package/fbv/fbv.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/haserl/haserl.mk
   trunk/buildroot/package/hotplug/hotplug.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/less/less.mk
   trunk/buildroot/package/libcgi/libcgi.mk
   trunk/buildroot/package/libcgicc/libcgicc.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/libelf/libelf.mk
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/libgcrypt/libgcrypt.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgpg-error/libgpg-error.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libid3tag/libid3tag.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libraw1394/libraw1394.mk
   trunk/buildroot/package/libsndfile/libsndfile.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libungif/libungif.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lrzsz/lrzsz.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lvm2/lvm2.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/madplay/madplay.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/microwin/microwin.mk
   trunk/buildroot/package/mkdosfs/mkdosfs.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/mplayer/mplayer.mk
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/netcat/netcat.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/ntp/ntp.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openvpn/openvpn.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/patch/patch.mk
   trunk/buildroot/package/pcmcia/pcmcia.mk
   trunk/buildroot/package/php/php.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/pppd/pppd.mk
   trunk/buildroot/package/proftpd/proftpd.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/quagga/quagga.mk
   trunk/buildroot/package/raidtools/raidtools.mk
   trunk/buildroot/package/rdesktop/rdesktop.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/ruby/ruby.mk
   trunk/buildroot/package/rxvt/rxvt.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/sfdisk/sfdisk.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tinyx-old/tinyx.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/tslib/tslib.mk
   trunk/buildroot/package/usbmount/usbmount.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/package/vtun/vtun.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (3367 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19627
