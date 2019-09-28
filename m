From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:29:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to
 version 4.1.5
In-Reply-To: <20190928125635.4322-2-fontaine.fabrice@gmail.com>
References: <20190928125635.4322-1-fontaine.fabrice@gmail.com>
 <20190928125635.4322-2-fontaine.fabrice@gmail.com>
Message-ID: <20190928212929.08c7aa4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 14:56:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -ifeq ($(BR2_PACKAGE_GEOIP),y)
> -SURICATA_DEPENDENCIES += geoip
> -SURICATA_CONF_OPTS += --enable-geoip
> -else
> -SURICATA_CONF_OPTS += --disable-geoip
> -endif
> -
>  ifeq ($(BR2_PACKAGE_HIREDIS),y)
>  SURICATA_DEPENDENCIES += hiredis
>  SURICATA_CONF_OPTS += --enable-hiredis
> @@ -58,6 +53,15 @@ else
>  SURICATA_CONF_OPTS += --disable-hiredis
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +SURICATA_DEPENDENCIES += libmaxminddb
> +SURICATA_CONF_OPTS += \
> +	--disable-libgeoip \
> +	--enable-geoip

I'm a bit confused by the semantic of the options here. Why are you
passing --disable-libgeoip in this block ?

> +else
> +SURICATA_CONF_OPTS += --disable-geoip
> +endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
