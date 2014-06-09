From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:40:44 +0200
Subject: [Buildroot] [PATCH] package/libbsd: needs an (e)glibc toolchain
In-Reply-To: <20140609123222.GD3512@free.fr>
References: <1402309581-18430-1-git-send-email-yann.morin.1998@free.fr>
 <20140609142351.47e08090@free-electrons.com>
 <20140609123222.GD3512@free.fr>
Message-ID: <20140609144044.403d45cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 9 Jun 2014 14:32:22 +0200, Yann E. MORIN wrote:

> > Is it possible to have a glibc toolchain without threads? I think no.
> > In this case, what is our policy? Should we keep both the glibc and
> > thread dependencies?
> 
> Indeed, Buildroot considers glibc toolchains have threads.
> 
> Just for this commit, I would not care we remove the threads dependency,
> since it is implicit with glibc.
> 
> However, as I said, libbsd is an Nth-level dependency of QEMU, which I
> am still p[lanning on submitting. Having static qemu-user programs is
> very usefull to run foreign chroots, and is only possible with uClibc,
> so I will have to fix that issue at some point in time. And keeping the
> threads dependency will just be a warning to me at that point.

Ok, makes sense.

> Do you want me to respin?

Nah, that's fine.

Remember that we now have musl support, and musl supports static
linking, so it could be an alternative to uClibc for some of these use
cases :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
