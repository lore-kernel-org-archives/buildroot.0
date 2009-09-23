From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 14:41:07 +0200
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <4ABA02F3.6020706@mimc.co.uk> (Mark Jackson's message of "Wed\,
	23 Sep 2009 12\:13\:55 +0100")
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
	<4AB9FE2D.1080009@mimc.co.uk> <87my4lrke1.fsf@macbook.be.48ers.dk>
	<4ABA02F3.6020706@mimc.co.uk>
Message-ID: <87eipxrfz0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:

Hi,

 Mark> mpfj at mpfj-x64:~/avr32/buildroot$ ls -la ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
 Mark> -rw-rw-rw- 1 mpfj mpfj 21720 2009-09-23 10:45 ./target/device/Atmel/atngw100-base/atngw100-base_defconfig
 Mark> mpfj at mpfj-x64:~/avr32/buildroot$ make atngw100-base_defconfig
 Mark> make: *** No rule to make target `atngw100-base_defconfig'. Stop.
 Mark> mpfj at mpfj-x64:~/avr32/buildroot$ 

very odd. The makefile rule (in the toplevel Makefile) is simply:

%_defconfig: $(CONFIG)/conf
        cp $(shell find ./target/ -name $@) .config
        -@$(MAKE) oldconfig

So I don't get it why it doesn't trigger for you. Does a simple 'make
blah_defconfig' work for you?

Does it work with the 2009.08 release? What version of make are you using?

-- 
Bye, Peter Korsgaard
