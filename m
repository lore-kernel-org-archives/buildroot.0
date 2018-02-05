From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Feb 2018 22:41:57 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180205210150.ok3hhfucmxu3uz3l@tarshish>
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
Message-ID: <20180205214157.GC2806@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-02-05 23:01 +0200, Baruch Siach spake thusly:
> On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
> > See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
> > https://sourceware.org/glibc/wiki/Release/2.27
> Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
> CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.

There are 10 CVE listed in the release annoucement mail, but you list
only five here. Why only those?

Do we want to list all the CVEs fixed in a release? And if we don't list
all, why do we even list only a subset?

I don't think we should, especially since the release mail is linked to
the commit log and has all the details.

Regards,
Yann E. MORIN.

> > Add hash files
> 
> You mean license files hash, right?
> 
> baruch
> 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >  package/glibc/glibc.hash | 6 +++++-
> >  package/glibc/glibc.mk   | 2 +-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> > index f3a6577d2a..86d3bb56dd 100644
> > --- a/package/glibc/glibc.hash
> > +++ b/package/glibc/glibc.hash
> > @@ -1,4 +1,8 @@
> >  # Locally calculated (fetched from Github)
> > -sha256  0766875391224153502c5542a71b6e46db53b44691078b3130e1a0df41586430     glibc-glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40.tar.gz
> > +sha256  a74489d14f4017bee6a6c6fe76f1de0dbf7d66c8695116de5aadd141c4757892     glibc-glibc-2.27.tar.gz
> >  # Locally calculated (fetched from Github)
> >  sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
> > +
> > +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> > +sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
> > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> > index cf4bdec065..b674191b22 100644
> > --- a/package/glibc/glibc.mk
> > +++ b/package/glibc/glibc.mk
> > @@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
> >  else
> >  # Generate version string using:
> >  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> > -GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
> > +GLIBC_VERSION = glibc-2.27
> >  # Upstream doesn't officially provide an https download link.
> >  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> >  # sometimes the connection times out. So use an unofficial github mirror.
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
