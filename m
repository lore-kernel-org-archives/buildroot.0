From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Mon, 11 Jan 2021 11:46:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: add backtrace support
 option
In-Reply-To: <20210109181112.GA3044608@scaer>
References: <20210109161900.51824-1-andrea.ricchi@amarulasolutions.com>
 <20210109180319.GA3037565@scaer> <20210109181112.GA3044608@scaer>
Message-ID: <CABNF3=YV=LZmg4K+xTwAM=K-36xRTLSWeykFo_YHPrfBYh50yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Regarding the libbacktrace, in my application, I need to link the *execinfo.h
*file that is included in the uClibc-ng toolchain when the build
configuration includes UCLIBC_HAS_BACKTRACE. Because of this, I need to
build the entire libubacktrace in the uClibc-ng.

Thanks

---

Andrea Ricchi

Amarula Solutions s.r.o.

Software Developer

Peka?sk? 628/14, 155 00 Praha 5-Jinonice, Czechia

T. +420 212 245 723

M. +39 333 7754973
[`as] https://www.amarulasolutions.com <http://www.amarulasolutions.com>


On Sat, Jan 9, 2021 at 7:11 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Andrea, All,
>
> On 2021-01-09 19:03 +0100, Yann E. MORIN spake thusly:
> > On 2021-01-09 17:19 +0100, Andrea Ricchi spake thusly:
> > > Add toolchain configuration to support execinfo.h and backtrace
> > > features.
>
> I also forgot to state that uClibc-ng builds libubacktrace, not
> libbactrace, so applications would need to have special handling to
> explicitly load libubacktrace anyway...
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/61e609e4/attachment-0001.html>
