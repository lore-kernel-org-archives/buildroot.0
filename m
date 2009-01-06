From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 16:56:52 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <874p0cpiau.fsf@macbook.be.48ers.dk>
References: <20090103000614.1DC5F769FA@busybox.osuosl.org>
	<87mye4qz4d.fsf@macbook.be.48ers.dk>
	<1231255007.32308.107.camel@elrond.atmel.com>
	<874p0cpiau.fsf@macbook.be.48ers.dk>
Message-ID: <1231257412.32308.148.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 16:26 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> I discovered I made a mistake and checked in the
>  Ulf> 1.3.4 patch so it will be updated later today
> 
>  Ulf> The original is part of the atmel 1.3.4 patch freom www.linux4sam.org
> 
> Why is that not in mainline U-Boot?
> 


>  Ulf> ?There will be some other fixes due to the CFG->CONFIG(_SYS)
> 
> Yes, that's what I mentioned last week. This again will complicate
> stuff when we're supporting 3+ U-Boot versions.
> 

I only submit the patches to the 2009.01-rc1 directory,

Contary on my opinion on linux, I do not mind if we
obsolete older u-boot versions, like 1.3.4.
Also, I am not hurt if we keep it.

I did not want to remove that myself because I know the
hassle depreciation can cause.
It also made sense to have the last stable version,
as well as the development version available.
?UNless someone disagrees, 
I plan to move to 2009.01 when available and delete 2009.01-rc1


??Other may want to keep older u-boot versions, 
but need to voice that opinion.
So far only you have commented the new u-boot.

----
Generally U-Boot should have much less priority 
or deprecation than the contents of the root file system, 
because it has a very simple API if you use the vanilla version
and has zero dependency on the root fs.

make <board>_config
make

Hard to go wrong, if the toolchain works.


>  Ulf> I have tested the new patches to build for all possible AT91 targets
>  Ulf> in buildroot as well as for a PowerPC target.
> 
>  Ulf> Generally on patches to u-boot:
>  Ulf> The AT91 team got zero response from the U-Boot during 2003-2005
>  Ulf> so they dropped all attempts to submit new stuff.
> 
> They just have to try again like the rest of us, or maybe ping wdenx
> on irc.

That is what they are doing now, but the SAM9G20 support is
too new to have been submitted to trunk.
It is done for 1.3.4 but can not be submitted to
2009.01-rc1 dues to the changes CFG->CONFIG.

> I know he can be a pain, but that's his job.
> 
>  Ulf> After it was decided to split the responsibilities up
>  Ulf> to several people, the submission process has improved a lot, 
>  Ulf> so the AT91 team started to be interested again last year.
>  Ulf> The board support for AT91 processors has improved.
>  Ulf> The AT91RM9200 has less priority on support from the product line
>  Ulf> and has therefore not been submitted, even if patches
>  Ulf> has been available for a long time.
> 
>  Ulf> Currently the merge window is closed, but I expect
>  Ulf> to submit the board support patches and some of the
>  Ulf> new commands end of January.
> 
> Ok, please do so. There's afaik nothing stopping you from submitting
> patches now so they can be integrated by the arm/at91 subtree
> maintainer.

I did submit a patch outside the merge window some time ago,
and then I did not feel that was appreciated,
but that was maybe before the custodian concept was 
fully established.



>  Ulf> The factory default command relies heavily on
>  Ulf> the buildroot configuration, so it may make less
>  Ulf> sense to include that in the main u-boot trunk.
> 
> What's the point of it? Is it any different than simply erasing the
> environment and resetting the board?

Yes, once you run the "factory" command, your environment
is set up so you can download and flash the kernel and rootfs
with a simple command.
You also have the bootcmd and bootargs set up properly
based on which root file system type you have.
If you care to enter the setup on your PC,
then you will most likely notice a possibility
to reset to factory defaults.
U-Boot does not support this at the momemnt.
It supports downloading an autoscript
or compile time defaults.
Once you are away from your development environment
and has changed the environment, you are screwed.

It is especially useful for newbies which have zero
experience with linux/u-boot.
I have several hundred companies working on AT91 
stuff in my region, many of them complete newbies.
I need to support them all, and if things are difficult,
it will simply fall to pieces.

Would you hand a board over to your grandmother
and then help her over the phone to boot linux?
It really needs to be so simple that this
approach has a fair chance of succeeding.



> I don't like us carrying feature patches in buildroot.

the "because" and the rest of the statement seems
to have been filtered away somewhere ;-)


> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
