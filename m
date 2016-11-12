From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Nov 2016 22:08:50 +0100
Subject: [Buildroot] Fwd: Enable option of nodeJS 4.1.2 in buildroot
 2015.11
In-Reply-To: <CALD51P_HZZzqLcn-JqLwdO95f8J8x3P6v4+L7fKZdtnGmo5t0g@mail.gmail.com>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
 <CALD51P_HZZzqLcn-JqLwdO95f8J8x3P6v4+L7fKZdtnGmo5t0g@mail.gmail.com>
Message-ID: <20161112210850.GB3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lijun, All,

On 2016-11-11 07:41 -0600, Lijun QIN spake thusly:
> Thank you so much for your help, Baruch
> I took your advice and applied the change to the Config.in in nodejs
> package. Since my .config does not have BR2_ARM_CPU_HAS_VFPV3,  I used
> BR2_ARM_CPU_MAYBE_HAS_VFPV3 instead. The issue seems to have fixed.

This is definitely incorrect. The _MAYBE_HAS option is an internal one
that should not be used to derive the presence of abscence of VFPv3.

If your CPU does have VFPv3, then you must enable it with the correct
option, BR2_ARM_ENABLE_VFP "Enable VFP extension support", which has
been avaialble since f52692e: arch/arm: add option to enable an optional
VFP unit (and I should know, I did that patch in 2015! ;-) ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
