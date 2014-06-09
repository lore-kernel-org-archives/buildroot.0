From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 14:32:22 +0200
Subject: [Buildroot] [PATCH] package/libbsd: needs an (e)glibc toolchain
In-Reply-To: <20140609142351.47e08090@free-electrons.com>
References: <1402309581-18430-1-git-send-email-yann.morin.1998@free.fr>
 <20140609142351.47e08090@free-electrons.com>
Message-ID: <20140609123222.GD3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-09 14:23 +0200, Thomas Petazzoni spake thusly:
> On Mon,  9 Jun 2014 12:26:21 +0200, Yann E. MORIN wrote:
> 
> > -comment "libbsd needs a toolchain w/ threads"
> > +comment "libbsd needs an (e)glibc toolchain w/ threads"
> >  	depends on ( BR2_i386 || BR2_x86_64 )
> > -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> 
> Is it possible to have a glibc toolchain without threads? I think no.
> In this case, what is our policy? Should we keep both the glibc and
> thread dependencies?

Indeed, Buildroot considers glibc toolchains have threads.

Just for this commit, I would not care we remove the threads dependency,
since it is implicit with glibc.

However, as I said, libbsd is an Nth-level dependency of QEMU, which I
am still p[lanning on submitting. Having static qemu-user programs is
very usefull to run foreign chroots, and is only possible with uClibc,
so I will have to fix that issue at some point in time. And keeping the
threads dependency will just be a warning to me at that point.

But for now, do as you prefer. It should be pretty easy to pinpoint
build failures at that time. ;-)

Do you want me to respin?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
