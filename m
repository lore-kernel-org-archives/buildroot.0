From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 16 Jan 2009 10:42:07 +0100
Subject: [Buildroot] Searching for the right "make clean"
In-Reply-To: <1232058471.4757.70.camel@aeglos.sweden.atmel.com>
References: <20090114084246.42473a62@danhplaptop>
	<1232058471.4757.70.camel@aeglos.sweden.atmel.com>
Message-ID: <1232098927.6639.10.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-15 at 23:27 +0100, Ulf Samuelsson wrote:

> Once you change a toolchain option, you should probably 
> remove everything and start afresh.
> 
> THere is nothing you need to save except the configs
> which you can do with make saveconfig.
> 
> 
> I.E: rm:
> 	binaries
> 	build_ARCH
> 	toolchain_build_ARCH
> 	project_build_ARCH

It would help a lot if there was a dedicated make target for this.

We have has this problem several times now. Whenever we change a
configuration in the toolchain or in uclibc, everything needs to be
rebuilt. Unfortunately the Makefile does not automatically care about
this dependency. So one has make sure that the tree is clean before
running the build again. If there was a target that would take care of
this, that would help a lot.


Sven
