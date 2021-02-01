From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 01 Feb 2021 11:29:09 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/libgpiod=3A_bump_to_ve?=
 =?utf-8?q?rsion_1=2E6=2E2?=
In-Reply-To: <CAMRc=MfcP2OHngNzwM+L3YbmhhcvSGcmuGdau2dH_wG5pgQZqQ@mail.gmail.com>
Message-ID: <6b1-6017d800-5-32d73800@194734800>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,
 
On Monday, February 01, 2021 10:55 CET, Bartosz Golaszewski <brgl@bgdev.pl> wrote: 
 
> On Mon, Feb 1, 2021 at 10:13 AM Michael Nosthoff <buildroot@heine.tech> wrote:
> >

> > -LIBGPIOD_VERSION = 1.4.5
> > +# Be careful when bumping versions.
> > +# Dependency on kernel header versions may change.
> 
> You can remove this comment - for v1.6.x I won't change the headers
> version requirement anymore and vor v2.x we'll start bundling the
> kernel header with the library. I also don't plan on making any new
> feature releases for the v1.x series.
> 

perfect, then I'll drop that.

> > +LIBGPIOD_VERSION = 1.6.2
> >  LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
> >  LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> >  LIBGPIOD_LICENSE = LGPL-2.1+
> >  LIBGPIOD_LICENSE_FILES = COPYING
> >  LIBGPIOD_INSTALL_STAGING = YES
> >  LIBGPIOD_DEPENDENCIES = host-pkgconf
> > +LIBGPIOD_CONF_OPTS = --disable-tests
> >
> 
> Maybe add an option to build them conditionally? Like yocto's ptest
> distro feature?
> 

I'm not sure if this fits into buildroot's scope. What would be the benefit for the user? Maybe Thomas has an opinion on that?
From the dependencies I see we currently don't have catch2 in BR. So this might be the showstopper atm.

Regards,
Michael
