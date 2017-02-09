From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 9 Feb 2017 22:34:18 +0100
Subject: [Buildroot] [PATCH v1] qt5base: select qt-libpng in case
 builtin freetype library is used
In-Reply-To: <20170209221821.00c1dd4b@free-electrons.com>
References: <20170209174008.22871-1-ps.report@gmx.net>
 <20170209221821.00c1dd4b@free-electrons.com>
Message-ID: <20170209223418.48c2be5e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 9 Feb 2017 22:18:21 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu,  9 Feb 2017 18:40:08 +0100, Peter Seiderer wrote:
> 
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index 2cf0331b0..afe373123 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -149,7 +149,12 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
> >  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
> >  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
> >  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
> > +ifeq ($(BR2_QT5_VERSION_5_6)$(BR2_PACKAGE_QT5BASE_FONTCONFIG),)
> > +# qt-5.8.0 freetype needs libpng support
> > +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-qt-libpng)
> 
> Are you sure we need -qt-libpng in all cases when there is no
> fontconfig support? Isn't it only needed when the GUI module is enabled?
> 

Interesting question ;-), but I think your are right...

> Also, why is the builtin freetype library used? We generally don't like
> to use the builtin libraries. Can we instead rely on external libpng
> and external freetype?

Historic reasons (you did not add this feature back in 2013.... ;-))?

But same as Arnout Vandecappelle pointed out....

Will try to generate a patch...

Regards,
Peter

> 
> Thanks,
> 
> Thomas
