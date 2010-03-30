From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 30 Mar 2010 18:58:20 +0200
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB20A06.1090407@browserseal.com>
References: <4BB20A06.1090407@browserseal.com>
Message-ID: <201003301858.20910.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sasha, All,

On Tuesday 30 March 2010 16:26:14 Sasha Sirotkin wrote:
> On Tue, Mar 30, 2010 at 4:20 PM, Yann E. MORIN 
> <yann.morin.1998@anciens.enib.fr> wrote:
>     On Tuesday 30 March 2010 142701 Sasha Sirotkin wrote:
>      > I compiled an external toolchain with glibc support using
>     crosstools-ng
>      > as recommended. I managed to compile buildroot without any issues.
>      > However, when I try to use the resulting image /sbin/init segfaults.

Standard init, or busybox' ?

>      > With uclibc there are no such issues. I'm using the latest
>     versions of
>      > everything on ARM with EABI.

In crosstool-NG, there's a sample that is quite up-to-date and that builds
an arm-unknown-linux-gnueabi:
# ct-ng show-arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabi  [l  ]
    OS             : linux-2.6.31.12
    Companion libs : gmp-4.3.1 mpfr-2.4.2 libelf-0.8.12
    binutils       : binutils-2.19.1
    C compiler     : gcc-4.3.2 (C,C++,Fortran,Java)
    C library      : glibc-2.9
    Tools          : sstrip dmalloc-5.5.2 duma-2_5_15 gdb-6.8 ltrace-0.5.3 strace-4.5.19

>     By default, gcc will emit armv5t instructions. What's your target CPU?
>     init segfaulting can be a symptom of using a bad instruction set, so if
>     your CPU is armv4, and you did not tell gcc to default to armv4, then
>     you will hit this segfault issue.
> As I already mentioned, it works fine with uClibc, so it is definitely 
> not a CPU instructions issue. At any rate, my CPU is AT91, i.e. armvte 
> instruction set.

Ahem. Right, sorry.

I'll read you back on crossgcc... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
