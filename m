From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 23:27:51 +0100
Subject: [Buildroot] Searching for the right "make clean"
In-Reply-To: <20090114084246.42473a62@danhplaptop>
References: <20090114084246.42473a62@danhplaptop>
Message-ID: <1232058471.4757.70.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-14 klockan 08:42 -0800 skrev Dan Lyke:
> Silly question:
> 
> I'm using buildroot for an AT91SAM9261, and was getting some floating
> point behavior I didn't understand, so rather than be all smart about
> it I decided to force software floating point and rebuild my toolchain.
> 
> Simply checking that box under "Toolchain" in the "make menuconfig",
> followed by "make clean; make" failed with errors that things were
> compiled with hardware floating point, so I grepped the Makefile for
> "clean", tried "make dirclean", that failed, and then did a "make
> distclean" which blew away more than I wanted to.
> 
> What's the right "clean" for me to have typed?


Once you change a toolchain option, you should probably 
remove everything and start afresh.

THere is nothing you need to save except the configs
which you can do with make saveconfig.


I.E: rm:
	binaries
	build_ARCH
	toolchain_build_ARCH
	project_build_ARCH

BR
Ulf Samuelsson

> 
> Thanks.
> 
> Dan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
