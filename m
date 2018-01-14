From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 14 Jan 2018 18:53:48 +0100
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.11
In-Reply-To: <20180113222803.GI3226@scaer>
References: <20180110222816.20579-1-joerg.krause@embedded.rocks>
 <20180113222803.GI3226@scaer>
Message-ID: <1515952428.8426.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 2018-01-13 at 23:28 +0100, Yann E. MORIN wrote:
> J?rg, All,
> 
> On 2018-01-10 23:28 +0100, J?rg Krause spake thusly:
> [--SNIP--]
> > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> > index fbb092da05..d1afbc4882 100644
> > --- a/package/swupdate/swupdate.mk
> > +++ b/package/swupdate/swupdate.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -SWUPDATE_VERSION = 2017.07
> > +SWUPDATE_VERSION = 2017.11
> >  SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> >  SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
> >  SWUPDATE_LICENSE_FILES = COPYING
> > @@ -39,8 +39,13 @@ else
> >  SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
> > -SWUPDATE_DEPENDENCIES += lua host-pkgconf
> > +
> 
> This is adding an extra empty line, which would have been caught by
> running:
> 
>     $ ./utils/check-package package/swupdate/swupdate.mk
>     package/swupdate/swupdate.mk:42: consecutive empty lines
>     140 lines processed
>     1 warnings generated
> 
> Care to fix, please?

Thanks for reporting! Fix is on his way...

J?rg
