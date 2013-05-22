From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 16:04:05 +0200
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB1DCB9@DBDE04.ent.ti.com>
References: <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate>
 <1369020695818-45544.post@n4.nabble.com>
 <321768C95D21724485BCE784F1BE98473EB1D960@DBDE04.ent.ti.com>
 <20130522141715.70be80c2@skate>
 <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
 <20130522143117.02a92237@skate>
 <321768C95D21724485BCE784F1BE98473EB1DAA4@DBDE04.ent.ti.com>
 <20130522150653.611899a4@skate> <20130522153044.76f14e2d@skate>
 <321768C95D21724485BCE784F1BE98473EB1DCB9@DBDE04.ent.ti.com>
Message-ID: <20130522160405.3b37b060@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear prabindh,

On Wed, 22 May 2013 06:35:55 -0700 (PDT), prabindh wrote:

> Yes, I am talking about rebuilding the userspace libraries. I deliver
> the Graphics drivers for SGX.

Ah, nice to have you on board then :-) We may certainly have questions
as we integrate those libraries in Buildroot.

> The aspect of uclibc breaking compatibility was not clear to me
> earlier. How do you plan to support "any" closed source packages
> then ?

With (e)glibc libraries, that we support through the external toolchain
mechanism.

> Why cant we have backward compatibility in uclibc ?

I am not sure how accurate
https://www.kernel.org/pub/linux/libs/uclibc/Glibc_vs_uClibc_Differences.txt
is, must it says:

"""
3) uClibc does not even attempt to ensure binary compatibility across
releases. When a new version of uClibc is released, you may or may not
need to recompile all your binaries.
"""

That said, the uClibc web site, at http://www.uclibc.org/oldnews.html,
says:

"""
Please be aware we will break binary compatibilty in the upcoming
0.9.27 release to implement a few necessary changes we have been
postponing. That will hopefully be the last ABI change before we freeze
the ABI for the upcoming 1.0.x stable uClibc series. 
"""

So it looks like there was some intention about having a stable ABI at
some point. But this news was from 2004, and the 1.0.x stable uClibc
series still hasn't been released, 9 years later.

Maybe other people can comment? Or maybe we should bring the issue to
the uClibc developers and see what they say?

In the mean time, my expectation is that we will be using all those
binary-only libraries on top of glibc/eglibc only. If you're doing some
crazy OpenGL multimedia stuff, you can anyway afford the comparatively
small additional cost of using glibc/eglibc in your embedded Linux
system.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
