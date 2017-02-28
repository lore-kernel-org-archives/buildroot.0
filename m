From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 17:10:34 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
	failure
In-Reply-To: <20170228163701.345645b1@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Feb 2017 16:37:01 +0100")
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170228000123.66658172@free-electrons.com>
 <87r32ik7vl.fsf@dell.be.48ers.dk>
 <20170228100542.2536f1d0@free-electrons.com>
 <87innujrrr.fsf@dell.be.48ers.dk>
 <20170228163701.345645b1@free-electrons.com>
Message-ID: <87y3wqi9dx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Wow, indeed!

 > But how does this fit with my findings with gdb, which were pointing at
 > a faulty instruction in the host libpixman?

Target libpixman, not host-pixman. From the log:

open("/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libpixman-1.so.0", O_RDONLY|O_CLOEXEC) = 3

So I guess it is all caused by host/target mismatch and the specific
optimization options selected.

-- 
Bye, Peter Korsgaard
