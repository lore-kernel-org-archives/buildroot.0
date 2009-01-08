From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 08 Jan 2009 22:56:39 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to
	disable	general patches
In-Reply-To: <878wplsw9q.fsf@macbook.be.48ers.dk>
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
	<200811151156.02393.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
	<878wplsw9q.fsf@macbook.be.48ers.dk>
Message-ID: <1231451799.9711.13.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-08 klockan 15:33 +0100 skrev Peter Korsgaard:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
>  Markus> The patches in target/u-boot/$(U_BOOT_VERSION)/ can conflict with custom
>  Markus> board specific patches, so this option is necessary.
> 
> I would rather get rid of any patches that are not strictly needed. We
> should only have patches for criticial bugfixes or build issues.
> 
> The number of configuration options we have in target/u-boot nowadays
> is getty silly.
> 
> Ulf, let me know what you think.

I can see a few alternatives.
1) Get rid of the patches, and introduce the possibility 
   to select a prepatched version with these patches

2) Keep the patches and prune them once 
   they are in mainstream.
   I am only interested in maintaing one set of patches
   for one version, so as I mentioned before,
   I submitted about half a dozen patches the last two days
   and it looks like they can enter the main tree,
   with maybe a little rework.

3) Do it the same way I did the Advanced Linux support
   Keep target/u-boot, but allow patches
   to be taken from the target/device/<whatever>
   In this case, the patches would go into 
   target/device/Atmel/arch-at91/u-boot-2009.01-rc1 
 
The last option is appealing.

BR
Ulf Samuelsson
