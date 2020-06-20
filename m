From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:29:33 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/dejavu: Install dejavu fonts
 in staging dir
In-Reply-To: <20200619145719.2352019-2-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-2-angelo@amarulasolutions.com>
Message-ID: <20200620222933.16376fca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri, 19 Jun 2020 16:57:13 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> The dejavu font is used by cups-filters and needs to be
> installed in staging directory.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

The question is why should we do this just for the DejaVu fonts ? And
not other font packages ?

> +define DEJAVU_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/share/fonts/dejavu/
> +	for i in $(DEJAVU_FONTS_INSTALL) ; do \
> +		$(INSTALL) -m 0644 $(@D)/ttf/$$i \
> +			$(STAGING_DIR)/usr/share/fonts/dejavu/ || exit 1 ; \
> +	done
> +endef
> +
>  define DEJAVU_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/usr/share/fonts/dejavu/
>  	for i in $(DEJAVU_FONTS_INSTALL) ; do \

We could factorize things a bit between staging/target installation,
and perhaps use a make "foreach" loop (if that works). But really these
are minor details, the main question is: why DejaVu specifically.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
