From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 03 Dec 2008 10:33:28 +0100
Subject: [Buildroot] gcc with static gmp & mpfr
Message-ID: <49365268.5060707@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to build a toolchain that is possible to move between different machines (under the same folder /usr/local/cris-uclibc). When using '-lm' to link final application binary I encountered problems about missing gmp and/or mpfr missing symbols!? Also each target machine that want to use the toolchain needs to provide their own libgmp and libmpfr..

Is there a simple way of forcing gcc to use only static gmp and mpfr libraries?

Note, I've changed '--enable-shared' -> '--disable-shared' in both packages, but I've broke dependencies on shared objects that their makefiles rely on, causing recompilation of gmp and mpfr for every make invocation.

Thank you,
Hinko
-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
