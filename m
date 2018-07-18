From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:32:29 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gdbserver build for m68k
In-Reply-To: <20180622210949.18107-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 22 Jun 2018 23:09:49 +0200")
References: <20180622210949.18107-1-romain.naour@gmail.com>
Message-ID: <87y3e8grgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
 > the build fails on m68k with the following diagnostics:

 > In file included from ./../nat/linux-ptrace.h:28:0,
 >                  from linux-low.h:27,
 >                  from linux-m68k-low.c:20:
 > [...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
 >    PT_D1 = 0,
 >    ^
 > [...]usr/include/sys/reg.h:26:3: error: expected ??}?? before numeric constant
 > [...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
 > In file included from linux-m68k-low.c:27:0:
 > [...]usr/include/sys/reg.h:99:1: error: expected declaration before ??}?? token
 >  };
 >  ^

 > Fix this by moving <sys/reg.h> on top of "linux-low.h".

 > Fixes:
 > https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006385

 > [1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
