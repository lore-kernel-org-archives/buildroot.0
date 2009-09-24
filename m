From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 24 Sep 2009 11:50:59 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <87eipxrfz0.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk>
	<874oqurm9z.fsf@macbook.be.48ers.dk>	<4AB9FE2D.1080009@mimc.co.uk>
	<87my4lrke1.fsf@macbook.be.48ers.dk>	<4ABA02F3.6020706@mimc.co.uk>
	<87eipxrfz0.fsf@macbook.be.48ers.dk>
Message-ID: <4ABB4F13.9060102@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:

<snip>

> 
> %_defconfig: $(CONFIG)/conf
>         cp $(shell find ./target/ -name $@) .config
>         -@$(MAKE) oldconfig
> 
> So I don't get it why it doesn't trigger for you. Does a simple 'make
> blah_defconfig' work for you?

The makefile seems to be looking for the file, but can't find it:-

mpfj at mpfj-x64:~/avr32/buildroot$ make --debug atngw100-base_defconfig
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu
Reading makefiles...
Updating goal targets....
 File `atngw100-base_defconfig' does not exist.
Must remake target `atngw100-base_defconfig'.
make: *** No rule to make target `atngw100-base_defconfig'. Stop.
mpfj at mpfj-x64:~/avr32/buildroot$ 
