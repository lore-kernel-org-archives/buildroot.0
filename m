From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 22:08:10 +0200
Subject: [Buildroot] [PATCH 3/6] package/libedit2: new package
In-Reply-To: <0af174d65ec156e6dd992ed2ab7b9c529066af7c.1368137905.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 10 May 2013 00:22:56 +0200")
References: <cover.1368137904.git.yann.morin.1998@free.fr>
 <cover.1368137904.git.yann.morin.1998@free.fr>
 <0af174d65ec156e6dd992ed2ab7b9c529066af7c.1368137905.git.yann.morin.1998@free.fr>
Message-ID: <87ip2ovu51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>

It unfortunately doesn't build here:

/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc   -pipe -Os  -include bsd/sys/cdefs.h -include bsd/stdio.h    -I. -I/home/peko/source/buildroot/output/build/libedit2-2.11/libedit -I. -I/home/peko/source/buildroot/output/build/libedit2-2.11/libedit   -c -fpic -DPIC readline.c -o readline.so
building shared object edit library
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-ranlib libedit_pic.a
building shared edit library (version 2.11)
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -shared -Wl,-soname,libedit.so.2 -o libedit.so.2.11    -Wl,--whole-archive libedit_pic.a -Wl,--no-whole-archive -lbsd -lcurses  
all ===> readline
bmake: no system rules (sys.mk).

bmake: stopped in /home/peko/source/buildroot/output/build/libedit2-2.11/libedit/readline
*** Error code 2

Stop.
bmake: stopped in /home/peko/source/buildroot/output/build/libedit2-2.11/libedit
make: *** [/home/peko/source/buildroot/output/build/libedit2-2.11/.stamp_built] Error 1



Any idea?

-- 
Bye, Peter Korsgaard
