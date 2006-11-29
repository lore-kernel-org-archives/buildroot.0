From: Pavel Roskin <proski@gnu.org>
Date: Wed, 29 Nov 2006 03:08:29 -0500
Subject: [Buildroot] List of broken packages
Message-ID: <1164787709.5573.6.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This is the complete list of the packages I had to disable when
cross-compiling current Buildroot on x86_64 for i686:

BR2_PACKAGE_BUSYBOX_SNAPSHOT
(init/init.c:13:1: error: "CONFIG_SYSLOGD" redefined) 
BR2_PACKAGE_ACPID
(error treated as warning, patch sent)
BR2_PACKAGE_ASTERISK
(depends on broken mpg123)
BR2_PACKAGE_ISC_DHCP
(tarball missing)
BR2_PACKAGE_DIRECTFB
(tarball missing)
BR2_PACKAGE_DM
(tarball missing, patch sent)
BR2_PACKAGE_DMRAID
(compile errors in absence of broken dm)
BR2_PACKAGE_FAKEROOT
(po4a missing)
BR2_PACKAGE_GETTEXT
(tarball missing)
BR2_PACKAGE_LIBINTL
(tarball missing)
BR2_PACKAGE_HOSTAP
(depends on broken pcmcia) 
BR2_PACKAGE_IOSTAT
(tarball missing)
BR2_PACKAGE_IPSEC_TOOLS
(configure: error: Unable to find linux-2.6 kernel headers)
BR2_PACKAGE_LTRACE
(configure: error: gelf.h not found)
BR2_PACKAGE_LTT
(RTAITables.c:23:46: error: linux/sys.h: No such file or directory)
BR2_PACKAGE_MEMTESTER
(tarball missing)
BR2_PACKAGE_MICROWIN
(winevent.c:19: error: static declaration of 'abs' follows non-static
declaration)
BR2_PACKAGE_MPG123
(incorrect use of "as" due to implicit rules, patch sent)
BR2_PACKAGE_NBD
(configure: error: Could not find an nbd.h from kernel 2.6 or above)
BR2_PACKAGE_NTP
(../include/ntp_stdlib.h:138: error: array type has incomplete element
type)
BR2_PACKAGE_OPENSWAN
(oswlog.c:46: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'openswan_passert_fail)
BR2_PACKAGE_PORTAGE
(sandbox-1.2.13.tar.bz2 missing)
BR2_PACKAGE_QTE
(cannot download, commercial?)
BR2_PACKAGE_RUBY
(can't find header files for ruby)
BR2_PACKAGE_SDL
(ld: cannot find -lartsc)
BR2_PACKAGE_TN5250
(host5250.c:65: error: 'FALSE' undeclared)

Also, BR2_TARGET_ROOTFS_ISO9660 is broken.  iso9660.mk refers to
LINUX_KERNEL, which is never defined.  I think the configuration system
should ask for the kernel location and disable targets requiring the
kernel if none have been specified.

I'm attaching the .config file for the maximal configuration that worked for me.

-- 
Regards,
Pavel Roskin

-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-max.gz
Type: application/x-gzip
Size: 2568 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061129/c5b257f1/attachment.bin 
