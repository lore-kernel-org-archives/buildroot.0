From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Mar 2021 21:59:54 +0100
Subject: [Buildroot] [PATCH 0/2] package/libopenssl: fix build wrt
 64-bit time-related structs (branch yem/openssl-riscv32)
In-Reply-To: <87a6qyvpgb.fsf@dell.be.48ers.dk>
References: <cover.1615325812.git.yann.morin.1998@free.fr>
 <87a6qyvpgb.fsf@dell.be.48ers.dk>
Message-ID: <20210319205954.GR3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-19 21:49 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > This two-patch series aims at fixing, once and for all, the many build
>  > failures we've seen in the autobuilders, related to riscv32.
> Those issues are "fixed" now that libopenssl is disabled for riscv32,
> right?

This patch really fixes the build failures we saw on riscv32, before we
disabled it. Thanks to this fix, we could reinstate riscv32 on master.

But for 2021.02.x...

>  > Note: the first pach is a candidate for backporting to 2021.02.x, but
>  > the second patch is not.
> Why? Isn't this only an issue on riscv32? What would the advantage be of
> adding those patches if libopenssl isn't available for riscv32?

... right: 2021.02.x does not cary the faulty patch, and we do not need
to reinstate support for riscv32.

Forget it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
