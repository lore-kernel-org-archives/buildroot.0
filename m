From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Aug 2014 12:10:41 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
In-Reply-To: <XnsA3974DCE8DC95berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
 <20140827204942.GA21009@free.fr> <87wq9tsjoc.fsf@dell.be.48ers.dk>
 <20140827213842.GB21009@free.fr>
 <XnsA3974DCE8DC95berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140828101041.GE4042@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Peter, All,

On 2014-08-28 07:38 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20140827213842.GB21009 at free.fr:
> 
> >> Then we should imho get rid of the XBMC_DBUS option if that option
> >> doesn't do anything.
> > 
> > That option does select BR2_PACKAGE_DBUS.
> 
> should BR2_PACKAGE_DBUS in turn not select BR2_PACKAGE_XBMC_DBUS then?
> Otherwise users might think DBUS is disabled for xbmc while it is enabled due 
> to BR2_PACKAGE_DBUS. Otoh I could try to provide an xbmc/configure option
> --en/disable-dbus upstream.

Well, barring an option in XBMC to explicitly enable/disable DBUS, we
can't do much. What we can do is hide the DBU option in XBMC if DBUS is
already selected (but that's a circular dependency, which kconfig does
not like much.)

> > But for XBMC, the reasoning was that we would not want such a behaviour,
> > since some dependencies are not trivial (e.g. shairplay, CEC...), so the
> > kconfig options to XBMC are here to facilitate the user's life.
> 
> +1, same should be done for alsa and libva.

Yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
