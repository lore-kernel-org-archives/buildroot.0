From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jul 2011 09:34:55 +0200
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
 (Diego Iastrubni's message of "Tue, 26 Jul 2011 19:00:50 +0300")
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de> <871uxe10hq.fsf@macbook.be.48ers.dk>
 <4E2E67C8.7090208@visionsystems.de>
 <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
Message-ID: <871uxcuqg0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

Hi,

 Diego> My setup does not build now:
 Diego> extras/input_id/input_id.c: In function 'test_key':
 Diego> extras/input_id/input_id.c:173: error: 'BTN_TRIGGER_HAPPY' undeclared
 Diego> (first use in this function)
 Diego> extras/input_id/input_id.c:173: error: (Each undeclared identifier is
 Diego> reported only once
 Diego> extras/input_id/input_id.c:173: error: for each function it appears in.)
 Diego> make[3]: *** [extras/input_id/input_id.o] Error 1
 Diego> make[2]: *** [all-recursive] Error 1
 Diego> make[1]: *** [all] Error 2
 Diego> make[1]: Leaving directory `/home/diego/src/buildroot/output/build/udev-172'
 Diego> make: *** [/home/diego/src/buildroot/output/build/udev-172/.stamp_built] Error 2
 Diego> This new udev version needs a kernel>=2.6.33 and my toolchain (?)

Yes, BTN_TRIGGER_HAPPY was indeed only added in 2.6.34-rc1.

Diego> comes with headers of 2.6.32. I am compiling for ARM using
 Diego> codesourcery 2010q1 (I normally use a "custom" setup, but using the
 Diego> one in buildroot fails). Using?2011.03 does work.

What exactly fails with the internal toolchain?

 Diego> How do I convince the toolchain to use a newer kernel headers?

You cannot, kernel headers are part of the toolchain. Consider moving to
a newer toolchain and/or disable UDEV_EXTRAS.

-- 
Bye, Peter Korsgaard
