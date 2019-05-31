From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 May 2019 20:41:25 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: do not rely on package's
 .config as a timestamp
In-Reply-To: <87y32nwonn.fsf@dell.be.48ers.dk>
References: <20190530180909.14418-1-yann.morin.1998@free.fr>
 <87y32nwonn.fsf@dell.be.48ers.dk>
Message-ID: <20190531184125.GC3173@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-05-31 00:41 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Since linux-4.19, the kernel's build system internally touches its
>  > .config file.
> 
>  > However, we currently used that file as a timestamp to detect whether
>  > our kconfig fixups were to be (re)applied or not, which in turn is used
>  > to decide whether we should (re)build the package or not.
> 
>  > But with latest kernel versions, this timestamp heuristic is now broken,
>  > and we always rebuild the kernel on subsequent builds.
> 
>  > We fix that by introducing a spearate timestamp file of our own, which
>  > we know the kernel (or the kconfig-based packages, for that matters)
>  > does not use.
> 
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> Committed, thanks.

Thanks.

This is also a candidate for 2019.02.x, on which it applies cleanly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
