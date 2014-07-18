From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:40:23 +0200
Subject: [Buildroot] glib 2.40 on xtensa
Message-ID: <20140719004023.4a71d4b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Max,

We have recently update glib to version 2.40, and this is causing
issues on Xtensa:

  http://autobuild.buildroot.org/results/a1a/a1a1f97a2c54ba4f7f7e44cc094a55bd23ca0aa0/build-end.log

  CC       gspawn.lo
gthread-posix.c: In function 'g_cond_impl_new':
gthread-posix.c:648:2: error: #error Cannot support GCond on your platform.
 #error Cannot support GCond on your platform.
  ^
gthread-posix.c: In function 'g_cond_wait_until':
gthread-posix.c:896:2: error: #error Cannot support GCond on your platform.
 #error Cannot support GCond on your platform.
  ^
gthread-posix.c:859:19: warning: unused variable 'ts' [-Wunused-variable]
   struct timespec ts;
                   ^

Could you have a look and see what can be done to fix this problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
