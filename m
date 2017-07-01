From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 18:54:28 +0200
Subject: [Buildroot] [PATCH] mtd: restore installation of libmtd to
 staging
In-Reply-To: <20170628035610.9945-1-yurovsky@gmail.com>
References: <20170628035610.9945-1-yurovsky@gmail.com>
Message-ID: <20170701185428.15f8a491@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 20:56:10 -0700, Andrey Yurovsky wrote:

> +define MTD_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
> +	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
> +	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
> +	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
> +	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
> +endef

I've applied, but I've changed this to be a post install staging hook.
This way, the normal "make install" is done for staging, and then those
additional libraries are installed as well. I've also added a comment
in the code explaining why we're doing this.

It would still be good to let upstream know that those libraries are
used by other programs, and see if they would accept to adjust the
Makefile.am logic to install such libraries.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
