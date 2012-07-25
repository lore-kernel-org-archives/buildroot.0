From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 10:22:42 +0200
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
Message-ID: <20120725102242.77a06eca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 08:53:54 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> Hi Thomas. The build is now falling over for me:

This is the Python support of gpsd, correct? Was it building before my
patches?

Because if you look closely:

> /opt/tfx/arch/arm/usr/bin/ccache /usr/lib/ccache/gcc -pthread -o

It is building with the native compiler gcc and not the cross-compiler,
so obviously it cannot work. 

> > @@ -223,10 +224,9 @@ endef
> >  define GPSD_INSTALL_STAGING_CMDS
> >         (cd $(@D); \
> >                 $(GPSD_SCONS_ENV) \
> > +               DESTDIR=$(TARGET_DIR) \
> >                 $(SCONS) \
> >                 $(GPSD_SCONS_OPTS) \
> > -               destdir=$(STAGING_DIR) \
> > -               includedir="$(STAGING_DIR)/usr/include" \
> >                 install)
> >  endef
> 
> Should DESTDIR be set to $(STAGING_DIR), rather than $(TARGET_DIR), here?

Good point, will fix.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
