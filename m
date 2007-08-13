From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 13 Aug 2007 23:56:38 +0300
Subject: [Buildroot] TinyX woes...
In-Reply-To: <1187036974.6223.17.camel@elrond.sweden.atmel.com>
References: <1187036974.6223.17.camel@elrond.sweden.atmel.com>
Message-ID: <46C0C586.9060406@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson ?????:
> TinyX currently is built using
> make $(TARGET_CONFIGURE_OPTS) World
> but this fails miserably for ARM.
> 
> Some utilities are then built using the cross compiler
> and when executed on the host, they obviously fail on non-X-86 targets.
> 
> I tried a patch which forces the use of HOSTCC for make,
> but there are some temp files ("/tmp/xxxx") which are executed
> and fails since they are built using the cross compiler.
> 
> TinyX seems to rely on WCHAR support, since it uses
> MB_CHAR_MAX (The largest size of a character)
> which only seems to be visible in the headers if 
> UCLIBC_USE_WCHAR is set.
> 
> Some files seems to include header files, only present on X86.
> "asm/mtrr.h" and "asm/io.h".
> 
> The cross.def file defining the environment for X Cross compilation
> is updated by tinyx.mk but there seems to be things lacking.
> 
> Is there ANYONE which manages to build tinyx for x86 at the moment?
> Is there ANYONE which manages to build it for another target (I.E: ARM)?
> 
> Best Regards
> Ulf Samuelsson
> 

Hello Ulf,

TinyX (kdrive) from http://intimate.handhelds.org/jacques/ seems to be very outdated ( dated by 2002 ).

Most of ARM embedded people use kdrive implementation for Xorg X11R7.x
(from openembedded.org).

GTK2 is not building with TinyX because of cairo requires new API (Xrender).
May be GTK-1.2 could be build but I never tried.

However TinyX build for arm was succeeded for me however not tested on target.
(i'm using uclibc with wchar and locale support).

Best regards,
Ivan


> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
