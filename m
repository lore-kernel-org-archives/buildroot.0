From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:18:12 +0200
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW64r1ONy2ZhjzUgORt1br9k_aaExk=VYsVyoVehkRtAAoA@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
 <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
 <CALoSW65dFkMpRnW0h88xAh-Tq6TAnOWz9CGExo1UWzLyMjtRLA@mail.gmail.com>
 <CALoSW64r1ONy2ZhjzUgORt1br9k_aaExk=VYsVyoVehkRtAAoA@mail.gmail.com>
Message-ID: <20140719131812.GG3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2014-07-19 08:42 -0400, Nimai Mahajan spake thusly:
> Just tried it with your .mk Gustavo and Buildroot still doesn't like
> it for some reason:

It Works For Me (TM).

> >>> libuv v0.11.26 Patching
> echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])"
> >/m4/libuv-extra-automake-flags.m4

Something is weird: the code above tries to create the file
    /m4/libuv-extra-automake-flags.m4

That is, in a sub-dir named 'm4' at the root of the filesystem hierarchy.

The code is about creating $(@D)/m4/libuv-extra-automake-flags.m4 so
this should create a file in the package source tree (the $(@D) part.)

Can you check that your Buildroot tree is correct (I just checkedc mine,
which is master from a few minutes ago, and it is fine.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
