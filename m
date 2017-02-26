From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 19:02:36 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: pass <pkg>_CONF_ENV for the
 target configure step
In-Reply-To: <20170226175848.GD4043@free.fr>
References: <1488130968-20114-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170226175848.GD4043@free.fr>
Message-ID: <20170226190236.3889bf4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 18:58:48 +0100, Yann E. MORIN wrote:

> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 4e0e838..a7c8dc3 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -109,7 +109,7 @@ define $(2)_CONFIGURE_CMDS
> >  	cd $$($$(PKG)_BUILDDIR) && \
> >  	rm -f CMakeCache.txt && \
> >  	PATH=$$(BR_PATH) \
> > -	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > +	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \  
> 
> I would have written the extra env on its own line, like is done in e.g.
> pkg-autotools:

Expect that's not how it's done currently for the host variant of
pkg-cmake, i.e it's done like I'm proposing in my patch. So for
consistency, I prefer my option (and possibly a follow-up patch making
both the host and target variant consistent with pkg-autotools.mk).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
