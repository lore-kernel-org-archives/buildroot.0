From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 2 Oct 2019 23:19:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: drop second patch
In-Reply-To: <20191002210104.21757a2a@windsurf>
References: <20191002164700.26771-1-fontaine.fabrice@gmail.com>
 <20191002210104.21757a2a@windsurf>
Message-ID: <CAPi7W81K5BaSK6f5buhM6J4wLQmb_QNoWRmHMC_f83Vw2nbK=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le mer. 2 oct. 2019 ? 21:01, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Wed,  2 Oct 2019 18:47:00 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Second patch is not needed anymore as the only, optional, dependency of
> > libusb is udev which can't be built statically
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...check-for-g-when-FTDIPP-is-disabled.patch} |  0
> >  .../0002-cmake-fix-FindUSB1.cmake.patch       | 34 -------------------
> >  ...-swig.patch => 0003-cmake-find-swig.patch} |  0
> >  3 files changed, 34 deletions(-)
> >  rename package/libftdi1/{0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch => 0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch} (100%)
> >  delete mode 100644 package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
> >  rename package/libftdi1/{0004-cmake-find-swig.patch => 0003-cmake-find-swig.patch} (100%)
>
> Applied to master, thanks. I'm curious, how did you notice that this
> patch was no longer needed?
I tried to upstream this patch. They did not like the usage of
PC_LIBUSB_STATC_xxx variables so I was working on a more simple
approach using PC_LIBUSB_LIBRARIES but then I discovered that libftdi1
was building perfectly fine with libusb and that I could not enable
udev in static build.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
