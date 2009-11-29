From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 19:32:41 -0600
Subject: [Buildroot] Buildroot - ltrace build failure
Message-ID: <200911281932.43827.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we can believe the messages on stderr:

make[2]: *** No rule to make target `mips/arch.h', needed by `sysdep.h'.  Stop.
make[1]: *** [sysdeps/sysdep.o] Error 2
make[1]: *** Waiting for unfinished jobs....
In file included from ltrace.c:15:
ltrace.h:12:20: error: sysdep.h: No such file or directory
In file included from ltrace.c:15:
ltrace.h:26: error: ?BREAKPOINT_LENGTH? undeclared here (not in a function)
make[1]: *** [ltrace.o] Error 1
make: *** [/Builds/BLDRT/br-head/output/build/ltrace-0.5/ltrace] Error 2

That one just isn't going to build for MIPS.

Mike
