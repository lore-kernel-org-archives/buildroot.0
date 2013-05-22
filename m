From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 15:30:44 +0200
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB1DC4F@DBDE04.ent.ti.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate>
 <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate>
 <1369020695818-45544.post@n4.nabble.com>
 <321768C95D21724485BCE784F1BE98473EB1D960@DBDE04.ent.ti.com>
 <20130522141715.70be80c2@skate>
 <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
 <20130522143117.02a92237@skate>
 <321768C95D21724485BCE784F1BE98473EB1DAA4@DBDE04.ent.ti.com>
 <20130522150653.611899a4@skate>
 <321768C95D21724485BCE784F1BE98473EB1DC4F@DBDE04.ent.ti.com>
Message-ID: <20130522153044.76f14e2d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sundareson, Prabindh,

On Wed, 22 May 2013 13:26:53 +0000, Sundareson, Prabindh wrote:

> Ok. What I really meant is - I am "rebuilding" the drivers with the
> Buildroot toolchain (so, potentially there will be a newer binary
> package exclusively for Buildroot). With these new drivers, will
> Spenser be able to create the required recipe ?

When you mean "drivers", do you mean the kernel drivers or the
userspace libraries? As far as I know, the kernel drivers are
open-source, so anyone can rebuild them.

However, the userspace libraries are binary-only. Of course, it appears
that you work at TI, so maybe you have access to the source code of
those userspace libraries that are, for us mere mortals, binary-only.

If it's the case, rebuilding them with the Buildroot toolchain and
providing us with the resulting binary would not make much sense
unfortunately: the uClibc library that Buildroot uses in its internal
toolchain backend does not provide any kind of backward compatible ABI.
So whenever the uClibc version or configuration is changed, the ABI
might be broken. So using binary-only userspace libraries in an uClibc
context is particularly difficult, I'm afraid.

Or maybe you're talking about something else?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
