From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 26 Jul 2011 19:00:50 +0300
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <4E2E67C8.7090208@visionsystems.de>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <871uxe10hq.fsf@macbook.be.48ers.dk> <4E2E67C8.7090208@visionsystems.de>
Message-ID: <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 26, 2011 at 10:07 AM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
>
> > udev's configure script uses pkg-config, so we also need to depend on
> > host-pkg-config.
> >
> > Thanks for your persistence
>
> Yeah! We've done it! I want to thank everyone involved.
>

My setup does not build now:
extras/input_id/input_id.c: In function 'test_key':
extras/input_id/input_id.c:173: error: 'BTN_TRIGGER_HAPPY' undeclared
(first use in this function)
extras/input_id/input_id.c:173: error: (Each undeclared identifier is
reported only once
extras/input_id/input_id.c:173: error: for each function it appears in.)
make[3]: *** [extras/input_id/input_id.o] Error 1
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/diego/src/buildroot/output/build/udev-172'
make: *** [/home/diego/src/buildroot/output/build/udev-172/.stamp_built] Error 2
This new udev version needs a kernel>=2.6.33 and my toolchain (?)
comes with headers of 2.6.32. I am compiling for ARM using
codesourcery 2010q1 (I normally use a "custom" setup, but using the
one in buildroot fails). Using?2011.03 does work.
How do I convince the toolchain to use a newer kernel headers?
BTW, this cost has been added in 2.6.33rc5:
http://www.kernel.org/pub/linux/kernel/v2.6/snapshots/patch-2.6.33-git5.log
