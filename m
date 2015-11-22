From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 22 Nov 2015 11:03:15 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-21
In-Reply-To: <20151122105711.185037f6@free-electrons.com>
References: <20151122073011.8CA87102679@stock.ovh.net>
 <20151122105711.185037f6@free-electrons.com>
Message-ID: <20151122100315.GT19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello all,
> 
> Gustavo, Waldemar, J?rg, Alexey, see below.
> 
> >          arc |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/512b80c395124c4c5b3427a0d9882c1cf374235c/
> 
> /home/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
> lowlevellock.c:(.text+0x0): multiple definition of `__lll_lock_wait_private'
> /home/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):libc-lowlevellock.c:(.text+0x0): first defined here
> collect2: error: ld returned 1 exit status
> Makefile:474: recipe for target 'sip-options' failed
> 
> This is a uClibc issue which was affected a number of architectures.
> Has it been fixed already for ARC ? Waldemar, Alexey ?

Should be fixed by using a recent ARC toolchain with uClibc-ng
1.0.9. Update the ARC toolchains :)

best regards
 Waldemar
