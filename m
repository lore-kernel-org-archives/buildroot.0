From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 10:05:42 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
	failure
In-Reply-To: <87r32ik7vl.fsf@dell.be.48ers.dk>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170228000123.66658172@free-electrons.com>
 <87r32ik7vl.fsf@dell.be.48ers.dk>
Message-ID: <20170228100542.2536f1d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 10:00:14 +0100, Peter Korsgaard wrote:

> Is that the complete strace output? Where is fd 3 getting opened? I
> would imagine the problem is caused by some kind of host/target
> libraries mixup.

No, that's only the end of the strace output. I've posted the full
strace output at:

  http://code.bulix.org/elused-120071

File descriptor 3 is:

open("/lib/x86_64-linux-gnu/libm.so.6", O_RDONLY|O_CLOEXEC) = 3

Which looks correct to me, when running a host binary on the host machine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
