From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 3 Mar 2011 10:19:44 +0100
Subject: [Buildroot] __USE_GNU ?
Message-ID: <201103031019.44511.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I'm trying to compile some code that uses splice/vmplice and I get:
TestSockets.c:85: error: 'SPLICE_F_GIFT' undeclared (first use in this function)
TestSockets.c:86: error: 'SPLICE_F_MOVE' undeclared (first use in this function)

I use #include <fcntl.h> in my code which includes output/host/usr/powerpc-unknown-linux-
uclibc/sysroot/usr/include/bits/fcntl.h
where I see the two corresponding defines for SPLICE_F_*, but the conditional macro __USE_GNU is not defined.

A quick googling tell me it's an internal macro to uclibc, so why is it not on ?
How do I get those two macros ?

Sure, I can define them by hand, but something's fishy.

Thanks for the clarification.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
