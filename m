From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 08:49:08 +0100
Subject: [Buildroot] Broken pread() on ARM
In-Reply-To: <CAKgsxVSJAW73vXdkKQFLZOYp3qzZm9qwF5+p0NUtUUSnzsFZtQ@mail.gmail.com>
 (Justin Maggard's message of "Tue, 4 Feb 2014 16:21:01 -0800")
References: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
 <CAKgsxVSJAW73vXdkKQFLZOYp3qzZm9qwF5+p0NUtUUSnzsFZtQ@mail.gmail.com>
Message-ID: <87siry2e4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Justin" == Justin Maggard <jmaggard10@gmail.com> writes:

Hi,

 > Okay, it looks like some of the pread/pwrite changes that have made
 > their way into the uClibc 0.9.33 branch fail to consider some
 > architectures.  I have made a rather odd-looking change locally that
 > makes it work for me on my ARM platform, which uses _syscall6() for
 > pread() and pread64() if __UCLIBC_TRUNCATE64_HAS_4_ARGS__ is defined.
 > Would that be worth sending to the list, or would it be better to fix
 > it some other way?

The best approach would be to get it fixed in uClibc git (and preferably
to get them to finally release 0.9.33.3).

This particular issue also fixed on the uClibc master branch (E.G. what
should become 0.9.34) - But when I had a look at it, it didn't seem
trivial to backport.

-- 
Bye, Peter Korsgaard
