From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 23 Sep 2009 13:45:46 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <87eipxrfz0.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk>
	<874oqurm9z.fsf@macbook.be.48ers.dk>	<4AB9FE2D.1080009@mimc.co.uk>
	<87my4lrke1.fsf@macbook.be.48ers.dk>	<4ABA02F3.6020706@mimc.co.uk>
	<87eipxrfz0.fsf@macbook.be.48ers.dk>
Message-ID: <4ABA187A.5010709@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:
> 
> Hi,
> 
>  Mark> mpfj at mpfj-x64:~/avr32/buildroot$ ls -la ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
>  Mark> -rw-rw-rw- 1 mpfj mpfj 21720 2009-09-23 10:45 ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
>  Mark> mpfj at mpfj-x64:~/avr32/buildroot$ make atngw100-base_defconfig
>  Mark> make: *** No rule to make target `atngw100-base_defconfig'. Stop.
>  Mark> mpfj at mpfj-x64:~/avr32/buildroot$ 
> 
> very odd. The makefile rule (in the toplevel Makefile) is simply:
> 
> %_defconfig: $(CONFIG)/conf
>         cp $(shell find ./target/ -name $@) .config
>         -@$(MAKE) oldconfig

I looked at this and put in some @echo lines before and after the cp.
They were never executed !?!  Is this some bash / dash setup thing ?

mpfj at mpfj-x64:~/avr32/buildroot$ uname -a
Linux mpfj-x64 2.6.28-15-generic #49-Ubuntu SMP Tue Aug 18 19:25:34 UTC 2009 x86_64 GNU/Linux

> So I don't get it why it doesn't trigger for you. Does a simple 'make
> blah_defconfig' work for you?

No ... everything comes up "no rule to make".

> Does it work with the 2009.08 release? What version of make are you using?

2009.08 release of buildroot ?  It's not out yet is it ?

mpfj at mpfj-x64:~/avr32/buildroot$ make -v
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu
