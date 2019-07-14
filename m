From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 20:53:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston-imx: Split weston-imx
 off from weston
In-Reply-To: <CADvTj4r+GiLH=1oA7c8OsTRhLnA+TPYHpgRbQmttt5Es0QObdQ@mail.gmail.com>
References: <20190625225008.58056-1-james.hilliard1@gmail.com>
 <20190714183438.GG29941@scaer>
 <CADvTj4r+GiLH=1oA7c8OsTRhLnA+TPYHpgRbQmttt5Es0QObdQ@mail.gmail.com>
Message-ID: <20190714185325.GH29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-07-14 12:37 -0600, James Hilliard spake thusly:
> On Sun, Jul 14, 2019 at 12:34 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-06-25 16:50 -0600, James Hilliard spake thusly:
> > > This is in preparation for migration of weston to the meson build system.
> > > Since weston-imx is based off of a much older version of weston it is
> > > difficult to maintain as part of the weston package.
[--SNIP--]
> > Which implies that we should allow bioth westons to be installed side by
> > side, and that the imx variant be installed as 'weston-imx', e.g. using
> > the ./configure flag:
> Is there a use case for having both westons side by side?

Well, yes: the RDB stuff for example does not seem to depend on the
hardware at all, in fact, so it would be better if it were provided by
the real weston, which is more up-to-date with RDP than by the imx fork,
which supports an older version of RDP. And it has caused grief in the
past that when we update weston, it uses newer FreeRDP APIs, or the
other way around, when we update FreeRDP, it no longer exports APIs
needed by older weston.

So, I'd like we find a way for the imxc fork to be consrained to only
the actual imx backend, and keep using the official weston for all the
rest.

Regards,
Yann E. MORIN.

> >     --program-suffix=-imx
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
