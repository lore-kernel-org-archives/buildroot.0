From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 00:00:13 +0100
Subject: [Buildroot] [PATCH 1/2] libtirpc: remove NIS patch
In-Reply-To: <20201229210600.GC2801@pevik>
References: <20201202184954.19808-1-petr.vorel@gmail.com>
 <20201229204658.GX1680670@scaer> <20201229210600.GC2801@pevik>
Message-ID: <20201229230013.GD1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2020-12-29 22:06 +0100, Petr Vorel spake thusly:
> > > But test fails with the same error even when this patch is kept.
> > Indeed, the risc32 case is special: it uses a glibc more recent than
> > 2.32. In glibc 2.32, RPC support was entirely removed, so it is not
> > unexpected that we do have RPC-relacted issues for riscv32.
> 
> I wonder if there is some package which is not yet ported to libtirpc and
> requires Sun-RPC. Suppose yes, otherwise there wouldn't be that check, but I
> haven't find any.
> 
> FYI openSUSE has been using libtirpc as a drop-in replacement for quite long
> time. Maybe that could be a solution for Buildroot as well.

And this is exactly what we've just done tonight with Thomas;
    9853983336 package/glibc, toolchain/toolchain-buildroot: disable
               native RPC in glibc toolchains

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
