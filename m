From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 07:06:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: acpid argus at
	autoconf automake avahi b etc...
Message-ID: <20070711140638.848A1A65BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 07:06:06 -0700 (Wed, 11 Jul 2007)
New Revision: 19061

Log:
Use <package>_VERSION in all <package>.mk instead of <package>_VER

Modified:
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dash/dash.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dhcp/dhcp.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dnsmasq/dnsmasq.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/hotplug/hotplug.mk
   trunk/buildroot/package/iostat/iostat.mk
   trunk/buildroot/package/iproute2/iproute2.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/l2tp/l2tp.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libelf/libelf.mk
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libsndfile/libsndfile.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lrzsz/lrzsz.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/memtester/memtester.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/microperl/microperl.mk
   trunk/buildroot/package/mkdosfs/mkdosfs.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/mpatrol/mpatrol.mk
   trunk/buildroot/package/mrouted/mrouted.mk
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/netkittelnet/netkittelnet.mk
   trunk/buildroot/package/netplug/netplug.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/patch/patch.mk
   trunk/buildroot/package/pciutils/pciutils.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/quagga/quagga.mk
   trunk/buildroot/package/raidtools/raidtools.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/ruby/ruby.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/sfdisk/sfdisk.mk
   trunk/buildroot/package/slang/slang.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/sysklogd/sysklogd.mk
   trunk/buildroot/package/sysvinit/sysvinit.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tinylogin/tinylogin.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/ttcp/ttcp.mk
   trunk/buildroot/package/udhcp/udhcp.mk
   trunk/buildroot/package/uemacs/uemacs.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/vtun/vtun.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk
   trunk/buildroot/package/wipe/wipe.mk
   trunk/buildroot/package/wireless-tools/wireless-tools.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:

Sorry, the patch is too large to include (2472 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19061
