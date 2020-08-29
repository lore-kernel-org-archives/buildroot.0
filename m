From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 23:00:54 +0200
Subject: [Buildroot] [PATCH] infra/kconfig-package: quote HOSTCC_NOCCACHE
In-Reply-To: <20200829225407.0c804cdd@windsurf.home>
References: <20200829204252.31225-1-yann.morin.1998@free.fr>
 <20200829225407.0c804cdd@windsurf.home>
Message-ID: <20200829210054.GJ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-29 22:54 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Aug 2020 22:42:52 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > HOSTCC may contain spaces, so needs to be quoted.
> HOSTCC yes, but HOSTCC_NOCCACHE ?

Yes, why not?

    $ make HOSTCC="distcc gcc-4.1"

which would yield a HOSTCC_MOCCACHE with a space in it.

Note also that HOSTCC_NOCCACHE is already quoted in most places it is
used.

Regards,
Yann E. MORIN.

> > Most of the places hwere it is already quoted use double-quotes, so we
> > use that.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Minor nit: the commit title prefix should be package/pkg-kconfig.mk.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
