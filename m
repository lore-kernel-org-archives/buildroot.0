From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 13:39:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200813232351.1552307-1-aduskett@gmail.com>
References: <20200813232351.1552307-1-aduskett@gmail.com>
Message-ID: <20200814133934.26a33b17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 16:23:51 -0700
aduskett at gmail.com wrote:

> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +AVAHI_DEPENDENCIES += gobject-introspection
> +AVAHI_CONF_OPTS += --enable-gobject
> +AVAHI_MAKE_ENV += \
> +	GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"

This really isn't very neat. Isn't there a better solution?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
