From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Mon, 20 Aug 2018 06:57:17 +0000
Subject: [Buildroot] Can not create driver package with local sources
In-Reply-To: <20180817233750.12cbc85e@windsurf>
References: <VI1PR0802MB22211E2F46DD87FB8C69FFF6EA3D0@VI1PR0802MB2221.eurprd08.prod.outlook.com>
 <20180817233750.12cbc85e@windsurf>
Message-ID: <VI1PR0802MB2221C786D19A7F77DE6A1B48EA320@VI1PR0802MB2221.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Thomas,

thanks a lot for you reply. Changing BR2_PACKAGE_SITEC_S4_LP_XXXX to SITEC_S4_LP_XXXX resolved the build issues.

Best regards

Fabrice Mousset


> -----Urspr?ngliche Nachricht-----
> Von: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Gesendet: Freitag, 17. August 2018 23:38
> An: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
> Cc: 'buildroot at busybox.net' <buildroot@busybox.net>
> Betreff: Re: [Buildroot] Can not create driver package with local sources
> 
> Hello Fabrice,
> 
> On Fri, 17 Aug 2018 14:06:35 +0000, Fabrice Mousset | GEOCEPT GmbH
> wrote:
> 
> > I try to create a custom package to build a linux driver which sources are
> stored locally, but this doesn't work, because source files are not copy to build
> directory.
> > I am using BuildRoot 2018.05.
> >
> > Here is my mk file:
> > ---
> > BR2_PACKAGE_SITEC_S4_LP_VERSION      = 1.0
> > BR2_PACKAGE_SITEC_S4_LP_SITE         = $(TOPDIR)/package/sitec-s4-lp/src
> > BR2_PACKAGE_SITEC_S4_LP_SITE_METHOD  = local
> > BR2_PACKAGE_SITEC_S4_LP_DEPENDENCIES = linux
> >
> > define BR2_PACKAGE_SITEC_S4_LP_BUILD_CMDS
> 
> All those prefixes are wrong. The variables in the .mk file should be prefixed by
> SITEC_S4_LP, not BR2_PACKAGE_SITEC_S4_LP.
> 
> As your .mk file is written, none of those variables are taken into account, so
> it's exactly as if your file contained just:
> 
> $(eval $(kernel-module))
> $(eval $(generic-package))
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons) Embedded Linux and
> Kernel engineering https://bootlin.com
