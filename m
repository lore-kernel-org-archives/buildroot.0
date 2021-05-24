From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:32:38 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: drop hardening Config
 enables
In-Reply-To: <20210524131631.GZ3208066@scaer>
References: <20210521131752.9893-1-matthew.weber@collins.com>
 <20210524131631.GZ3208066@scaer>
Message-ID: <20210524133238.GE3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-24 15:16 +0200, Yann E. MORIN spake thusly:
> On 2021-05-21 08:17 -0500, Matthew Weber via buildroot spake thusly:
> > Since 810ba387bec3c5b, some form of these options are enable
> > by default. Specifically:
> > 
> > - Kept FORTIFY level 2 option as the default is now level 1.
> > - Removed all SSP options as the default now uses the best
> >   option based on toolchain support.
> > - Similar to SSP, for RELRO, the default now uses the best
> >   option based on toolchain support.
> > - Completely drop PIC PIE as it defaults =y
> > 
> > Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> > ---
[--SNIP--]
> I was going to apply this, but then I was wondering: shouldn't we
> randomly *disable* them, now?
> 
> Indeed, as much enabling those options randomly helped uncover build
> issues, maybe disabling them would also help?
> 
> But I don't feel very strong either, so you should have no issue
> convincing me to apply as-is. ;-)

As discussed on IRC: if there is an issue with any of those disabled, we
can handle them as they are reported by users.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
