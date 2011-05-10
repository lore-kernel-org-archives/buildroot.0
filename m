From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 10:20:47 +0200
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
 gnuconfig targets
In-Reply-To: <201105101001.31879.yann.morin.1998@anciens.enib.fr>
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
	<20110510084704.7cd44147@surf>
	<201105101001.31879.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110510102047.1fffa641@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 May 2011 10:01:31 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> On Tuesday 10 May 2011 084704 Thomas Petazzoni wrote:
> > Just curious, as I have never used Buildroot to build a toolchain for
> > non-MMU platforms (only used pre-built Blackfin toolchains so far). How
> > does this elf2flt thing fits into the toolchain build process ?
> 
> elf2flt provides its own linker to replace ld when the output is the flat
> ELF format. When installing, elf2flt renames the original ld coming from
> the binutils, installs its own ld.elf2flt linker and a ld wrapper that
> checks the arguments. If the format is flat ELF, then the wrapper calls to
> the ld.elf2flt linker; otherwise, it calls to the original linker.
> 
> So one first installs binutils as usual, and then install elf2flt.

Thanks Yann for these details. I'm wondering if this actually works
fine in Buildroot or not.

Do you know if elf2flt has a well-known upstream location, so that we
can use it instead of having the source code inside the BR tree?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
