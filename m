From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Fri, 6 Jul 2007 10:55:58 -0500
Subject: [Buildroot] What is the proper procedure to commit a patch?
In-Reply-To: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
Message-ID: <20070706155558.GA18954@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 02:35:32PM +0200, Ulf Samuelsson wrote:
> Now, when I have access, I would like to understand the proper
> procedure to add patches.
> 
I echo all of Bernard's input.

> * Update mtdutils (which is really old)
>
Please do not check in changes to this until running the patch by
me. This package is critical for a lot of embedded systems and has
been working well up to this point and there are no bugs in the
bug tracker.

> * Bump versions on a number of packages which has disappeared from their
>   download location.
>         (dash, rmp, l2tp, mpfr,mrouted, openntpd, portage, pppd,udev)
> * Add TARGET_CFLAGS to all packages not having this
>         Would like to know if they lack TARGET_CFLAGS for a reason.
>         (acpid,berkleydb, hdparm, iostat,ltp-testsuite,memtester,netkitbase,
>          procps, python, sysklogd, tinyx,udhcp)
>
Again, please do not check in changes for the udev package either
without letting me see the patch. This package is working well in
production systems and bumping version just for the sake of getting
latest and greatest is unnecessary unless bugs are being fixed. If
the URL has changed to get to the source, then go ahead and check
in a fix. I have not downloaded the current udev source in a while.

Secondly, after I finish my next set of check-ins, TARGET_CFLAGS is
NOT to be used in any package build files. It will automatically be
used as shown in 'package/Makefile.in' as part of the CC, CPP, and
CXX tools. This leaves the individual packages the ability to specify
their own CFLAGS during their builds. Same things goes for the
TARGET_LDFLAGS variable. It should not be used in package build files
either. I have already checked those changes in. I also plan on doing
an audit of the use of TARGET_CC which annoys the heck out of me. I
plan on removing usage of that too.

Cheers.

-Steve
