From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 15:50:27 +0100
Subject: [Buildroot] Error encountered while doing make after adding
	u-boot
In-Reply-To: <20090126153034.21798ced@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Mon\, 26 Jan 2009 15\:30\:34 +0100")
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
	<20090126144012.4e62179b@hcegtvedt>
	<87wsci88t8.fsf@macbook.be.48ers.dk>
	<20090126151732.7c6aa021@hcegtvedt>
	<87skn687sf.fsf@macbook.be.48ers.dk>
	<20090126153034.21798ced@hcegtvedt>
Message-ID: <87ocxu86ks.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> Naah, to much work as that's arch dependent. Then I would rather add a
 >> big fat $(error) in the U-Boot Makefile.in if the thing evaluates to
 >> nothing.
 >> 

 Hans-Christian> ... I think checking for an empty config name is
 Hans-Christian> better, and print an appropriate message before
 Hans-Christian> quiting. If the PROJECT happens to work, that still
 Hans-Christian> might not be the u-boot config the user wants, and
 Hans-Christian> he/she does not understand why u-boot does not work
 Hans-Christian> afterwards.

Ok, done - It gives something like:

target/u-boot/Makefile.in:287: *** NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting.  Stop.

That seems pretty clear to me.

 Hans-Christian> And in most instances the PROJECT name will not match
 Hans-Christian> a U-Boot config.

Maybe, in the kind of setup I'm normally doing it does, but maybe not
for others.

-- 
Bye, Peter Korsgaard
