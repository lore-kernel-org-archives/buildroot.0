From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 09:21:20 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210622203909.GJ44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-7-herve.codina@bootlin.com>
 <20210622203909.GJ44262@scaer>
Message-ID: <20210625092120.3f77d754@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 22:39:09 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
> > +	$(foreach hook,$($(PKG)_PER_PACKAGE_TWEAK_HOOKS),$(call $(hook))$(sep))  
> 
> I am going to bikeshed on the naming of this variable (which is a good
> sing that I am pretty much OK with the feature).
> 
> I think $(2)_EARLY_PRE_CONFIGURE_HOOKS is more sensible.

That's good for me.

Okay for everyone ?

Regards,
Herve

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
