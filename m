From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2020 08:55:05 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: register NSS plugins in
 nsswitch.conf
In-Reply-To: <CADYdroOJgin2EPUN7N9=8SVN06gPeKezrAjudnbg5GgCvOMkHA@mail.gmail.com>
References: <20200703234923.174320-1-nolange79@gmail.com>
 <20200704080025.GC2273@scaer>
 <CADYdroMZwKBuzNKxXvj7muHNMWDAiDNCOXBzEMbq_mkONFf1uw@mail.gmail.com>
 <20200704192738.GD2273@scaer>
 <CADYdroNeoJmoR770sFVVhokGRqhnp8nNYEw_E4Hr7fPN1FGahw@mail.gmail.com>
 <20200704213839.GE2273@scaer>
 <CADYdroOJgin2EPUN7N9=8SVN06gPeKezrAjudnbg5GgCvOMkHA@mail.gmail.com>
Message-ID: <20200705065505.GF2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-05 00:17 +0200, Norbert Lange spake thusly:
> Am Sa., 4. Juli 2020 um 23:38 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
[--SNIP--]
> > It was my understanding that, should /var be read-only, systemd would
> > automatically mount a tmpfs on it and populate it with its counterpart
> > from the factory.
> Nope, not to my knowlegde.

Right, it is us mounting a tmpfs on /var when / is on a read-only
filesystem, but then as /var is then empty, then systemd populates it
with the content from the factory.

[--SNIP--]
> > Rather, I think the "surface attack", unused components or unwanted
> > components, is a better approach to sell these changes.
> Size is a bad but easy to sell measurement for exactly that
> (especially for non-techs).

Hey! You're not speaking top non-tech people here! ;-)

Or so I hope... [snicker] r-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
