From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 24 Jun 2021 18:20:52 +0200
Subject: [Buildroot] [PATCH 05/15] package/pkg-generic.mk: Perform .la
 files fixup in per-package HOST_DIR
In-Reply-To: <20210622101202.GE44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-6-herve.codina@bootlin.com>
 <20210622101202.GE44262@scaer>
Message-ID: <20210624182052.3550be4e@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 12:12:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  # $2: staging directory of the package
> >  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> >  define fixup-libtool-files
> > -	$(Q)find $(2)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
> > +	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
> > +		-name "*.la" | xargs --no-run-if-empty \
> >  		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"  
> 
> While at it, can you switch over to using find's -print0 and xarg's -0 ?

Yes, changed.

I will also change PATCH 10 of this series. Same construction in fixup-python-files
same sanction.

Regards,
Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
