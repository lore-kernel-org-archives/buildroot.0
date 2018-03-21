From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 21:13:10 +0100
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321170413.74jd5vq4ygcgbewp@tarshish>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
Message-ID: <20180321211310.50f6410c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Mar 2018 19:04:13 +0200, Baruch Siach wrote:

> >  ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
> > -DROPBEAR_CONF_OPTS += --disable-zlib
> > +DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
> >  else
> >  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
> > -DROPBEAR_DEPENDENCIES += zlib
> > +DROPBEAR_DEPENDENCIES += zlib libtomcrypt
> > +DROPBEAR_CONF_OPTS += --disable-bundled-libtom  
> 
> As I said on v2[1] I think that unbundling static libraries is not worth it.
> 
> [1] http://patchwork.ozlabs.org/comment/1879448/

I am not sure why you say that. In general, I think unbundling is good.
Why should we make an exception here ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
