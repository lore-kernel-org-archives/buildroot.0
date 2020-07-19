From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 21:44:13 +0200
Subject: [Buildroot] local autobuild failures
In-Reply-To: <CAEyMn7YrdnjRAZFTjsKBSjFw3eWkBiYX0RhYQ9=40HWn9z9HBw@mail.gmail.com>
References: <CAEyMn7YeeODW9bKxQYY1oXotvyNG+QX41kbGhmrHKiqOsd0hdQ@mail.gmail.com>
 <20200718141049.115c1bb0@windsurf.home>
 <CAEyMn7bJ54kxuP0LGAJ0sCZGokx7cAoQrsiQhuafBw0kJeFbHA@mail.gmail.com>
 <20200719100310.284d3f0f@windsurf.home>
 <CAEyMn7YrdnjRAZFTjsKBSjFw3eWkBiYX0RhYQ9=40HWn9z9HBw@mail.gmail.com>
Message-ID: <20200719194413.GZ18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-07-19 20:12 +0200, Heiko Thiery spake thusly:
> Am So., 19. Juli 2020 um 10:03 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> > On Sat, 18 Jul 2020 20:10:08 +0200
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > buildroot at USE306VV1C:/srv/storage/autobuild/run$ locale -a
> > > C
> > > C.UTF-8
> > > POSIX
> > Could you try adding a non-C UTF-8 locale, en_US.UTF-8, or something
> > like that, and see what happens ?
> With installing en_US.utf8 the issue seems to be gone.
> Does that mean the check in support/dependencies/dependencies.sh [1]
> is not correct?
> [1] https://git.buildroot.net/buildroot/tree/support/dependencies/dependencies.sh#n189

Yes, we should filter out C.UTF-8.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
