From: Martin Hicks <mort@bork.org>
Date: Sun, 20 Feb 2011 09:20:01 -0500
Subject: [Buildroot] nfs-utils build failed
In-Reply-To: <AANLkTi=HTAaDcQJJW1e+A_RPHEdgQX=4sA7Lw3nh7bcn@mail.gmail.com>
References: <AANLkTi=HTAaDcQJJW1e+A_RPHEdgQX=4sA7Lw3nh7bcn@mail.gmail.com>
Message-ID: <AANLkTi=M1GVWE=+DD5X=T2eeysYDhETsyrisG5W9PPZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/20 Zden?k Materna <zdenek.materna@gmail.com>:
> Hello,
>
> I'm back with another problem which I can't solve. I'm using buildroot from
> git, uclibc 0.9.31 and there is some problem with building nfs-utils (build
> log at bottom). If I understand it right rpcgen is used to generate mount.h.
> But rpcgen is compiled for target and can't be run on host. Then it's little
> bit strange that mount.h missing error is produced before "rpcgen: cannot
> execute binary file" error.
>
> Can anybody explain it for me? I'm quite confused with it. And any tips what
> to do to compile nfs-utils?

I fought with this in a non buildroot environment this week.  The
reason is that rpcgen is compiled with your cross compiler and not
your build host's CC.  I couldn't figure out how to make automake use
my host's compiler, but did eventually figure out that if you install
the rpcgen program from your build server's package manager into
/usr/bin  you can specify RPCGEN=/usr/bin/rpcgen and nfs-utils will
stop trying to compile this tool and just use the one you've
specified.

mh

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
