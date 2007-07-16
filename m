From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Mon, 16 Jul 2007 09:02:07 +0530
Subject: [Buildroot] error building toolchain with gettext /libintl
Message-ID: <C03A3C267DDF184EA523BBAB577BF924C22CF4@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all,

I am trying to build a ARM toolchain in buildroot for the 1st time with
below mentioned config. Everything goes fine till gettext building. when
make gettext-target is executed it halts with error saying

cp -dpf
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
sr/lib/libgettext*.so* \
	
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
sr/lib/libintl*.so*
/home/guru/project/original/toolchains/buildroot/project_build_arm/uclib
c/root/usr/lib/
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
usr/lib/libgettext*.so*': No such file or directory
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
usr/lib/libintl*.so*': No such file or directory
make: ***
[/home/guru/project/original/toolchains/buildroot/project_build_arm/ucli
bc/root/usr/lib/libintl.so] Error 1


when i give make libintl --> i get error as 

cp -dpf
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
sr/lib/libgettext*.so* \
	
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
sr/lib/libintl*.so*
/home/guru/project/original/toolchains/buildroot/project_build_arm/uclib
c/root/usr/lib/
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
usr/lib/libgettext*.so*': No such file or directory
cp: cannot stat
`/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
usr/lib/libintl*.so*': No such file or directory
make: ***
[/home/guru/project/original/toolchains/buildroot/project_build_arm/ucli
bc/root/usr/lib/libintl.so] Error 1


i have selected gettext & libintl but still what i see is that both are
interdependent. kindly help me to solve this error. let me know if i
need to select/add/change/update some more options
i am using buildroot snapsnot as on 13 July 2007. 

BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"

BR2_PREFER_STATIC_LIB=y
BR2_TOOLCHAIN_BUILDROOT=y

BR2_KERNEL_HEADERS_2_6_21=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"

BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"

BR2_BINUTILS_VERSION_2_17=y

BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

BR2_GCC_VERSION_4_2_0=y

BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y

BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_PKGCONFIG=y


BR2_PACKAGE_LIBSYSFS=y
BR2_GRAPHIC_SUPPORT=y

BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y

BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBPNG=y

BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y

BR2_COMPRESSOR_SUPPORT=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_TARGET_HEADERS=y

# BR2_TARGET_GENERIC_DEV_SYSTEM is not set


Regards
Gururaja

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of buildroot-request at uclibc.org
Sent: Sunday, July 15, 2007 12:00 PM
To: buildroot at uclibc.org
Subject: buildroot Digest, Vol 13, Issue 54

Send buildroot mailing list submissions to
	buildroot at uclibc.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
	buildroot-request at uclibc.org

You can reach the person managing the list at
	buildroot-owner at uclibc.org

When replying, please edit your Subject line so it is more specific than
"Re: Contents of buildroot digest..."


Today's Topics:

   1. _VER vs. _VERSION breakage (Bernhard Fischer)
   2. Re: make source-check (Cristian Ionescu-Idbohrn)
   3. svn commit: trunk/buildroot/package/acpid (ulf at uclibc.org)


----------------------------------------------------------------------

Message: 1
Date: Sun, 15 Jul 2007 12:40:24 +0200
From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: [Buildroot] _VER vs. _VERSION breakage
To: buildroot at uclibc.org
Message-ID: <20070715104024.GB4096@aon.at>
Content-Type: text/plain; charset=us-ascii

Ulf,

Your change to use _VERSION broke at least acpid. Please double-check
that all packages that you touched in this patch still build fine and
repair.

thanks,


------------------------------

Message: 2
Date: Sun, 15 Jul 2007 14:41:03 +0200 (CEST)
From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Subject: Re: [Buildroot] make source-check
To: buildroot at uclibc.org
Message-ID: <0707151431170.6891@somehost>
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 9 Jul 2007, Bernhard Fischer wrote:

> On Mon, Jul 09, 2007 at 12:01:08PM +0200, Cristian Ionescu-Idbohrn
wrote:
> >On Mon, 9 Jul 2007, Bernhard Fischer wrote:
>
> >But, wouldn't you agree that doing the same thing witout changing the

> >.config could be a much more elegant way to do it?
>
> If you have a better impl than my quick-hack, i'm eager to see it,
sure.

Looks like there might be another way: see info-node "6.10
Target-specific Variable Values" in a recent manual.  What do you think
of something like:

--- Makefile	(revision 19052)
+++ Makefile	(working copy)
@@ -222,11 +222,8 @@

 source: $(TARGETS_SOURCE) $(HOST_SOURCE)

-.config.check: dependencies
-	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
-	touch $@
-
-_source-check: .config.check
+_source-check: WGET += --spider
+_source-check:
 	$(MAKE) source

That is, the wget option '--spider' will be used _only_ by target
'_source-check' and the '.config' won't have to be edited behind one's
back.


--
Cristian


------------------------------

Message: 3
Date: Sun, 15 Jul 2007 10:06:17 -0700 (PDT)
From: ulf@uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
To: buildroot at uclibc.org
Message-ID: <20070715170617.68D4AA685F@busybox.net>
Content-Type: text/plain; charset=UTF-8

Author: ulf
Date: 2007-07-15 10:06:15 -0700 (Sun, 15 Jul 2007)
New Revision: 19096

Log:
Fix acpid version info

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2007-07-15 12:39:08 UTC
(rev 19095)
+++ trunk/buildroot/package/acpid/acpid.mk	2007-07-15 17:06:15 UTC
(rev 19096)
@@ -3,9 +3,9 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION:=1.0.4-1
+ACPID_VERSION:=1.0.4
 ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
-ACPID_SOURCE=acpid_$(ACPID_VERSION).tar.gz
+ACPID_SOURCE=acpid_$(ACPID_VERSION)-1.tar.gz
 ACPID_SITE=http://ftp.debian.org/debian/pool/main/a/acpid
 
 $(DL_DIR)/$(ACPID_SOURCE):



------------------------------

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 13, Issue 54
*****************************************
