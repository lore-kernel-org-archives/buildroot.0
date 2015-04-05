From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:46:24 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package infra: add patch-dependencies
In-Reply-To: <20150405091656.GC4134@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
 <20150404154705.4be3e45d@free-electrons.com>
 <20150405091656.GC4134@free.fr>
Message-ID: <20150405114624.1077fb67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 5 Apr 2015 11:16:56 +0200, Yann E. MORIN wrote:

> > I think this will break graph-depends. The python script will do "make
> > <foo>-show-depends" for each package. Now this will return things such
> > as "xenomai-patch"
> 
> No, I don't think so, because _PATCH_DEPENDENCIES contain package names,
> not or internal make targets. And I can prove it:
> 
>     $ make linux-show-depends
>     fbtft host-kmod host-lzop toolchain
> 
> where fbtft is a kernel extension.

Yes, sorry, Romain explained to me on IRC where I was wrong.

> Have you even tried it?  ;-p

No, I only did a review.

> Well, I don;t mind getting rid of the separate show-{build,patch}-depends
> rules. But your proposal is wrong, since we do not have to get rid of
> the trailing -patch, because it's not in there...

Correct. I believe the show-{build,patch}-depends are not useful,
though.

I'll apply this series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
