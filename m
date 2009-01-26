From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 26 Jan 2009 15:30:34 +0100
Subject: [Buildroot] Error encountered while doing make after adding
 u-boot
In-Reply-To: <87skn687sf.fsf@macbook.be.48ers.dk>
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
	<20090126144012.4e62179b@hcegtvedt>
	<87wsci88t8.fsf@macbook.be.48ers.dk>
	<20090126151732.7c6aa021@hcegtvedt>
	<87skn687sf.fsf@macbook.be.48ers.dk>
Message-ID: <20090126153034.21798ced@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Jan 2009 15:24:16 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> This BOARD_NAME variable seems to be an ARM/Atmel specific thing.
>  >> 
> 
>  Hans-Christian> You can not default to $(PROJECT), since this
>  Hans-Christian> variable is used to load a configuration for u-boot
>  Hans-Christian> build system and must exist.
> 
> But you can default to $(BOARD_NAME) which isn't set for most people?
> 
> PROJECT atleast has a chance of being something close to what the user
> wants.
> 

Perhaps, but...

>  Hans-Christian> Perhaps default to a known to work config? Take a
>  Hans-Christian> peak in u-boot source ./Makefile.
> 
> Naah, to much work as that's arch dependent. Then I would rather add a
> big fat $(error) in the U-Boot Makefile.in if the thing evaluates to
> nothing.
> 

... I think checking for an empty config name is better, and print an
appropriate message before quiting. If the PROJECT happens to work,
that still might not be the u-boot config the user wants, and he/she
does not understand why u-boot does not work afterwards.

And in most instances the PROJECT name will not match a U-Boot config.

-- 
Best regards,
Hans-Christian Egtvedt
