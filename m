From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 28 Mar 2018 16:41:03 +0200
Subject: [Buildroot] [V4 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180328135104.61e8e835@windsurf>
References: <20180328083827.31540-1-francois.perrad@gadz.org>
 <20180328135104.61e8e835@windsurf>
Message-ID: <CAB0FRsst0X_avRh0_AkSo=zTBnkHCKCiL6_dL9g0PCoP57syQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-28 13:51 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed, 28 Mar 2018 10:38:26 +0200, Francois Perrad wrote:
>
> > +define DROPBEAR_SVR_PASSWORD_AUTH
> > +     echo '#if !HAVE_CRYPT'                          >>
> $(@D)/localoptions.h
> > +     echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >>
> $(@D)/localoptions.h
> > +     echo '#endif'                                   >>
> $(@D)/localoptions.h
> >  endef
>
> Since this is really a bug in dropbear, shouldn't this be handled by a
> patch, which gets submitted upstream ?
>
>
The average Dropbear user puts only #define in localoptions.h
BR supports various toolchains with many differences, so we need some logic
in localoptions.h
There is no upstream bug.

Fran?ois


> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180328/dc0e6c71/attachment.html>
