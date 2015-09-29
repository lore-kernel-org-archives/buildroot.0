From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 21:51:24 +0300
Subject: [Buildroot] [PATCH 1/2] libbluray: add optional fontconfig
 dependency
In-Reply-To: <20150929194154.5377bd2a@free-electrons.com>
References: <c0676cbc3b883de88e98c9ba28d8023f17cb5e88.1443531503.git.baruch@tkos.co.il>
 <20150929194154.5377bd2a@free-electrons.com>
Message-ID: <20150929185124.GC2309@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 29, 2015 at 07:41:54PM +0200, Thomas Petazzoni wrote:
> On Tue, 29 Sep 2015 15:58:22 +0300, Baruch Siach wrote:
> 
> > diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> > index e10f7dbc8c73..f6a501a1083f 100644
> > --- a/package/libbluray/libbluray.mk
> > +++ b/package/libbluray/libbluray.mk
> > @@ -24,6 +24,12 @@ else
> >  LIBBLURAY_CONF_OPTS += --without-freetype
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> > +LIBBLURAY_DEPENDENCIES += fontconfig
> > +else
> > +LIBBLURAY_CONF_OPTS += --without-fontconfig
> > +endif
> 
> I would prefer to have an explicit --with-fontconfig when
> BR2_PACKAGE_FONTCONFIG=y. I know it's not the case for the other
> dependencies already handled by libbluray.mk, so I've applied your
> patch as is, and my comment can be fixed for all optional dependencies
> of libbluray in a separate patch.

Just posted a patch for that.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
