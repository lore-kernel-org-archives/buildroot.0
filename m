From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 17:18:10 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <1231257412.32308.148.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 16\:56\:52 +0100")
References: <20090103000614.1DC5F769FA@busybox.osuosl.org>
	<87mye4qz4d.fsf@macbook.be.48ers.dk>
	<1231255007.32308.107.camel@elrond.atmel.com>
	<874p0cpiau.fsf@macbook.be.48ers.dk>
	<1231257412.32308.148.camel@elrond.atmel.com>
Message-ID: <87vdsso1bx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> ?There will be some other fixes due to the CFG->CONFIG(_SYS)
 >> 
 >> Yes, that's what I mentioned last week. This again will complicate
 >> stuff when we're supporting 3+ U-Boot versions.
 >> 

 Ulf> I only submit the patches to the 2009.01-rc1 directory,

Yes, but the stuff you do with setting U-Boot configuration variables
from within Buildroot needs to handle both CFG_ and CONFIG_SYS_
variants, E.G. stuff like:

CFG_DDR_SIZE got turned into CONFIG_SYS_DDR_SIZE, same for
CFG_FLASH_SIZE or whatever defines you are using.

 Ulf> Contary on my opinion on linux, I do not mind if we
 Ulf> obsolete older u-boot versions, like 1.3.4.
 Ulf> Also, I am not hurt if we keep it.

I would like to deprecate 1.3.4 atleast - And I guess the AT91 1.2.0
thing as well?


 >> They just have to try again like the rest of us, or maybe ping
 >> wdenx on irc.

 Ulf> That is what they are doing now, but the SAM9G20 support is
 Ulf> too new to have been submitted to trunk.
 Ulf> It is done for 1.3.4 but can not be submitted to
 Ulf> 2009.01-rc1 dues to the changes CFG->CONFIG.

Why was that work done for the ancient 1.3.4 in the first place?

 Ulf> Currently the merge window is closed, but I expect
 Ulf> to submit the board support patches and some of the
 Ulf> new commands end of January.
 >> 
 >> Ok, please do so. There's afaik nothing stopping you from submitting
 >> patches now so they can be integrated by the arm/at91 subtree
 >> maintainer.

 Ulf> I did submit a patch outside the merge window some time ago,
 Ulf> and then I did not feel that was appreciated,
 Ulf> but that was maybe before the custodian concept was 
 Ulf> fully established.

It afaik works like the Linux kernel now, so you should preferably get
your patches in the custodians git tree BEFORE the merge window opens.

 Ulf> The factory default command relies heavily on
 Ulf> the buildroot configuration, so it may make less
 Ulf> sense to include that in the main u-boot trunk.
 >> 
 >> What's the point of it? Is it any different than simply erasing the
 >> environment and resetting the board?

 Ulf> Yes, once you run the "factory" command, your environment
 Ulf> is set up so you can download and flash the kernel and rootfs
 Ulf> with a simple command.

But why don't you simply setup those environment settings in the
default config (CONFIG_EXTRA_ENV_SETTINGS) ? That's what other people
do. Then it's just a matter of clearing your environment and your back
to scratch.

 Ulf> Once you are away from your development environment
 Ulf> and has changed the environment, you are screwed.

Why? just erase and reset.

 Ulf> It is especially useful for newbies which have zero
 Ulf> experience with linux/u-boot.
 Ulf> I have several hundred companies working on AT91 
 Ulf> stuff in my region, many of them complete newbies.
 Ulf> I need to support them all, and if things are difficult,
 Ulf> it will simply fall to pieces.

Ok, but maybe that would be a feature of the Atmel buildroot fork
then?

 Ulf> Would you hand a board over to your grandmother
 Ulf> and then help her over the phone to boot linux?
 Ulf> It really needs to be so simple that this
 Ulf> approach has a fair chance of succeeding.

Then I don't believe buildroot is the correct solution for them.

 >> I don't like us carrying feature patches in buildroot.

 Ulf> the "because" and the rest of the statement seems
 Ulf> to have been filtered away somewhere ;-)

Because we don't have enough ressources to maintain all the other
stuff as it is, without carrying (and maintaining/supporting/..) new
features to upstream projects.

Upstream development belongs in the upstream projects, not in
buildroot - Anything else doesn't scale in the long run.

-- 
Bye, Peter Korsgaard
