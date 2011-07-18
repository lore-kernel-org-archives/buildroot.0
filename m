From: David J. Fiddes <D.J@fiddes.net>
Date: Mon, 18 Jul 2011 20:35:58 +0100
Subject: [Buildroot] ARM OABI build broken with current buildroot tip
In-Reply-To: <87fwm37vj4.fsf@macbook.be.48ers.dk>
References: <4E22BFA1.7080800@fiddes.net> <87fwm37vj4.fsf@macbook.be.48ers.dk>
Message-ID: <4E248B1E.1090904@fiddes.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> The problem is NPTL threading support. A quick look in
> libpthread/nptl/sysdeps/arm shows a number of EABI references. It seems
> like NPTL on ARM is only supported with EABI.

Ah. That's a bit of a show stopper.

> May I ask why you want to use a new C library / NPTL together with the
> obsolete OABI?

I have a very large multi-threaded C++ app and a custom embedded Linux 
platform that have historically been developed at different times. The 
SW is now over 10 years old and I fear change so just stuck to the ABI 
that has always worked...

Probably time to bite the bullet and move our kernel to EABI for our 
next major release.

thanks,

Dave
