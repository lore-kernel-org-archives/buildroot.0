From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 12:45:40 +0200
Subject: [Buildroot] [PATCH 1/2] openblass: drop SSE_GENERIC target
In-Reply-To: <20180401084642.15199-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 1 Apr 2018 10:46:41 +0200")
References: <20180401084642.15199-1-peter@korsgaard.com>
Message-ID: <874lkvryqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #10856
 > The SSE_GENERIC target fails to build with a "sgemm_kernel.o: No such file
 > or directory" error. Several upstream bug reports exist for this:

 > https://github.com/xianyi/OpenBLAS/issues/502
 > https://github.com/xianyi/OpenBLAS/issues/685

 > In both cases, upstream suggests using a different target definition
 > instead.  E.G.  from issue 685:

 > You may use NORTHWOOD on x86: make TARGET=NORTHWOOD that uses SSE2
 > instructions.  It's very hard to find non-SSE2 x86 CPUs today.  For x86-64
 > use the PRESCOTT target

 > So drop the SSE_GENERIC target.  The only x86_64 variant we support not
 > covered by a more specific openblas target is the default variant, nocona.

 > Nocona was a Xeon variant of the P4 "Prescott" architecture, so use the
 > PRESCOTT openblas target:

 > https://en.wikipedia.org/wiki/Xeon#Nocona_and_Irwindale

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed after adding the jaguar variant, thanks.

-- 
Bye, Peter Korsgaard
