From: hartleys <hartleys@visionengravers.com>
Date: Fri, 15 Aug 2008 13:17:43 -0400
Subject: [Buildroot] Problem creating package for esekeyd
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19096D8F9E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to create a new package for ESE Key Daemon
(http://www.burghardt.pl/2007/12/ese-key-daemon/) to simplify using the
multimedia keys on a keyboard.

I have a .mk created using the Makefile.autotools.in stuff but have a
problem that I'm not sure how to fix (or if is even possible).

The make for esekeyd builds an executable (mkparser) that needs to run
on the host system. This executable is then ran to create a source file
based on the linux input.h header. This source file appears to end up
being the parser that esekeyd uses to determine what key was pressed on
the keyboard.

The problem is, using the normal Makefile.autotools.in setup the
mkparser.c file is compiled using the cross compiler for my ARM system
not the x86 host compiler. Is there a way to handle this using
Makefile.autotools.in or will I need to create a full .mk to old way?

Any help would be appreciated.

Thanks,
Hartley
