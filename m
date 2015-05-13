From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 14 May 2015 09:14:54 +1000
Subject: [Buildroot] [PATCH v2 2/2] powerpc-utils: optionally use librtas
In-Reply-To: <20150513031617.GD2558@tarshish>
References: <cover.1431403924.git.sam.bobroff@au1.ibm.com>
 <4a40d63bb8a0fdf9a3dc8811a62dc7872fcddd87.1431403924.git.sam.bobroff@au1.ibm.com>
 <20150513031617.GD2558@tarshish>
Message-ID: <20150513231454.GA9584@ocelot.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 13, 2015 at 06:16:17AM +0300, Baruch Siach wrote:
> Hi Sam,
> 
> On Tue, May 12, 2015 at 02:12:08PM +1000, Sam Bobroff wrote:
> > diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
> > index 3b30458..486ed20 100644
> > --- a/package/powerpc-utils/powerpc-utils.mk
> > +++ b/package/powerpc-utils/powerpc-utils.mk
> > @@ -7,10 +7,15 @@
> >  POWERPC_UTILS_VERSION = 1.2.24
> >  POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
> >  POWERPC_UTILS_DEPENDENCIES = zlib
> > +ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
> > +POWERPC_UTILS_DEPENDENCIES += librtas
> > +endif
> >  POWERPC_UTILS_LICENSE = Common Public License Version 1.0
> >  POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
> >  
> > +ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),)
> >  POWERPC_UTILS_CONF_OPTS = --without-librtas
> > +endif
> 
> The usual convention is to put dependency handling in one place, and to have 
> both "with" and "without".
> 
> ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
> POWERPC_UTILS_DEPENDENCIES += librtas
> POWERPC_UTILS_CONF_OPTS = --with-librtas
> else
> POWERPC_UTILS_CONF_OPTS = --without-librtas
> endif
> 
> baruch

OK. Will do.

Thanks,
Sam.
