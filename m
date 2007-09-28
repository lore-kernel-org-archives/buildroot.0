From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 28 Sep 2007 07:20:02 +0200
Subject: [Buildroot] AVR32 misery
In-Reply-To: <1190938123.5322.54.camel@elrond.atmel.sweden>
References: <1190938123.5322.54.camel@elrond.atmel.sweden>
Message-ID: <1190956802.18129.2.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-09-28 at 02:08 +0200, Ulf Samuelsson wrote:
> I think I have found one problem
> "toolchain_build_avr32/gcc-4.1.2-initial/gcc/as" is a script file
> which should call the assembler.
> 
> It contains
> 
> #!/bin/sh
> exec "$@"
> 
> and should contain:
> #!/bin/sh
> exec <buildroot>/build_avr32/staging_dir/bin/avr32-linux-uclibc-ld "$@"

This should really not mather, because the PATH variable should be set
before starting to compile the cross-compiler.

Perhaps this is as easy as a missing TARGET_CONFIGURE_OPTS?

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
