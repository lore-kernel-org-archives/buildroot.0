From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 May 2012 13:52:53 +0200
Subject: [Buildroot] Buildroot and linux-pam?
In-Reply-To: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
References: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
Message-ID: <20120516135253.48a500b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dmitry,

Le Wed, 16 May 2012 06:32:14 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> It looks like linux-pam was never included in Buildroot, and there are
> few packages* where use of pam was explicitly disabled.
> 
> I managed to compile it with Buildroot though [1] with a number of
> hacks and workarounds. I tested it (at least pam_exec) with Qingy as a
> login program.
> 
> If I provide a better quality patch, will linux-pam be accepted? If
> yes, will there be any objections to (conditionally) enabling pam at
> least in systemd?

There will at least be no objection on my side, and in general, people
are fine with adding new features to existing packages.

> I am interested in both for my buildroot-based project which needs an
> authrntication facility. If for some reason linux-pam cannot be
> accepted, I'll keep this stuff as part of my project outside the
> buildroot tree.
> 
> Please let me know your opinion, or any suggestions how to improve the
> Makefile (apart from obvious cleanups).

We would definitely welcome libpam as a package. Your hacks don't look
really big, and there are probably ways to make them look a bit nicer.
You're apparently modifying the config.h manually, which is generated
by ./configure script. Isn't it possible by passing environment
variables to the ./configure script, to ensure that the problematic
test gets the appropriate value?

If you give a little bit more details on which problems those hacks are
solving, I'm sure we can help you to come up with solutions.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
