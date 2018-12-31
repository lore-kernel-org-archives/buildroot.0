From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2018 15:27:39 +0100
Subject: [Buildroot] [PATCH v3 1/2] dependencies.sh: Check for a host
 python version >= 2.7
In-Reply-To: <CAFSsvmpWuEcruH55C-93Ek9fb0JKfHvex4NY2arGCxG5LD68OQ@mail.gmail.com>
References: <20181216232734.100068-1-aduskett@gmail.com>
 <20181217082836.72eff0aa@gmx.net>
 <2B863C9D-397E-4EED-B47D-1E08D4D45741@gmail.com>
 <3924a6bb-00c4-8157-6294-6b24834456b6@mind.be>
 <CAFSsvmpWuEcruH55C-93Ek9fb0JKfHvex4NY2arGCxG5LD68OQ@mail.gmail.com>
Message-ID: <20181231142739.GA21682@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-18 11:13 -0500, Adam Duskett spake thusly:
> Hello;
> 
> On Mon, Dec 17, 2018 at 6:25 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> >
> > On 17/12/2018 14:10, ratbert90 wrote:
> > > Hello Peter;
> > >
> > > I would question as to why we would do anything to support such an old version of
> >> Python that was EOLed over 5 years ago.  Heck, even 2.7 will be EOLed in 2020.
> > >
> > > Looking around, the only distribution that has 2.6 that still has any kind of support
> >> is CentOS6, and even that is in maintenance mode.
> >
> >  RHEL6 will be retired November 30, 2020. SLES11 also hase Python 2.6 and will
> > be retired 31 Mar 2022.

RHEL5 gets extended support until end of 2020, while RHEL6 gets extended
support until mid-2024.

You would be amazed how old stuff tend to stick around in entrerpise-y
context. ;-]

> >
> > > 2.7 is a safe bet in my opinion.
> >
> >  Indeed, because it can be installed both on RHEL6 and on SLES11.
> >
> >  However, IIUC, it is *not* possible to install python 2.7 as the *default*
> > python on these distros, because some scripts that are used in normal operation
> > don't work with python 2.7.
> In the case of RHEL; one can run: `source /opt/rh/python27/enable` which will
> add the appropriate paths for Python2.7 to be the default.
> 
> As far as SLES11 goes, I don't know how many people use it, but it has to be
> microscopic at this point.
> 
> > So, the test that you added to dependencies.sh is
> > probably too strict, because it checks that python -V gives at least 2.7...
> If one runs `source /opt/rh/python27/enable` in CentOS6, then running
> `python -V`
> will give 2.7.13.

Since there are practical workarounds for affected users, I'm fine that
we require pythhon-2.7 now.

Note that, if libglib2 does require a host pytrhon-2.7 and we are not
willing to change our own requirements, then we can always add
host-python to libglib2's dependencies. But, meh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
