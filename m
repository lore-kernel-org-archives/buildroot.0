From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Oct 2011 10:16:34 +0200
Subject: [Buildroot] [PATCH] package: add the duma memory debugging
 library
In-Reply-To: <201110051935.41682.yann.morin.1998@anciens.enib.fr>
References: <b290fe079ce824d7574c1ad5f41987e21becc92e.1317795453.git.baruch@tkos.co.il>
 <201110051935.41682.yann.morin.1998@anciens.enib.fr>
Message-ID: <20111006101634.601b9e9f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 5 Oct 2011 19:35:41 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> > +	$(MAKE1) CC=$(TARGET_CC) CXX=$(TARGET_CXX) AR=$(TARGET_AR) \
> > +		RANLIB=$(TARGET_RANLIB) DUMA_OPTIONS=$(strip $(DUMA_OPTIONS)) \
> > +		$(DUMA_CPP) -C $(@D)
> 
> You forgot to pass HOSTCC, introduced in duma-2_5_15-cross-compile.patch

Probably something like:

	$(MAKE1) $(TARGET_CONFIGURE_OPTS) DUMA_OPTIONS=... -C $(@D)

would be even better. But then, the duma-2_5_15-cross-compile.patch
would have to use CC_FOR_BUILD instead of HOSTCC to find the location
of the native host compiler.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
