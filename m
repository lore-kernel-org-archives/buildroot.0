From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 7 Feb 2018 19:05:05 +0100
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180203192750.pywvlwt25wlhvb4u@tarshish>
References: <20180129202314.16767-1-petr.vorel@gmail.com>
 <20180130051501.hvjb7h3smtif5zvu@sapphire.tkos.co.il>
 <20180201221950.aj6hrj2do573aqcz@dell5510>
 <20180202052328.f66l4zb2n6zkoypl@tarshish>
 <20180202135956.GB8864@x230>
 <20180203192750.pywvlwt25wlhvb4u@tarshish>
Message-ID: <20180207180504.GA29417@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

thanks for info!

> So the behaviour of ltp-testsuite changes when its configure script detects 
> libnuma, right? We want this change to be consistent whenever numactl is 
> enabled in buildroot, so that ltp-testsuite would always detect libnuma when 
> it is available. We don't want to leave it up to the pseudo-random packages 
> build order.
Understand. I'm sorry I didn't realize that numactl is not name of binary package,
but name of the whole library. I didn't know that upstream uses it as name of the whole
project.

> > > Currently when the numactl package is enabled, ltp-testsuite would 
> > > detect libnuma only if numactl happens to build before ltp-testsuite. To make 
> > > builds consistent we need to make sure that numactl always build before 
> > > ltp-testsuite by adding it to _DEPENDENCIES. Here is how the hwloc package 
> > > does that:

> > > ifeq ($(BR2_PACKAGE_NUMACTL),y)
> > > HWLOC_CONF_OPTS += --enable-libnuma
> > > HWLOC_DEPENDENCIES += numactl
> > > else
> > > HWLOC_CONF_OPTS += --disable-libnuma
> > > endif
> > So this is not needed.

> So this is needed to make the build consistent, IMO.
This makes sense. Would you please prepare patch?


Kind regards,
Petr
