From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Thu, 2 Oct 2008 11:33:44 +0200
Subject: [Buildroot] No rule to make target
	/buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.libs_installed
In-Reply-To: <20081002103159.26e11d5a@atmel.com>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B27CE@bfl-exchange-1.BFL.local>
	<20081002103159.26e11d5a@atmel.com>
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32B27E0@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
> Aha, you have enabled sysroot in GCC, I have not tested that. Could
you
> try the attached patch?

Yes, i have enabled sysroot. I think it's maybe neccessary because I
have three Buildroot's which I sometimes let run make at the same time.
And I just want to be sure they use the correct path.

> 
> If it does not work, there is something wrong ongoing in
> toolchain/gcc/gcc-uclibc-4.x.mk
> 
> > I've used make clean, make distclean, deleted toolchain_build_avr32
> > completely, played with make menuconfig, but I get this error every
> > time I run make.
> >
> > I guess that the point where this error occurs is in
> > toolchain/gcc/gcc-uclibc-4.x.mk (Line 390):
> > cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
> > cross_compiler gcc: uclibc-configured binutils gcc_initial \
> > 	$(LIBFLOAT_TARGET) uclibc \
> > 	$(GCC_BUILD_DIR2)/.installed
> > $(GCC_BUILD_DIR2)/.libs_installed \ $(GCC_TARGETS)
> >
> > But I don't know what to correct now.
> >
> 
> Let me know if the patch works for you.

The patch worked fine for me, the complete buildroot make finished
without failure.
A great Thank you for this patch and also the avahi patch yesterday (it
came just right, as I was running into this error and couldn't find a
solution since one hour or so)

Sebastian
