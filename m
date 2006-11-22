From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 22 Nov 2006 09:34:37 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?=27ld=27_gives_=22unrecognised_emulation_mo?=
	=?utf-8?q?de=22_-_ARM=09toolchain_unbuildable_=3F=3F?=
References: <loom.20061101T111436-827@post.gmane.org>
	<loom.20061102T152239-949@post.gmane.org>
	<loom.20061121T200844-447@post.gmane.org>
	<f2b55d220611211208yef912b8p4c00bfd2ee2a2eca@mail.gmail.com>
Message-ID: <loom.20061122T095656-727@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael K. Edwards <medwards.linux@...> writes:

> 
> You probably want to stick to armelf(b)-linux-eabi, since that's
> clearly the right thing in later toolchains.  EABI on ARM seems to be
> better supported in an up-to-date toolchain combination consisting of
> gcc 4.1.1, binutils 2.17.50.0.6, and headers from glibc 2.5 and kernel
> 2.6.16 or later.  I used crosstool to build a glibc toolchain first,
> and am currently grinding through compiling a full glibc/NPTL
> userspace with ptxdist, cleaning up all the non-uClibc-specific
> issues.  Once I have the kinks worked out of that, I'll be trying a
> uClibc version; I'll keep the list posted.
> 
> As of gcc 4.1.1, it seems that one still needs this patch to fix up
> some include issues:
>
http://www.kegel.com/crosstool/crosstool-0.42/contrib/2006/crosstool-0.38-add-gcc-4.1-20060210.diff
> 
> Also, if your target is big-endian, you need the one-line patch below
> so that big-endian is really big-endian.
> 
> Cheers,
> - Michael

Many thanks - but I am unable to configure Buildroot to give an EABI
compatible (version != 0) toolchain.
I have now tried also using the most recent GCC and Binutils in the
Buildroot menuconfig options, this using buildroot-20061031.

What is the required 'GNU target suffix' or other setting to enable
EABI operation ? (Obviously I have set 'Target ABI: EABI')

The only target suffix that appears to give a workable toolchain
(i.e. one that doesn't say 'unrecognised emulation mode') 
is 'elf-linux', and that doesn't seem to support EABI (objects built
with it have EABI version 0)

If I use any other target suffix settings in the menuconfig 
(e.g. elf-linux-eabi or even tried elf-linux_eabi) I get:
".../bin/ld: unrecognised emulation mode: armelf_linux
Supported emulations: armelf_linux_eabi" ... but I am unable to
obtain that setting :(

Regards,
Mike
