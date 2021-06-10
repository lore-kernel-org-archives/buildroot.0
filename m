From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:45:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/directfb: disable on riscv32
In-Reply-To: <20210527205415.480887-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 22:54:15 +0200")
References: <20210527205415.480887-1-fontaine.fabrice@gmail.com>
Message-ID: <87zgvyjeg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > directfb unconditionally uses __NR_futex which will raise the following
 > build failure on riscv32:

 > system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
 >   242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
 >       |                     ^~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
