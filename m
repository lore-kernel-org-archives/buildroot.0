From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 6 Jul 2007 23:10:22 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
Message-ID: <01a401c7c012$190e7270$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Fri, Jul 06, 2007 at 02:35:32PM +0200, Ulf Samuelsson wrote:
>> Now, when I have access, I would like to understand the proper
>> procedure to add patches.
>> 
> I echo all of Bernard's input.
> 
>> * Update mtdutils (which is really old)
>>
> Please do not check in changes to this until running the patch by
> me. This package is critical for a lot of embedded systems and has
> been working well up to this point and there are no bugs in the
> bug tracker.

This patch is actually done in such a way that the user can 
select to user a newer mtd, but the default is the original mtd,
so it should not break anything.

>> * Bump versions on a number of packages which has disappeared from their
>>   download location.
>>         (dash, rmp, l2tp, mpfr,mrouted, openntpd, portage, pppd,udev)
>> * Add TARGET_CFLAGS to all packages not having this
>>         Would like to know if they lack TARGET_CFLAGS for a reason.
>>         (acpid,berkleydb, hdparm, iostat,ltp-testsuite,memtester,netkitbase,
>>          procps, python, sysklogd, tinyx,udhcp)
>>
> Again, please do not check in changes for the udev package either
> without letting me see the patch. This package is working well in
> production systems and bumping version just for the sake of getting
> latest and greatest is unnecessary unless bugs are being fixed. If
> the URL has changed to get to the source, then go ahead and check
> in a fix. I have not downloaded the current udev source in a while.
> 

It is broken since the download fails and moving to a new version will 
be one possible way of solving the problem.
Another possible way is to have a backup repository if the original tarball
is removed. This would need a $(WGET) script which knows several locations.

I think the most important thing we should add to buildroot is the concept
of distributions. I.E: allowing everyone can decide to "freeze" a certain package version
but also select to use the latest version.
I hope this would handle your needs as well as others.

> Secondly, after I finish my next set of check-ins, TARGET_CFLAGS is
> NOT to be used in any package build files. It will automatically be
> used as shown in 'package/Makefile.in' as part of the CC, CPP, and
> CXX tools. This leaves the individual packages the ability to specify
> their own CFLAGS during their builds. Same things goes for the
> TARGET_LDFLAGS variable. It should not be used in package build files
> either. I have already checked those changes in. I also plan on doing
> an audit of the use of TARGET_CC which annoys the heck out of me. I
> plan on removing usage of that too.
> 

No problems for my part.
I would like that all packages are treated alike, and if someone differs
then there should be a known reason why they differ.
This is not the case at the moment.

I sent in this suggestion about one year ago, and it was rejected without
a good explanation, and over time most of the packages has been updated
to use TARGET_CFLAGS.

> Cheers.
> 
> -Steve




Best Regards
Ulf Samuelsson
