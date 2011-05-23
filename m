From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 May 2011 16:31:12 +0200
Subject: [Buildroot] Some build failures to solve for volunteers
In-Reply-To: <BANLkTinD8BNxzLKe8bR940aeFNxANr85vg@mail.gmail.com> ("Daniel
	=?utf-8?Q?Nystr=C3=B6m=22's?= message of "Mon,
	23 May 2011 14:42:12 +0200")
References: <20110522171916.0ba1bba7@surf>
	<BANLkTinq4Nr71bL3+O+nfUXbYvJzu36GJw@mail.gmail.com>
	<20110523142820.14924d4c@surf>
	<BANLkTinD8BNxzLKe8bR940aeFNxANr85vg@mail.gmail.com>
Message-ID: <87mxid1ob3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

Hi,

 Daniel> There's no problem running Buildroot builds with Buildbot. I do
 Daniel> actually have one running here locally for our local needs. :)

Here as well.

 Daniel> One could set "make randpackageconfig" as one step of the build
 Daniel> process in the Factory, but that makes it hard to find patterns in the
 Daniel> failing builds, hence my suggestion of one toolchain per slave and all
 Daniel> options enabled. Maybe there's other advantages of random configs?

Well, it's a trade off between us wanting reproducable builds and
wanting to test as many configurations as possible.

My current (private) setup involves randpackageconfig and then archiving
the .config and the entire build log, but that easily grows to something
quite unhandy for querying (E.G. in what other builds with a specific
toolchain config and package A+B but not C did it succeed).

-- 
Bye, Peter Korsgaard
