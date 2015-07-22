From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Jul 2015 18:15:08 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <20150722161508.GB6432@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> >         i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/182424bd2fea36af95eea31f7dd53f0399433616/
> 
> Static linking issue:
> 
> /ssd1/thomas/autobuild/instance-2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
> (.text+0x0): multiple definition of `__lll_lock_wait_private'
> 
> Waldemar, I don't remember, has this issue been fixed already in
> upstream uClibc-ng ?

No. It was fixed for ARM and other architectures, but not for
x86/x86_64.

I have sent a patch.

best regards
 Waldemar
