From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jun 2017 08:29:08 +0200
Subject: [Buildroot] [PATCH] mtd: restore installation of libmtd to
	staging
In-Reply-To: <20170628035610.9945-1-yurovsky@gmail.com>
References: <20170628035610.9945-1-yurovsky@gmail.com>
Message-ID: <20170628082908.3e2808d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your patch!

On Tue, 27 Jun 2017 20:56:10 -0700, Andrey Yurovsky wrote:

> +define MTD_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
> +	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
> +	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
> +	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
> +	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
> +endef
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))

Since it's an autotools package, it has a "make install" step that
should install those libraries. I believe that if the upstream mtd
doesn't install such useful libraries as part of its "make install"
step, then we should instead patch the upstream Makefile.am, and
contribute it upstream.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
