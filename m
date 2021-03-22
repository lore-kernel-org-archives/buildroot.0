From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Mar 2021 14:42:20 +0100
Subject: [Buildroot] [PATCH] package/zeromq: fix build failure due to
 binutils bug 21464
In-Reply-To: <3a252a05-54ac-24a7-a9d6-1c5a21679aee@benettiengineering.com>
References: <20210314223616.5bfcc62f@windsurf.home>
 <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
 <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
 <3a252a05-54ac-24a7-a9d6-1c5a21679aee@benettiengineering.com>
Message-ID: <20210322144220.5f9158c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 14:15:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> OpenRisc binutils 21464 bug has a fix:
> https://sourceware.org/bugzilla/show_bug.cgi?id=21464
> 
> I've tested it with binutils:
> - 2.32
> - 2.34
> - 2.35.2
> - 2.36.1
> 
> and works good while building:
> - protobuf
> - libtheora
> - zeromq

Excellent! Thanks for all this work!

Has this fix been suggested by upstream? How do you know it's the
"right" fix ?

> zeromq is the only package that could be worked around with -O0.
> 
> I would add patches that add patches to all binutils versions, so this 
> way buildroot toolchain built by buildroot are safe, but I should tag
> as buggy all the external openrisc toolchains, basically the one 
> provided by Bootlin. This implies adding patches to disable building 
> libtheora with all its dependencies and I can do it, or otherwise we can 
> wait for Bootlin to release a new fixed openrisc toolchain, what about that?

Don't bother with the external Bootlin toolchains, I was working on a
new release of the toolchains based on 2021.02, so I'll include the
binutils fix.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
