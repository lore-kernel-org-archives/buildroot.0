From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:47:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: disable on riscv32
In-Reply-To: <20210528053443.640308-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 May 2021 07:34:43 +0200")
References: <20210528053443.640308-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1hajeca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > vlc unconditionally uses __NR_futex resulting in the following build
 > failure on riscv32:

 > linux/thread.c:53:20: error: '__NR_futex' undeclared (first use in this function)
 >    53 |     return syscall(__NR_futex, addr, op, val, to, addr2, val3);
 >       |                    ^~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/be0f2243919d7a052b33118d8a901c922f8d88e7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
