From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 26 Jan 2009 15:17:32 +0100
Subject: [Buildroot] Error encountered while doing make after adding
 u-boot
In-Reply-To: <87wsci88t8.fsf@macbook.be.48ers.dk>
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
	<20090126144012.4e62179b@hcegtvedt>
	<87wsci88t8.fsf@macbook.be.48ers.dk>
Message-ID: <20090126151732.7c6aa021@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Jan 2009 15:02:11 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
>  Hans-Christian> On Mon, 26 Jan 2009 18:36:16 +0530
>  Hans-Christian> Mitesh Gupta <guptamitesh@gmail.com> wrote:
> 
>  Hans-Christian> <snipp>
> 
>  >> make[1]: Entering directory
>  >> `/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10'
>  >> make[1]: *** No rule to make target `_config'.  Stop.
> 
>  Hans-Christian> You need to set the variable
> BR2_TARGET_UBOOT_BOARDNAME.
> 
> Why is it again we don't default to $(PROJECT) for this?
> 
> This BOARD_NAME variable seems to be an ARM/Atmel specific thing.
> 

You can not default to $(PROJECT), since this variable is used to load
a configuration for u-boot build system and must exist.

Perhaps default to a known to work config? Take a peak in u-boot
source ./Makefile.

-- 
Best regards,
Hans-Christian Egtvedt
