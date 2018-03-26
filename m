From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Mar 2018 18:12:40 +0200
Subject: [Buildroot] [PATCH] Config.in: add -Ofast option
In-Reply-To: <20180325224031.55cfb6a8@windsurf>
References: <1521735971-22210-1-git-send-email-joshua.henderson@microchip.com>
 <20180325082434.GF2620@scaer> <20180325224031.55cfb6a8@windsurf>
Message-ID: <20180326161240.GB2736@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-25 22:40 +0200, Thomas Petazzoni spake thusly:
> On Sun, 25 Mar 2018 10:24:34 +0200, Yann E. MORIN wrote:
> > > +config BR2_OPTIMIZE_FAST
> > > +	bool "optimize for fast"  
> > 
> > -Ofast was introduced in gcc-4.6, so you need a dependency:
> >     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> 
> The "odd" thing being that menuconfig is organized as follows:
> 
>  Target options --->
>  Build options --->
>  Toolchain --->
> 
> The optimization level is selected in "Build options" and the compiler
> version is basically decided in "Toolchain".
> 
> So if you select -Ofast in Build options, and then go in Toolchain
> chose a < 4.6 compiler, your -Ofast selection would disappear.

Yeah, I know. But, as you ssay:

> But there's no good way around this, and using gcc < 4.6 is anyway very

... there's no good solution around this issue, and the case for gcc
before 4.6 is rare enough that we don't care abot those poor souls
anymore... :-/

> rare these days, so I also agree that the "depends on" you suggest is
> what makes the most sense.

Was that an Acked-by or a Reviewed-by? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
