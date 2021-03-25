From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Mar 2021 17:36:39 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build
In-Reply-To: <20210325173459.7d902f53@kmaincent-XPS-13-7390>
References: <20210204170446.15188-1-kory.maincent@bootlin.com>
 <20210316230852.298db3b5@windsurf.home>
 <20210325173459.7d902f53@kmaincent-XPS-13-7390>
Message-ID: <20210325173639.088ba6e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Mar 2021 17:34:59 +0100
K?ry Maincent <kory.maincent@bootlin.com> wrote:

> > After discussing with Yann E. Morin on IRC, could you try this change
> > instead:
> > 
> > 	$(TARGET_CONFIGURE_OPTS) \
> > 	        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> >         	PKG_CONFIG_SYSROOT_DIR="/" \
> > 	        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > 	        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> > 	        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
> > 
> > The reasoning is that U-Boot anyway only uses pkg-config for host
> > tools, so we could just as well pass those environment variables when
> > building U-Boot.
> > 
> > Could you try this out?  
> 
> This change works well, the build of U-boot ends properly.

Excellent, thanks!

> You can find the defconfig that break the U-boot build in attachment.

Perhaps it would be good to capture this defconfig as a test in
support/testing/, so we can make sure this doesn't regress?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
