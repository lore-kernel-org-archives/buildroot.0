From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 12:38:57 +0200
Subject: [Buildroot] [PATCH 1/2] openblass: drop SSE_GENERIC target
In-Reply-To: <8e50e37d-589f-6ae7-5bd3-feef97bf05d7@mind.be> (Arnout
 Vandecappelle's message of "Sun, 1 Apr 2018 11:51:52 +0200")
References: <20180401084642.15199-1-peter@korsgaard.com>
 <8e50e37d-589f-6ae7-5bd3-feef97bf05d7@mind.be>
Message-ID: <878ta7rz26.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 01-04-18 10:46, Peter Korsgaard wrote:
 >> Fixes #10856
 >> 
 >> The SSE_GENERIC target fails to build with a "sgemm_kernel.o: No such file
 >> or directory" error. Several upstream bug reports exist for this:
 >> 
 >> https://github.com/xianyi/OpenBLAS/issues/502
 >> https://github.com/xianyi/OpenBLAS/issues/685
 >> 
 >> In both cases, upstream suggests using a different target definition
 >> instead.  E.G.  from issue 685:
 >> 
 >> You may use NORTHWOOD on x86: make TARGET=NORTHWOOD that uses SSE2
 >> instructions.  It's very hard to find non-SSE2 x86 CPUs today.  For x86-64
 >> use the PRESCOTT target
 >> 
 >> So drop the SSE_GENERIC target.  The only x86_64 variant we support not
 >> covered by a more specific openblas target is the default variant, nocona.

 >  Actually, I think BR2_x86_corei7_avx is not covered either. And BR2_x86_jaguar.

corei7_avx is:

default "SANDYBRIDGE"  if BR2_x86_corei7_avx

But jaguar indeed isn't. Jaguar is in the bobcat family so I'll add a
default "BOBCAT" entry for it:

https://en.wikipedia.org/wiki/List_of_AMD_microprocessors#Bobcat_core_architecture_(APU)

>  These openblas targets really are an unmaintainable mess...

Indeed :/

-- 
Bye, Peter Korsgaard
