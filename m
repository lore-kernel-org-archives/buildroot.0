From: MikeW <mw_phil@yahoo.co.uk>
Date: Fri, 1 Dec 2006 10:13:59 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?Impossible_to_build_EABI_ARM_gcc_toolchain?=
	=?utf-8?q?=09using=09Buildroot_=3F?=
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
	<loom.20061130T112254-849@post.gmane.org>
	<1164960699.4870.67.camel@dv>
Message-ID: <loom.20061201T110658-119@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pavel Roskin <proski@...> writes:


> There are already patches for gcc in buildroot that change
> TARGET_LINKER_EMULATION for bigendian systems and uClibc.  I think
> support for EABI belongs there too.
> 

So looking at 800-arm-bigendian.patch, it would appear
that I need to
1) in config.gcc, have a case $target that detects
 *eabi and sets a TARGET_EABI flag
2) in linux-elf.h, have another #if TARGET_EABI ... #else ... #endif
 which just tags "_eabi" onto all of the other strings, if EABI is active

Does this make sense ?

Or is there an official GCC patch to do this (I have searched!)

Since other people are building ARM EABI versions of gcc, there must
be a patch that they are using which somehow has been omitted
from Buildroot :(

Regards,
Mike
