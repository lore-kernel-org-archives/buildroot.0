From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:22:34 +0100
Subject: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
In-Reply-To: <20201230111823.3114e2a6@windsurf>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
 <20201230111823.3114e2a6@windsurf>
Message-ID: <20210119222234.29ac8a2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Wed, 30 Dec 2020 11:18:23 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > +ifeq ($(BR2_PACKAGE_QT5BASE_FONTCONFIG),y)
> > +QT5WEBENGINE_DEPENDENCIES += host-freetype
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_QT5BASE_JPEG),y)
> > +QT5WEBENGINE_DEPENDENCIES += host-libjpeg
> > +endif  
> 
> This looks really odd. Why would these target-related features require
> host-freetype and host-libjpeg ? Aren't we instead seeing some
> pkg-config issue where it's trying to find freetype/libjpeg for the
> target, but it for some reason doesn't work, and tries to find them for
> the host ?

Do you have some further feedback on this issue ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
