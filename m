From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 6 Nov 2016 20:33:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106150623.2b7fd549@free-electrons.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
Message-ID: <20161106193346.GA27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> OK, -rc1 is released, so it's time to look at the build failures. Even
> though most developers should now be receiving direct e-mails, I guess
> it's still good to summarize where we are.
> 
> >         i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/325a50d15e1836b31df4e84ba83b296abfb73041
> 
> init.c:22:18: fatal error: fenv.h: No such file or directory
> 
> Weird. <fenv.h> used to be available on i686. Waldemar, anything
> changed in uClibc in that regard?

This commit adds musl support via a patch:
0b6b67f34d6d4aeb340bbca579dbf85363c3f4ea

For fenv.h UCLIBC_HAS_FENV should be enabled in uClibc-ng config.
That is not the case.

I can't see why fenv.h would be installed in the past without
UCLIBC_HAS_FENV.

Without the patch, jamvm compiles fine.

best regards
 Waldemar
