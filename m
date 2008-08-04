From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package
	package/ace_of_penguins package etc...
Message-ID: <20080804190706.CC3F83C85C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:05 -0700 (Mon, 04 Aug 2008)
New Revision: 23016

Log:
buildroot: remove trailing spaces

for i in `find -name 'Config*' -o -name 'Makefile*' -o -name '*.mk'`;
do
	sed -i 's/ \+$//' $i;
done

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/autoconf/Config.in
   trunk/buildroot/package/automake/Config.in
   trunk/buildroot/package/berkeleydb/Config.in
   trunk/buildroot/package/bind/Config.in
   trunk/buildroot/package/bison/Config.in
   trunk/buildroot/package/blackbox/blackbox.mk
   trunk/buildroot/package/boa/Config.in
   trunk/buildroot/package/bootutils/Config.in
   trunk/buildroot/package/bzip2/Config.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/coreutils/Config.in
   trunk/buildroot/package/distcc/Config.in
   trunk/buildroot/package/dnsmasq/Config.in
   trunk/buildroot/package/docker/docker.mk
   trunk/buildroot/package/editors/ed/Config.in
   trunk/buildroot/package/editors/nano/Config.in
   trunk/buildroot/package/festival/speech-tools/speech-tools.mk
   trunk/buildroot/package/file/Config.in
   trunk/buildroot/package/findutils/Config.in
   trunk/buildroot/package/flex/Config.in
   trunk/buildroot/package/fltk/fltk.mk
   trunk/buildroot/package/gawk/Config.in
   trunk/buildroot/package/gnuchess/gnuchess.mk
   trunk/buildroot/package/gzip/Config.in
   trunk/buildroot/package/hostap/Config.in
   trunk/buildroot/package/icu/icu.mk
   trunk/buildroot/package/ipkg/ipkg.mk
   trunk/buildroot/package/iproute2/Config.in
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/irda-utils/Config.in
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/concierge/concierge.mk
   trunk/buildroot/package/java/jamvm/Config.in
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/kismet/Config.in
   trunk/buildroot/package/libcgi/Config.in
   trunk/buildroot/package/libdaemon/Config.in
   trunk/buildroot/package/libeXosip2/Config.in
   trunk/buildroot/package/libeXosip2/libeXosip2.mk
   trunk/buildroot/package/libfloat/Config.in
   trunk/buildroot/package/libgcrypt/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libiconv/libiconv.mk
   trunk/buildroot/package/libosip2/Config.in
   trunk/buildroot/package/libsndfile/Config.in
   trunk/buildroot/package/libtool/Config.in
   trunk/buildroot/package/lighttpd/Config.in
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/lsof/Config.in
   trunk/buildroot/package/lxdoom/lxdoom-wad.mk
   trunk/buildroot/package/lxdoom/lxdoom.mk
   trunk/buildroot/package/magiccube4d/magiccube4d.mk
   trunk/buildroot/package/make/Config.in
   trunk/buildroot/package/microperl/Config.in
   trunk/buildroot/package/microwin/Config.in
   trunk/buildroot/package/module-init-tools/Config.in
   trunk/buildroot/package/modutils/Config.in
   trunk/buildroot/package/ncurses/Config.in
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/netcat/Config.in
   trunk/buildroot/package/netsnmp/Config.in
   trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
   trunk/buildroot/package/olsr/Config.in
   trunk/buildroot/package/openmotif/openmotif.mk
   trunk/buildroot/package/openssh/Config.in
   trunk/buildroot/package/openssl/Config.in
   trunk/buildroot/package/openvpn/Config.in
   trunk/buildroot/package/oprofile/Config.in
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/patch/Config.in
   trunk/buildroot/package/php/Config.in
   trunk/buildroot/package/php/php.mk
   trunk/buildroot/package/popt/popt.mk
   trunk/buildroot/package/python/Config.in
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/rubix/rubix.mk
   trunk/buildroot/package/screen/Config.in
   trunk/buildroot/package/speex/Config.in
   trunk/buildroot/package/startup-notification/startup-notification.mk
   trunk/buildroot/package/strace/Config.in
   trunk/buildroot/package/synergy/Config.in
   trunk/buildroot/package/synergy/synergy.mk
   trunk/buildroot/package/tar/Config.in
   trunk/buildroot/package/tinyhttpd/Config.in
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tinylogin/Config.in
   trunk/buildroot/package/torsmo/torsmo.mk
   trunk/buildroot/package/udhcp/Config.in
   trunk/buildroot/package/vice/vice.mk
   trunk/buildroot/package/vlc/vlc.mk
   trunk/buildroot/package/vtun/Config.in
   trunk/buildroot/package/webkit/Config.in
   trunk/buildroot/package/webkit/webkit.mk
   trunk/buildroot/package/x11r7/pthread-stubs/Config.in
   trunk/buildroot/package/x11r7/xkeyboard-config/xkeyboard-config.mk
   trunk/buildroot/package/xpdf/xpdf.mk
   trunk/buildroot/package/zlib/Config.in
   trunk/buildroot/target/Config.in.arch
   trunk/buildroot/target/cpio/Config.in
   trunk/buildroot/target/device/Atmel/Config.in.mirrors
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches
   trunk/buildroot/target/device/Sharp/Config.in
   trunk/buildroot/target/initramfs/Config.in
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/target/x86/grub/Config.in
   trunk/buildroot/target/x86/grub2/Config.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (2176 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=23016
