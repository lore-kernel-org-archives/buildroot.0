From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jun 2019 12:01:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: needs headers >= 4.4
In-Reply-To: <20190610093702.GD13603@scaer>
References: <20190609222703.30345-1-fontaine.fabrice@gmail.com>
 <20190610093702.GD13603@scaer>
Message-ID: <20190610100112.GE13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-06-10 11:37 +0200, Yann E. MORIN spake thusly:
> On 2019-06-10 00:27 +0200, Fabrice Fontaine spake thusly:
> > weston includes input-event-codes.h since version 5.0.91 and
> > https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
> 
> Actually, that include is in fact not needed. Just remove it, and it
> still builds! ;-)

So, even with a toolchain with headers 4.20, it is not needed to include
linux/input-event-codes.h.

That's because it is pulled in from linux/input.h, which it self is
pulled in from libevdev/libevdev.h.

So, the patch I suggested earlier is probably the better technically,
but one that just includes linux/input.h instead is simpler.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
