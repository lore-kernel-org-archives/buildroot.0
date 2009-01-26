From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 15:24:16 +0100
Subject: [Buildroot] Error encountered while doing make after adding
	u-boot
In-Reply-To: <20090126151732.7c6aa021@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Mon\, 26 Jan 2009 15\:17\:32 +0100")
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
	<20090126144012.4e62179b@hcegtvedt>
	<87wsci88t8.fsf@macbook.be.48ers.dk>
	<20090126151732.7c6aa021@hcegtvedt>
Message-ID: <87skn687sf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> This BOARD_NAME variable seems to be an ARM/Atmel specific thing.
 >> 

 Hans-Christian> You can not default to $(PROJECT), since this
 Hans-Christian> variable is used to load a configuration for u-boot
 Hans-Christian> build system and must exist.

But you can default to $(BOARD_NAME) which isn't set for most people?

PROJECT atleast has a chance of being something close to what the user
wants.

 Hans-Christian> Perhaps default to a known to work config? Take a
 Hans-Christian> peak in u-boot source ./Makefile.

Naah, to much work as that's arch dependent. Then I would rather add a
big fat $(error) in the U-Boot Makefile.in if the thing evaluates to
nothing.

-- 
Bye, Peter Korsgaard
