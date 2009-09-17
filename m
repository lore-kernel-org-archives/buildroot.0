From: Joe tech <joetech20@gmail.com>
Date: Thu, 17 Sep 2009 17:01:51 +0530
Subject: [Buildroot] Enabling oprofiler package on buildroot-2009.08
	(MIPS cross-compilation)
In-Reply-To: <20090914153630.1bfabd3d@hcegtvedt.norway.atmel.com>
References: <4345ac050909140614i387f8705yaec4c1c52f8152c2@mail.gmail.com>
	<20090914152128.56d8aad2@hcegtvedt.norway.atmel.com>
	<4345ac050909140626td6ccfd1v945553b80704ae83@mail.gmail.com>
	<20090914153630.1bfabd3d@hcegtvedt.norway.atmel.com>
Message-ID: <4345ac050909170431t567de74x3c46195e1ff1d90@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I managed to cross compile binutils for mips arch & generate .so files. But
the my utlimate objective of running oprofiler on target is not met yet. I
get the following error on the console, when i run 'opreport' on the console
*/ # opreport
" opreport error: No sample file found: try running opcontrol --dump
or specify a session containing sample files "*

looks like the oprofiler is running, but /var/lib/oprofile/samples/current
directory is empy. Oprogiled.log show the following output.

*/var/lib/oprofile/samples # cat oprofiled.log
oprofiled started Wed Dec 31 17:06:03 1969
kernel pointer size: 4*
*Wed Dec 31 17:09:30 1969*
*Nr. sample dumps: 2
Nr. non-backtrace samples: 0
Nr. kernel samples: 0
Nr. lost samples (no kernel/user): 0
Nr. lost kernel samples: 0
Nr. incomplete code structs: 0
Nr. samples lost due to sample file open failure: 0
Nr. samples lost due to no permanent mapping: 0
Nr. event lost due to buffer overflow: 0
Nr. samples lost due to no mapping: 0
Nr. backtraces skipped due to no file mapping: 0
Nr. samples lost due to no mm: 0
Nr. samples lost cpu buffer overflow: 0
Nr. samples received: 0
Nr. backtrace aborted: 0
Nr. samples lost invalid pc: 0
oprofiled stopped Wed Dec 31 17:09:30 1969*


Does anybody have any clue on the reason behind this error ? Is this some
how related to incorrect bfd library usage??? Please  let me know if anyone
has any suggestion for a way to debug this issue further.

-Joe

On Mon, Sep 14, 2009 at 7:06 PM, Hans-Christian Egtvedt <
hans-christian.egtvedt@atmel.com> wrote:

> On Mon, 14 Sep 2009 18:56:07 +0530
> Joe tech <joetech20@gmail.com> wrote:
>
> > Thanks for your prompt reply.
> >
> > binutils-target is getting built. Only archives (static libraries)
> getting
> > built. Following is a list of binaries that i see in
> > toolchain_build_mips_nofpu/binutils-2.19.1-build
> > ./libiberty/libiberty.a
> > ./bfd/.libs/libbfd.a
> > ./bfd/libbfd.a
> > ./opcodes/.libs/libopcodes.a
> > ./opcodes/libopcodes.a
> > Is there are way to get the shared libraries built? I tried enabled
> > --enable-shared option without any luck. Do you have any suggestion?
> >
>
> Yes, please do not reply to me only, added the Buildroot list back on
> CC.
>
> > I have no clue if this works smooth in current Buildroot.
> >
>
> And I'll quote myself ^^^^^^
>
> --
>  Best regards,
> Hans-Christian Egtvedt
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090917/bfc18055/attachment-0001.htm>
