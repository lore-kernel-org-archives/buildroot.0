From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Sep 2009 09:57:17 +0200
Subject: [Buildroot] ARCH=mips and linux-2.6.30.2
In-Reply-To: <1253809626.16645.27.camel@xd-02.opusvl.com> (Dominic Mason's
	message of "Thu\, 24 Sep 2009 17\:27\:06 +0100")
References: <1253809626.16645.27.camel@xd-02.opusvl.com>
Message-ID: <87bpkzv4ma.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dominic" == Dominic Mason <dominic@opusvl.com> writes:

Hi,

 Dominic> This is using buildroot-2009-08 with kernel 2.6.30.2

 Dominic> For what it's worth, if you copy arch/mips/lib/delay.c 
 Dominic> from a vanilla 2.6.30.4 kernel, then the error disappears.

Really?

diff -u linux-2.6.30.{2,4}/arch/mips/lib/delay.c
(nothing)

It seems like this fix hasn't made it to any 2.6.30.x stable releases
yet, but is in mainline since 2.6.31-rc1.

I'll add the patch to kernel-headers, so it should get included if you
use git and select the simple Linux kernel option.

-- 
Bye, Peter Korsgaard
