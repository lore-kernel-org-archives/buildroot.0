From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 18:45:20 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <XnsA719B7856709BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170211163706.GB20146@free.fr>
 <XnsA719B7856709BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20170211174519.GC20146@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-02-11 18:02 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20170211163706.GB20146 at free.fr: 
> 
> > So Kodi actually *can* use external dvdcss, dvdread and dvdnav
> > libraries. It /just/ needs KODI_DEPENDSBUILD (whjatever that is supposed
> > to mean... :-/ )
> 
> Kodi can build _all_ its dependencies during build:
> https://github.com/xbmc/xbmc/tree/Krypton/tools/depends/target
> https://github.com/xbmc/xbmc/blob/Krypton/tools/depends/target/Toolchain.cmak
> e.in#L84
> 
> If KODI_DEPENDSBUILD = OFF then Kodi assumes all dependencies were build
> outside Kodi: https://github.com/xbmc/xbmc/pull/11088

From that cmake file, it seems we need to set KODI_DEPENDSBUILD=ON for
it to use pre-built libs, no?

And that Toolchain.cmake.in file you pointed to above seem to default to
using the externally-provided libs...

Unless I'm completely out of mny shoes... :-/

> Yes, maybe we could build libdvd* using buildroot, but we would still need
> to add the Kodi-specific patches to the packages which I want to avoid.

Well, that's what your series was doing, no?

In the end, I think I'd prefer we (unconditionally) patch the packages,
as long as those patches seem reasonable (i.e. upstreamable).

Of course, if those patches are really Kodi-specific (i.e. introduces
changes just for the sake of Kodi and are not upstreamable), then I'd
revise my position.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
