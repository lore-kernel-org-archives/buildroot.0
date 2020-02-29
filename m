From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 23:28:07 +0100
Subject: [Buildroot] [PATCH 1/3] package/exiv2: annotate CVE-2019-13504
In-Reply-To: <20200229222154.GX8743@scaer>
References: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
 <20200229222154.GX8743@scaer>
Message-ID: <CAPi7W83y6UpduPvecerrx0UPqaR0NwJVKvV3KH6fFhiT2Yvs8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 29 f?vr. 2020 ? 23:21, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2020-02-29 22:32 +0100, Fabrice Fontaine spake thusly:
> > CVE-2019-13504 is misclassified (by our CVE tracker) as affecting
> > version 0.27.2, while in fact both commits that fixed this issue are
> > already in this version.
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I've applied patches 2 and 3, as I could follow the commit to upstream
> you provided in the patches.
>
> However, for patch 1, I have been able to track only one commit, but you
> noted two. It would be nice if youc ould provide the sha1 for those two
> commits.
Sure, here it is (from
https://security-tracker.debian.org/tracker/CVE-2019-13504):
- https://github.com/Exiv2/exiv2/commit/bd0afe0390439b2c424d881c8c6eb0c5624e31d9
- https://github.com/Exiv2/exiv2/commit/54f0bebca032d0286a0e48f47e67dfc6141fedff
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/exiv2/exiv2.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> > index 228b3a980e..09988f49b2 100644
> > --- a/package/exiv2/exiv2.mk
> > +++ b/package/exiv2/exiv2.mk
> > @@ -10,6 +10,11 @@ EXIV2_INSTALL_STAGING = YES
> >  EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
> >  EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
> >
> > +# CVE-2019-13504 is misclassified (by our CVE tracker) as affecting version
> > +# 0.27.2, while in fact both commits that fixed this issue are already in this
> > +# version.
> > +EXIV2_IGNORE_CVES += CVE-2019-13504
> > +
> >  EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
> >
> >  # The following CMake variable disables a TRY_RUN call in the -pthread
> > --
> > 2.25.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
