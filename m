From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 13:17:51 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87pr724ggy.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911280935.57255.minimod@morethan.org>
	<87pr724ggy.fsf@macbook.be.48ers.dk>
Message-ID: <200911281317.54373.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
> Hi,
> 
>  Michael> The build didn't get far enough to find out, it looks like it broke
>  Michael> on the recent scsi commit:
> 
>  Michael> In file included from miscutils/eject.c:20:
>  Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:145: error: expected specifier-qualifier-list before ?u8?
>  Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h: In function ?scsi_varlen_cdb_length?:
>  Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:156: error: ?struct scsi_varlen_cdb_hdr? has no member named ?additional_cdb_length?
> 
> What kernel headers version are you using? I checked in a fix for
> 2.6.31.6 kernel headers today (c589012eecd)
> 

It looks like this:

  ? ?             Toolchain type (Buildroot toolchain)  --->                                 ? ?
  ? ?             *** Kernel Header Options ***                                              ? ?
  ? ?             Kernel Headers (Linux 2.6.31.x kernel headers)  --->                       ? ?
  ? ?             *** uClibc Options ***                                                     ? ?
  ? ?             uClibc C library Version (uClibc 0.9.30.1)  --->                           ? ?
  ? ?         (toolchain/uClibc/uClibc-0.9.30.config) uClibc configuration file to use?      ? ?
  ? ?         [ ] Thread library debugging                                                   ? ?
  ? ?         [*] Compile and install uClibc tests                                           ? ?
  ? ?             *** Binutils Options ***                                                   ? ?
  ? ?             Binutils Version (binutils 2.19.1)  --->                                   ? ?
  ? ?         ()  Additional binutils options                                                ? ?
  ? ?             *** GCC Options ***                                                        ? ?
  ? ?             GCC compiler Version (gcc 4.3.4)  --->                                     ? ?
  ? ?         [*] Enable toolchain with --sysroot support                                    ? ?
  ? ?         [*] Enable setjmp/longjmp exceptions?                                          ? ?
  ?

Mike
