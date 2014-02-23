From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 12:09:28 +0100
Subject: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C2AD@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
 <20140223104807.473b5d47@skate>
 <884EA965490E3C4D8E66AEF41E98025006C2AD@ezex10.ezchip.com>
Message-ID: <20140223110928.GA3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, Thomas, All,

On 2014-02-23 10:57 +0000, Noam Camus spake thusly:
> Using external toolchain than BR2_GCC_TARGET_CPU is passed to GCC by
> -mcpu 
> Using buildroot toolchain than BR2_GCC_TARGET_CPU is passed to configure
> by --with-cpu
> 
> ARC GCC likes to get -mcpu=ARC700
> However through configure I am not sure but I think that config.gcc
> script is involved and it likes to get arc*.

From what I can see in gcc master:
  - ./configure expects: --with-cpu=arc700
  - gcc expects        : -mpcu=ARC700

Yes, that's it... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
