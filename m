From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 10:34:12 +0100
Subject: [Buildroot] List of broken packages
In-Reply-To: <1164787709.5573.6.camel@dv>
References: <1164787709.5573.6.camel@dv>
Message-ID: <20061129093412.GE26441@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 29, 2006 at 03:08:29AM -0500, Pavel Roskin wrote:
>Hello!
>
>This is the complete list of the packages I had to disable when
>cross-compiling current Buildroot on x86_64 for i686:
>
>BR2_PACKAGE_BUSYBOX_SNAPSHOT
>(init/init.c:13:1: error: "CONFIG_SYSLOGD" redefined) 

Is this current trunk or an older snapshot? I don't see this with
busybox' r16629 and a few local patches like
package/busybox/busybox.config_RPC.patch
package/busybox/busybox.less.00.patch
package/busybox/busybox.no_werror.patch
package/busybox/busybox.applet_chrt.patch
package/busybox/busybox.passwd.01_all.patch
package/busybox/busybox.scratch_branch-misc_shrinkage.03.patch
package/busybox/busybox.scratch_branch-misc_shrinkage.04.patch
package/busybox/busybox.scratch_branch-misc_shrinkage.05.patch


>BR2_PACKAGE_ACPID
>(error treated as warning, patch sent)
done.
>BR2_PACKAGE_ASTERISK
>(depends on broken mpg123)
>BR2_PACKAGE_ISC_DHCP
>(tarball missing)
>BR2_PACKAGE_DIRECTFB
>(tarball missing)
>BR2_PACKAGE_DM
>(tarball missing, patch sent)
>BR2_PACKAGE_DMRAID
>(compile errors in absence of broken dm)
done.
>BR2_PACKAGE_FAKEROOT
>(po4a missing)
>BR2_PACKAGE_GETTEXT
>(tarball missing)
IIRC this is currently at 0.15. I'll update it but will not test it.
>BR2_PACKAGE_LIBINTL
>(tarball missing)
>BR2_PACKAGE_HOSTAP
>(depends on broken pcmcia) 
>BR2_PACKAGE_IOSTAT
>(tarball missing)
>BR2_PACKAGE_IPSEC_TOOLS
>(configure: error: Unable to find linux-2.6 kernel headers)

What kernel-version (resp. header version) do you use?

>BR2_PACKAGE_LTRACE
>(configure: error: gelf.h not found)
>BR2_PACKAGE_LTT
>(RTAITables.c:23:46: error: linux/sys.h: No such file or directory)
>BR2_PACKAGE_MEMTESTER
>(tarball missing)
>BR2_PACKAGE_MICROWIN
>(winevent.c:19: error: static declaration of 'abs' follows non-static
>declaration)
That's expected. Patches welcome..

>BR2_PACKAGE_MPG123
>(incorrect use of "as" due to implicit rules, patch sent)
>BR2_PACKAGE_NBD
>(configure: error: Could not find an nbd.h from kernel 2.6 or above)
>BR2_PACKAGE_NTP
>(../include/ntp_stdlib.h:138: error: array type has incomplete element
>type)
IIRC there was a patch sent to the list recently that bumped the
version.

>BR2_PACKAGE_OPENSWAN
>(oswlog.c:46: error: expected '=', ',', ';', 'asm' or '__attribute__'
>before 'openswan_passert_fail)

That's guarded by !defined(NO_DEBUG) and we build with -DNO_DEBUG.
Curious as to why you see this.. Works For Me, fwiw..

>BR2_PACKAGE_PORTAGE
>(sandbox-1.2.13.tar.bz2 missing)
>BR2_PACKAGE_QTE
>(cannot download, commercial?)
>BR2_PACKAGE_RUBY
>(can't find header files for ruby)
>BR2_PACKAGE_SDL
>(ld: cannot find -lartsc)
>BR2_PACKAGE_TN5250
>(host5250.c:65: error: 'FALSE' undeclared)
>
>Also, BR2_TARGET_ROOTFS_ISO9660 is broken.  iso9660.mk refers to
>LINUX_KERNEL, which is never defined.  I think the configuration system
>should ask for the kernel location and disable targets requiring the
>kernel if none have been specified.
