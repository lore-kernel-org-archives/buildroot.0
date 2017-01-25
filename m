From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 23:23:25 +0100
Subject: [Buildroot] [PATCH 1/2] arch: add OpenRISC architecture support
In-Reply-To: <20170125063507.GA2924@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Wed, 25 Jan 2017 07:35:07 +0100")
References: <20170125063507.GA2924@waldemar-brodkorb.de>
Message-ID: <87y3xyeq3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Add support for OpenRISC. See here for more details about
 > OpenRISC http://openrisc.io.

 > All buildroot included upstream binutils versions are supported.
 > Gcc support is not upstream, to be able to enable musl C library
 > support later, we use the branch with musl support.
 > At the moment it is possible to build a musl based toolchain,
 > but bootup in Qemu fails.

 > Gdb is only working to debug bare-metal code, there is no support
 > for gdbserver/gdb on Linux, yet.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Tested-by: Romain Naour <romain.naour@gmail.com>

 > ---
 > v1 -> v2: 
 >   * add SoB to numerated kernel patches, suggested by Romain
 >   * split defconfig and arch support patches, suggested by Thomas P.

 > +++ b/package/gcc/gcc.mk
 > @@ -13,11 +13,13 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 >  ifeq ($(BR2_arc),y)
 >  GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 >  GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 > +else ifeq ($(BR2_or1k),y)
 > +GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 > +GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 >  else
 >  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 > -endif
 > -
 >  GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
 > +endif

The way things are now structured the ?= isn't needed anymore, so I've
dropped it.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
