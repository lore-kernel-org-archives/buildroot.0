From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 16:01:44 +0200
Subject: [Buildroot] [PATCH 1/1] micropython: bump version to v1.9.3
In-Reply-To: <1523885614.4244.5.camel@flir.com>
References: <1523885614.4244.5.camel@flir.com>
Message-ID: <20180416160144.08709147@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marteen,

On Mon, 16 Apr 2018 13:28:47 +0000, Blomme, Maarten wrote:
> (With correct formatting now)

Unfortunately no, the formatting is still not correct, because you
didn't send with git send-email.

>  define MICROPYTHON_BUILD_CMDS
> -$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
> +$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
> +$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
>  $(MICROPYTHON_MAKE_OPTS) \
>  CROSS_COMPILE=$(TARGET_CROSS) \
>  CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
>  endef

The lines in this variable are indented in the current code, but are
not in your patch. Hence the patch is broken.

There's a reason why everybody uses git send-email: because it does the
right thing :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
