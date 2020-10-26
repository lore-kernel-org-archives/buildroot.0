From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 26 Oct 2020 22:24:06 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/gpsd: enable python support
 and modules
In-Reply-To: <708ec24d77457a28b10a6970a474b834a489c060.camel@calian.com>
References: <20201025202457.1009025-1-geomatsi@gmail.com>
 <20201025202457.1009025-3-geomatsi@gmail.com>
 <708ec24d77457a28b10a6970a474b834a489c060.camel@calian.com>
Message-ID: <20201026192406.GA6556@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Robert,

> > @@ -186,6 +185,18 @@ endif
> >  ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
> >  GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
> >  endif
> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +	GPSD_SCONS_OPTS += \
> > +		python=yes \
> > +		python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
> > site-packages"
> > +else ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +	GPSD_SCONS_OPTS += \
> > +		python=yes \
> > +		python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/s
> > ite-packages"
> > +else
> > +	GPSD_SCONS_OPTS = \
> 
> This should presumably be += like the other cases, otherwise it will
> wipe out all the other options.
> 
> > +		python=no
> > +endif

Thanks for catching! I will fix this issue in v3.

Regards,
Sergey
