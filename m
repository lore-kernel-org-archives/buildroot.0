From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Jul 2009 07:32:27 +0200
Subject: [Buildroot] buildroot with ELDK 4.1
In-Reply-To: <b1907d090907022046l5fba3d82q1a1f80dbed7c3c6f@mail.gmail.com>
	(Wenwei Zha's message of "Thu\, 2 Jul 2009 23\:46\:37 -0400")
References: <b1907d090907022046l5fba3d82q1a1f80dbed7c3c6f@mail.gmail.com>
Message-ID: <87vdmabac4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wenwei" == Wenwei Zha <wenweizha@gmail.com> writes:

 Wenwei> Hi,
 Wenwei> I just started to learn using buildroot to build a root file system. I
 Wenwei> would like to use ELDK 4.1 as my toolchain but has some problem.

 Wenwei> make[1]: Entering directory
 Wenwei> `/home/wenwei/temp/temp/buildroot-2009.05/project_build_powerpc/linux_26_ml410/busybox-1.14.1'
 Wenwei>  SPLIT   include/autoconf.h -> include/config/*
 Wenwei>  GEN     include/bbconfigopts.h
 Wenwei>  HOSTCC  applets/usage
 Wenwei> applets/usage.c: In function ?main?:
 Wenwei> applets/usage.c:32: warning: ignoring return value of ?write?,
 Wenwei> declared with attribute warn_unused_result
 Wenwei>  GEN     include/usage_compressed.h
 Wenwei>  HOSTCC  applets/applet_tables
 Wenwei>  GEN     include/applet_tables.h
 Wenwei>  CC      applets/applets.o
 Wenwei> cc1: error: unrecognized command line option "-fsysroot"

That won't work - Your toolchain has to support sysroot (gcc 4.2 or
newer). As far as I can see on google, ELDK 4.1 used 4.0.

-- 
Bye, Peter Korsgaard
