From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Fri, 8 Jan 2010 12:35:08 +0530
Subject: [Buildroot] Compiling error with microperl
Message-ID: <532dd5841001072305t2fed0ea0g2992e5a04ac61197@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm New to Embedded Linux. I was trying to compile buildroot in order
to get a Jffs2 Image for my target . I'm getting a compile error with
respect to microperl  which is something below

mkdir -p /media/disk-1/buildroot/buildroot-2009.08/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/media/disk-1/buildroot/buildroot-2009.08/project_build_arm/uclibc/buildroot-config
# we need to build a perl for the host just for Errno.pm
(cd /media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8; \
	 chmod a+x ext/util/make_ext; \
	 ext/util/make_ext nonxs Errno MAKE="/usr/bin/make" \
	)

	Making Errno (nonxs)
ext/util/make_ext: line 122: ../../miniperl: No such file or directory
Warning: No Makefile!
make[1]: Entering directory
`/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `config'.  Stop.
make[1]: Leaving directory
`/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
/usr/bin/make config failed, continuing anyway...
make[1]: Entering directory
`/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `all'.  Stop.
make[1]: Leaving directory
`/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
make: *** [/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/.configured]
Error 2


 i tried to find a option to disable to microperl since i dont want it
at all  and
Unfortunately (for me) selecting the general devel install auto
selects autoconf which in turn auto selects miniperl.
 how to deselect microperl from autoconf? thanks.
warm regards,
Ravi Kulkarni.
