From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Dec 2009 09:57:35 +0100
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	(joyful@sonic.net's message of "Fri, 18 Dec 2009 17:17:12 -0800")
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
Message-ID: <87fx772veo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "joyful" == joyful  <joyful@sonic.net> writes:

 joyful> I don't think I did anything special, merely did make menuconfig and
 joyful> selected some items on the menu, I got this error during make:

 joyful> *** Unpacking kernel source
 joyful> bzcat /tmp/buildroot/dl/linux-2.6.29.2.tar.bz2 | tar -C
 joyful> /tmp/buildroot/project_build_i686/uclibc   -xf -
 joyful> touch /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.unpacked
 joyful> toolchain/patch-kernel.sh
 joyful> /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2
 joyful> toolchain/kernel-headers \
 joyful>                linux-2.6.29.2-\*.patch{,.gz,.bz2}
 joyful> touch /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.patched
 joyful> cp -dpf  /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.config
 joyful> cp: missing destination file operand after
 joyful> `/tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.config'
 joyful> Try `cp --help' for more information.
 joyful> make: ***
 joyful> [/tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.configured]
 joyful> Error 1

Buildroot questions belongs on the buildroot list, this doesn't have
anything to do with uclibc.

What it says above is that the kernel compilation fails because you
don't have a kernel configuration (a .config).

I see that you are not using the latest stable release. Please give
buildroot-2009.11 a try.

-- 
Bye, Peter Korsgaard
