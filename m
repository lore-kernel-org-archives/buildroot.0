From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:23:30 +0100
Subject: [Buildroot] [PATCH 2/5] package/shairport-sync: make libdaemon
 an optional dependency
In-Reply-To: <20191203105341.1232360-2-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
 <20191203105341.1232360-2-joerg.krause@embedded.rocks>
Message-ID: <20191208232330.172a8263@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 11:53:38 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

>  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
>  SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
> -SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
> +SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig popt host-pkgconf
>  
>  # git clone, no configure
>  SHAIRPORT_SYNC_AUTORECONF = YES
> @@ -33,6 +33,11 @@ else
>  SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
> +SHAIRPORT_SYNC_DEPENDENCIES += libdaemon
> +SHAIRPORT_SYNC_CONF_OPTS += --with-libdaemon
> +endif

I've applied, but it would be nice to make shairport-sync follow the
same convention as other packages: explicitly pass --without-<foo> when
the relevant dependencies are not available (not just for
--with-libdaemon, but similarly for other features).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
