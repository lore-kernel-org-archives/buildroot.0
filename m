From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 10:33:25 +0100
Subject: [Buildroot]
	svn	commit:trunk/buildroot/target/device/Atmel/arch-avr32:kernel-patches-2.6.27.6
In-Reply-To: <87aba8253s.fsf@macbook.be.48ers.dk>
References: <20081220221939.4935476CEB@busybox.osuosl.org>
	<873agf8bnm.fsf@macbook.be.48ers.dk>
	<FC51A1FF4A8643D8A0C0B2C0DA0C5E2D@aeglos>
	<87aba8253s.fsf@macbook.be.48ers.dk>
Message-ID: <1230975205.8886.86.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 08:58 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> The way it works now the patches are for a specific major/minor
>  Ulf> combination but you select which kernel you want to use, and
>  Ulf> then you select which patchset.  You can apply 2.6.27.6 on top
>  Ulf> of 2.6.27.10 if you want to, but the name indicates which kernel
>  Ulf> it was intended for, and the further away you go in terms of
>  Ulf> major/minor revisions the higher the risk that the patch will
>  Ulf> not apply.
> 
> But why are you checking in something that is already obsolete? Why
> not base on 2.6.27.10 right away?

For Linux, I generally try to check in what I can find
on some key sites. These patches have been tested against
2.6.27.6 and while they may work on other versions
like 2.6.27.10 then it is up to the user
to test that out.

If the user does not like the patch, then it is easy
to deselect adding that patch.
It is also possible for the user to make a new patch
and use this instead of the one provided by the svn.

>  Ulf> When I get time, I will implement downloading the patchset
>  Ulf> instead of storing it in the svn.
>  Ulf> Then the size will go down.
> 
> And what about the older patches, can they go away?
> 

As I said in an earlier email, the long term plan
is to download the patches when needed, but 
time is limited and there are other things
that I think have higher priority.

The benefit of this is mainly diskspace and svn download time.
I measured svn download time and it was 25 seconds 
for a total of 39.5 MB.
The Atmel directory is 8,1MB or ~20% so this costs 5 seconds extra.
Admittedly I have a fast line (100 MBps + Fiber) at home, but 
any such thing will save ~ 1-2 seconds of download time, that's it.
At $100/500 GB the cost of hard disk space is $0.2/GB
or 0.8 cents for the complete svn and maybe 0.2 cents for the 
each target/device/Atmel directory. 
I.E: There is not a lot of gain.
?
Removing the config information to accomplish smaller svn 
footprint does not give any noticeable return IMHO.

It does speed up the time to start processing the make rules,
but it can't be much. On my ?P4-3.6GHz it takes about 3 seconds
to parse *all* the rules to determine what to do, and start
processing the first rule.
Removing "old" stuff cannot give any big return.

?I sympatize with the goal of keeping svn size down,
but I do not like the idea of only keeping the last
few kernels around.

As an example of higher priority items:
Doing the same for u-boot will allow us to get rid
of the AT91 specific u-boot directory.

I also today noted a mess regarding alsa
alsa-lib does not build due to lack of python-2.5 libraries.
python is 2.4.5 and upgrading to 2.5 or 3.0 fails
in configure due to no patches for cross-compiling.

BR
Ulf
