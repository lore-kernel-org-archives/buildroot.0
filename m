From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 19:50:43 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <20130130154933.419b91f2@skate>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <201301301534.41339.yann.morin.1998@free.fr> <20130130154933.419b91f2@skate>
Message-ID: <201301301950.44357.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 30 January 2013 Thomas Petazzoni wrote:
> On Wed, 30 Jan 2013 15:34:41 +0100, Yann E. MORIN wrote:
> > Unfortunately, for pmake, the Debian "patch" does not come as a patch,
> > but as a tarball to be extracted in the pmake source dir. So, using:
> > 
> >     PMAKE_DEB_VER = -3.2-debian
> >     PMAKE_PATCH   = pmake_$(PMAKE_VERSION)$(PMAKE_DEB_VER).tar.gz
> > 
> > will not work, as this is not a patch. :-(
> 
> Argh, indeed. Those Debian people are really crazy. For some packages
> they have a .orig.tar.gz + a .diff.gz that applies as a patch on top of
> it, and for some other packages they have the .orig.tar.gz + a tarball
> with the Debian specific files. What a mess...
> 
> What about:
> 
>  PMAKE_PATCH = \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/100_mk.diff \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/110_mkdep.diff \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/120_fixes.diff \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/130_maxpathlen.diff \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/140_multiarch.diff \
>    http://patch-tracker.debian.org/patch/series/dl/pmake/1.111-3.2/150_mktemp.diff
> 
> Note that this requires the possibility of getting patches from a
> different site than the tarball, but J?r?me Pouiller has submitted a
> patch that makes this possible, see "[PATCH] Add support for plain URL
> in $(PKG)_PATCH variable".

Indeed, that looks waaaayyyy better. :-)

I'll include that multi-patch cset in my series, and repush, then.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
