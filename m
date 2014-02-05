From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 08:47:08 +0100
Subject: [Buildroot] Broken pread() on ARM
In-Reply-To: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
 (Justin Maggard's message of "Tue, 4 Feb 2014 14:26:20 -0800")
References: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
Message-ID: <87wqha2e83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Justin" == Justin Maggard <jmaggard10@gmail.com> writes:

 > I'm using buildroot on a 32-bit ARM platform, and I have run into
 > pread issues after recently switching from buildroot-2013.05 to
 > buildroot-2013.11.  In both cases I'm using a generated uClibc
 > toolchain, and uClibc 0.9.33.2.  Comparing the strace outputs of both,
 > the offset shows up differently.  As an extra data point, I tried the
 > latest uClibc snapshot instead of 0.9.33.2, and it worked fine again.

 > I see there are a number of extra uClibc patches that were added
 > between 2013.05 and 2013.11.  Perhaps we have just the right
 > combination of backports to make some platforms work, while breaking
 > others?

Yes, unfortunately. See
http://lists.busybox.net/pipermail/buildroot/2014-January/087050.html
for details.

uClibc upstream is unfortunately not very active at the moment, so for
2014.02 I will simply revert patch 14, 21, 32 and 54.

-- 
Bye, Peter Korsgaard
