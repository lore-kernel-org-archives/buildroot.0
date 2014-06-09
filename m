From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:20:00 +0200
Subject: [Buildroot] [PATCH] lsof: fix "'TCP_*' undeclared" build errors
In-Reply-To: <1399042764-22388-2-git-send-email-benoit.thebaudeau@advansee.com>
References: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1399042764-22388-2-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140609152000.40043f97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri,  2 May 2014 16:59:24 +0200, Beno?t Th?baudeau wrote:

> These errors are caused by the glibc not being detected at configure time:
>   Testing C library type with cc ... done
>   Cannot determine C library type; assuming it is not glibc.

I think this commit was fixed by:

commit a13ea3b30b02580c0f582f2c2435818aa1921a3d
Author: Baruch Siach <baruch@tkos.co.il>
Date:   Wed May 14 15:45:08 2014 +0300

    lsof: don't use host toolchain to determine target libc
    
    The lsof Configure script builds a test program using the host toolchain to
    test whether glibc is used. This test is broken in cross compilation
    environment. Set LINUX_CLIB to avoid the test. This should give the correct
    result even for non glibc toolchains, since all libc variants we support have
    the netinet/tcp.h header.
    
    Fixes:
    http://autobuild.buildroot.net/results/a1f/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
    
    Cc: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
    Signed-off-by: Baruch Siach <baruch@tkos.co.il>
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

At least, using a configuration similar to the one you pointed as failing
(http://autobuild.buildroot.org/results/ade/ade3629f72bf2195bde086a8c403197c0d1fdba3/),
I am not able to reproduce the problem.

I've therefore marked the patch as Rejected. If you still have the
issue, do not hesitate to get back to us.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
