From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Mar 2018 16:42:24 +0200
Subject: [Buildroot] [V4 1/2] dropbear: bump to version 2018.76
In-Reply-To: <CAB0FRsst0X_avRh0_AkSo=zTBnkHCKCiL6_dL9g0PCoP57syQA@mail.gmail.com>
References: <20180328083827.31540-1-francois.perrad@gadz.org>
 <20180328135104.61e8e835@windsurf>
 <CAB0FRsst0X_avRh0_AkSo=zTBnkHCKCiL6_dL9g0PCoP57syQA@mail.gmail.com>
Message-ID: <20180328164224.656e7c04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Mar 2018 16:41:03 +0200, Fran?ois Perrad wrote:

> > On Wed, 28 Mar 2018 10:38:26 +0200, Francois Perrad wrote:
> >  
> > > +define DROPBEAR_SVR_PASSWORD_AUTH
> > > +     echo '#if !HAVE_CRYPT'                          >>  
> > $(@D)/localoptions.h  
> > > +     echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >>  
> > $(@D)/localoptions.h  
> > > +     echo '#endif'                                   >>  
> > $(@D)/localoptions.h  
> > >  endef  
> >
> > Since this is really a bug in dropbear, shouldn't this be handled by a
> > patch, which gets submitted upstream ?
> >
> >  
> The average Dropbear user puts only #define in localoptions.h
> BR supports various toolchains with many differences, so we need some logic
> in localoptions.h
> There is no upstream bug.

I think there's an upstream bug if the configure script detects the
presence/absence of crypt(), but then doesn't use this information to
disable features that require crypt() when it's not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
