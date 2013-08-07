From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 17:11:37 +0200
Subject: [Buildroot] qt 5.02 not building
In-Reply-To: <77698A93A9334B5FBD062F0FE17E67D4@JohanW7>
References: <77698A93A9334B5FBD062F0FE17E67D4@JohanW7>
Message-ID: <20130807171137.3aa6865a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 7 Aug 2013 16:30:40 +0200, Sagaert Johan wrote:

> make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse2'
> /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse2 -g
> -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sse2.o sse2.cpp
> cc1plus: error: unrecognized command line option '-msse2'

Is the build *really* failing and aborting at this point? What you're
showing here is part of the tests that Qt does to find out the
capabilities of the compiler. Here, it tests whether it supports the
-msse2 option, which obviously isn't possible because you're building
for ARM.

So Qt will simply assume that SSE2 isn't available, and will continue
with other configuration tests.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
