From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 10:52:19 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212104501.49d25561@skate> (Thomas Petazzoni's message of
 "Wed, 12 Feb 2014 10:45:01 +0100")
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate> <87iosku1n0.fsf@dell.be.48ers.dk>
 <20140212102958.343a7ba8@skate> <87eh38u0u3.fsf@dell.be.48ers.dk>
 <20140212104501.49d25561@skate>
Message-ID: <87a9dwu08c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> But orc is a JIT code generator, and from the source code it seems it
 >> only handles ARM/PowerPC/x86.

 > True. Odd that their configure script doesn't bail out after checking
 > the target architecture.

 > Things worth mentioning:

 >  * They have a newer 0.4.17 version that has MIPS support, as well as
 >    PowerPC64 support.

Ehh, we currently use 0.4.18 (which doesn't seem to match their git tree
and doesn't have a RELEASE file)?


 >  * Their README suggest a way of reducing the size of the library that
 >    we are not using:

 > """
 >    A: For embedded users, the --enable-backend configure option can
 >    be used to disable irrelvant targets.  Compiled with only one target
 >    (SSE), the library size is about 150 kB uncompressed, or 48 kB
 >    compressed.  The goal was to keep the uncompressed size under
 >    about 100 kB (but that failed!).  A typical build with all targets
 >    and the full ABI is around 350 kB.
 > """

Ahh yes, that could be good to use.

-- 
Bye, Peter Korsgaard
