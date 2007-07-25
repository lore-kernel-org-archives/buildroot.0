From: Rex Ashbaugh <rexa@xeratech.com>
Date: Wed, 25 Jul 2007 07:33:07 -0700
Subject: [Buildroot] "multiple target patterns" error while building
	under cygwin
In-Reply-To: <E496871456016F4CA8959BE4105D2A890E8B8C@troe2k1.cs.myharris.net>
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at> <20070723142207.GA9324@aon.at>
	<20070723144314.GC9324@aon.at>
	<000501c7cd42$2a1b0d20$dcc4af0a@atmel.com>
	<E496871456016F4CA8959BE4105D2A890E8B8C@troe2k1.cs.myharris.net>
Message-ID: <6311fe0b0707250733o5f311adbq2d44dad71edc2350@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It could be a 'make' version issue
or a 'sh' shell version issue,
or script  syntax issue,
or a dos path issue.

What text is at line 410 of the file 'applets.o.cmd' ?



On 7/23/07, Crane, Matthew <mcrane03@harris.com> wrote:
>
> Hi,
>
>
> I'm trying to build on cygwin, busybox is failing with the error:
>
>
> applets/.applets.o.cmd:410: *** multiple target patterns.  Stop.
>
> Has anybody come across this?  I'm wondering if it's related to the case
> insensitivity of cygwin.  Any help much apreciated,
>
> Matt
>
>
> More complete error log, starts just as the build process has run
> through building busybox once, and starts again, which I think is
> normal??
>
>
>   AR      util-linux/lib.a
>   LINK    busybox_unstripped
> cp busybox_unstripped busybox
> make[1]: Leaving directory
> `/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
> sybox-1.6.1'
> /usr/bin/make -j1 CC=/usr/local/arm2007-uc/bin/arm-uclinuxeabi-gcc
> CROSS_COMPILE="/usr/local/arm2007-uc/bin/arm-uclinuxeabi-
> " \
>                 CROSS="/usr/local/arm2007-uc/bin/arm-uclinuxeabi-"
> PREFIX="/usr/local/src/hd2/buildroot-20070718/project_bui
> ld_arm_nofpu/uclibc/root" \
>                 ARCH=arm \
>                 EXTRA_CFLAGS="-Os -pipe
> -I/usr/local/src/hd2/buildroot-20070718/build_arm_nofpu/staging_dir/incl
> ude -I/usr/
> local/src/hd2/buildroot-20070718/build_arm_nofpu/staging_dir/usr/include
> -I/usr/local/arm2007-uc/arm-uclinuxeabi/include" -C
>
> /usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bus
> ybox-1.6.1 install
> make[1]: Entering directory
> `/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
> sybox-1.6.1'
>   HOSTCC  scripts/basic/split-include
> scripts/basic/.split-include.d: done.
>   HOSTCC  scripts/basic/docproc
> scripts/basic/.docproc.d: done.
>   SPLIT   include/autoconf.h -> include/config/*
>   GEN     include/bbconfigopts.h
> applets/.applets.o.cmd:410: *** multiple target patterns.  Stop.
> make[1]: *** [applets] Error 2
> make[1]: Leaving directory
> `/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
> sybox-1.6.1'
> make: ***
> [/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/ro
> ot/bin/busybox] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070725/9ce5e45f/attachment.htm 
