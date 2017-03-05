From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 5 Mar 2017 09:53:51 +0100
Subject: [Buildroot] Analysis of build results for 2017-03-04
In-Reply-To: <20170305094814.7fd9ae85@free-electrons.com>
References: <20170305072847.53355206EF@mail.free-electrons.com>
 <20170305094814.7fd9ae85@free-electrons.com>
Message-ID: <20170305085351.GC1819@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> /home/test/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(loadmsgcat.o): In function `_nl_load_domain':
> loadmsgcat.c:(.text+0x36): undefined reference to `pthread_mutex_lock'
> loadmsgcat.c:(.text+0xfc): undefined reference to `pthread_mutex_unlock'
> 
> That's the usual deal of libintl using pthread functions, which causes
> issues in static linking scenarios. There was this story that glibc
> provides dummy pthread functions in libc, and the real ones in
> libpthread, so that if you don't link with pthread, you don't use the
> slow thread-aware versions.
> 
> But since static linking is only with musl/uclibc anyway, and they now
> all use a single-library approach that doesn't matter. I guess this
> error still occurs because the ARC pre-built toolchain uses a uClibc
> version that predates the merge-them-all-into-libc change.
> 
> Waldemar, do you confirm ?

Yes, I hope they finally update to latest, soon :/
Don't know if they have a reason to build with the last
non-merge-them-all-into-libc change.
 
best regards
 Waldemar
