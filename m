From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 20:19:27 +0200
Subject: [Buildroot] [PATCH 08/11] libpng: fix host-libpng build on
 system on which zlib.h is missing.
In-Reply-To: <50102F62.70005@mind.be>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-9-git-send-email-s.martin49@gmail.com>
 <20120722162756.2d508583@skate> <50102F62.70005@mind.be>
Message-ID: <20120725201927.021ad0dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 19:39:46 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> >> +-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
> >> ++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) $(CFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
> >
> > Shouldn't we be passing the right arguments in CPPFLAGS instead?
> 
>   Good point.  HOST_CONFIGURE_OPTS doesn't set CPPFLAGS at all...

To what value should we set CPPFLAGS then?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
