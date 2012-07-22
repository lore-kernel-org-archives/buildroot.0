From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:27:56 +0200
Subject: [Buildroot] [PATCH 08/11] libpng: fix host-libpng build on
 system on which zlib.h is missing.
In-Reply-To: <1342963719-1810-9-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-9-git-send-email-s.martin49@gmail.com>
Message-ID: <20120722162756.2d508583@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jul 2012 15:28:36 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> +-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
> ++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) $(CFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \

Shouldn't we be passing the right arguments in CPPFLAGS instead?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
