From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Dec 2018 19:54:13 +0100
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <CA+1k=2ay7v0G0pjwB4PTTR-6mH3_FueDiFi8D3rhbcZa35zq+g@mail.gmail.com>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
 <CA+1k=2ZqHeLif6866SYX+hqRwatGiL1e-hZz-zdFuy_Ysfy+8g@mail.gmail.com>
 <20181222083141.GU24194@scaer>
 <CA+1k=2ay7v0G0pjwB4PTTR-6mH3_FueDiFi8D3rhbcZa35zq+g@mail.gmail.com>
Message-ID: <20181222185413.GW24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel, All,

On 2018-12-22 11:21 -0700, Joel Carlson spake thusly:
> On Sat, Dec 22, 2018 at 1:31 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > I did nt see Thomas' reply to the iptables patch before I replied to
> > your eudev one. It turns out we basically said exactly the same thing:
> > this is not the correct solution.
> My apologies on submitting a bad patch.

Hey, no worries! :-)  That's what reviews are for.

> >   if it is a symlink:
> >       if is not below staging/:
> >           check and fix it
> >       else if it is below staging/{lib,usr/lib,usr/include}:
> >           check and fix it
> >       else
> >           ignore it
> >
> > I can try to look into fixing that in my series. Is enabling eudev
> > and/or iptables enough to echibit the problem?
> 
> That is a better solution. And yes, with the previous sdk fixes
> applied, just enabling eudev and/or iptables and then trying to 'make
> sdk' would error out because of the symlink path being outside of
> staging.

Yeah, I eventually managed to reproduce the issue, indeed. so I
submitted v3 of the series. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
