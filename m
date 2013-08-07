From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 23:42:30 +0200
Subject: [Buildroot] qt 5.02 not building
In-Reply-To: <07AC286795CB4F4B8C7523D9ECE6109A@JohanW7>
References: <77698A93A9334B5FBD062F0FE17E67D4@JohanW7>
 <20130807171137.3aa6865a@skate>
 <07AC286795CB4F4B8C7523D9ECE6109A@JohanW7>
Message-ID: <20130807234230.734f072b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 7 Aug 2013 19:38:37 +0200, Sagaert Johan wrote:
> DirectFB auto-detection... ()
> make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
> /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
> -D_REENTRANT -O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/directfb -o directfb.o directfb.cpp
> directfb.cpp:45:2: error: #error DirectFB headers are unclean and cannot compile
> make[1]: *** [directfb.o] Error 1
> make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
> DirectFB disabled.
>  DirectFB support cannot be enabled due to functionality tests!
>  Turn on verbose messaging (-v) to ./configure to see the final report.
>  If you believe this message is in error you may use the continue
>  switch (-continue) to ./configure to continue.
> make: *** [/home/buildroot12git/output/build/qt5base-5.0.2/.stamp_configured] Error 101

Ok, so as you can see, the error has nothing to do with what you posted
originally (-msse2), but it is related to DirectFB.

I've already seen this error in the autobuilders, but never had the
time to investigate. Someone needs to have a look at this one.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
