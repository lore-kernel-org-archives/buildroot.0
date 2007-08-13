From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 13 Aug 2007 22:29:34 +0200
Subject: [Buildroot] TinyX woes...
Message-ID: <1187036974.6223.17.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TinyX currently is built using
make $(TARGET_CONFIGURE_OPTS) World
but this fails miserably for ARM.

Some utilities are then built using the cross compiler
and when executed on the host, they obviously fail on non-X-86 targets.

I tried a patch which forces the use of HOSTCC for make,
but there are some temp files ("/tmp/xxxx") which are executed
and fails since they are built using the cross compiler.

TinyX seems to rely on WCHAR support, since it uses
MB_CHAR_MAX (The largest size of a character)
which only seems to be visible in the headers if 
UCLIBC_USE_WCHAR is set.

Some files seems to include header files, only present on X86.
"asm/mtrr.h" and "asm/io.h".

The cross.def file defining the environment for X Cross compilation
is updated by tinyx.mk but there seems to be things lacking.

Is there ANYONE which manages to build tinyx for x86 at the moment?
Is there ANYONE which manages to build it for another target (I.E: ARM)?

Best Regards
Ulf Samuelsson
