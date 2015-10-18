From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 18 Oct 2015 15:13:13 +0100
Subject: [Buildroot] [PATCH RFC v2] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <20151015234046.614e0fd0@free-electrons.com>
References: <1443458077-864-1-git-send-email-brendanheading@gmail.com>
 <20151015234046.614e0fd0@free-electrons.com>
Message-ID: <CA+BsyQ5W+VXtRBbW=Hy9R5cxu4QOeBz-xrBYVnPrJSUNnm27DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> +Upstream-status: inappropriate
>
> Why ?

There was a bit of debate a few weeks ago on whether or not to submit
the proposed changes upstream, but either way, it was never going to
be likely that we'd get them to accept a patch against an old version
of GCC that is in maintenance-only mode.

>> +       gcc_cv_libc_provides_ssp=yes
>
> What prevents uClibc from ever matching this case? Shouldn't the
> __UCLIBC__ case be *before* any __GLIBC__ case ?

Don't recall, but now it's academic now, as your proposed solution is better.

> My proposal would be something like:
>
>         http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=fix-ssp
>
> (see the last three commits)
>
> I am currently doing a test build of glibc, uClibc w/ SSP, uClibc w/o
> SSP and musl to see how it goes. But I believe it's actually simpler
> than patching gcc, no?

Definitely, I always thought that trying to get patches upstream
and/or maintaining the patches locally would be a pain. I'd assumed
that someone in the past had a good reason for adding the SSP checks
in a patch for these cases, rather than using the cache variable, so I
did not consider that option.

I've mark my patch proposal as superseded.

At least there is now a fix though, this should kill off a sizeable
bunch of autobuild problems.

Brendan
