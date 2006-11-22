From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 22 Nov 2006 08:55:14 +0000 (UTC)
Subject: [Buildroot] Boost package settings for using cross-compiler ?
References: <loom.20061120T163936-97@post.gmane.org>
	<200611212112.23510.claus.klein@arcormail.de>
Message-ID: <loom.20061122T094835-755@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Claus Klein <claus.klein@...> writes:

> 
> Hi,
> 
> we use boost with ppc crosscompiler, here is my buildroot package.
> 
> Sure, its depend an bjam installed on host, the buildroot C++ toolchain,
theading, zlib, ....
> Realy, a big package for an embedded device 
> 
> Check the boost configuration in boost.mk!
> 
> Regards,
> claus
> 

Thanks - I worked around this in my own boost.mk by putting
GCC_ROOT_DIRECTORY (why not _DIR ??) =$(STAGING_DIR)/arm-linux-xxx
within my "$(MAKE) ...<here!>.... all" target command line.

This then allows the Buildroot tools to alias the native gcc tools
without any prefixes. Shame that Boost's own makefile doesn't use CC.

Just have to solve to toolchain EABI version problem now :(

Regards,
Mike
