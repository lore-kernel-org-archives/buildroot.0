From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  1 Oct 2006 08:17:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: docs package/acpid
	package/asterisk pac etc...
Message-ID: <20061001151756.3F3EE485A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-01 08:17:52 -0700 (Sun, 01 Oct 2006)
New Revision: 16282

Log:
- use $(ZCAT) as configured by the user instead of hardcoded 'zcat' that may not exist; Closes #971
  Silly, unchecked sed -i -e "/[^b]zcat/s/zcat/\$\(ZCAT\)/g" $(svngrep "[^b]zcat" * -rl | grep -v Config.in)


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/asterisk/asterisk.mk
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/bridge/bridge.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/dhcp/dhcp.mk
   trunk/buildroot/package/dialog/dialog.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dnsmasq/dnsmasq.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/ed/ed.mk
   trunk/buildroot/package/ethtool/ethtool.mk
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/gzip/Config.in
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/haserl/haserl.mk
   trunk/buildroot/package/hdparm/hdparm.mk
   trunk/buildroot/package/hostap/hostap.mk
   trunk/buildroot/package/iostat/iostat.mk
   trunk/buildroot/package/iproute2/iproute2.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/less/less.mk
   trunk/buildroot/package/libcgi/libcgi.mk
   trunk/buildroot/package/libelf/libelf.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lrzsz/lrzsz.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lvm2/lvm2.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/memtester/memtester.mk
   trunk/buildroot/package/microcom/microcom.mk
   trunk/buildroot/package/microwin/microwin.mk
   trunk/buildroot/package/mkdosfs/mkdosfs.mk
   trunk/buildroot/package/mrouted/mrouted.mk
   trunk/buildroot/package/mtd/mtd.mk
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/netkittelnet/netkittelnet.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/ntp/ntp.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openvpn/openvpn.mk
   trunk/buildroot/package/patch/patch.mk
   trunk/buildroot/package/pciutils/pciutils.mk
   trunk/buildroot/package/pcmcia/pcmcia.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/pppd/pppd.mk
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/raidtools/raidtools.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/ruby/ruby.mk
   trunk/buildroot/package/rxvt/rxvt.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/sysklogd/sysklogd.mk
   trunk/buildroot/package/sysvinit/sysvinit.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/udhcp/udhcp.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/vtun/vtun.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk
   trunk/buildroot/package/wipe/wipe.mk
   trunk/buildroot/package/wireless-tools/wireless-tools.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/Soekris/soekris_gpio/soekris_gpio.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/powerpc/yaboot/yaboot.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:

Sorry, the patch is too large to include (1551 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=16282
