From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 2 Jun 2007 10:41:52 +0200
Subject: [Buildroot] mpfr error on cygwin for arm
In-Reply-To: <4660C796.70902@gmail.com>
References: <465F9792.9000200@gmail.com> <20070601094409.GA23984@aon.at>
	<46608246.5060008@gmail.com> <20070601221115.GI12010@aon.at>
	<4660C796.70902@gmail.com>
Message-ID: <20070602084151.GJ12010@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 01, 2007 at 06:27:50PM -0700, Tom wrote:
>
>
>Bernhard Fischer wrote:
>>On Fri, Jun 01, 2007 at 01:32:06PM -0700, Tom wrote:
>>>Hi Bernhard,
>>>
>>>Per your request, now attached the patch cygwin-3a.svndiff as an svn 
>>>diff to the current trunk.
>>
>>Well, that one applies cleanly, thanks, but you do not use the
>>corrected extensions at all?
>>
>>How does that help with building a useable rootfs? Just curious..
>
>This patch is only the first step. It got me past gmp and mpfr. This has 
>been good enough to build a cygwin toolchain with a host gdb, which in 
>turn has been used to compile, debug and run a kernel :).

Ah, ok.

>Maybe this is also good enough for a first check-in, is it?

yes, it went in as r18723. Thanks.

>I see that more work is ahead of me before I can build the rootfs, and 
>it would be good if I can verify my understanding of what needs to be 
>done, using mpfr as an example:
>-I need to change package/mpfr/mpfr.mk (hardcoded extensions, maybe 
>strip cmd).

right
>
>-This package/mpfr folder is the only place where I can make changes; 
>anything else about the mpfr module just downloaded / configured code, 
>right?

exactly.
