From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Sep 2012 22:46:04 +0200
Subject: [Buildroot] [PATCH 3/3] mplayer: Fix external libdvdread and
 libdvdnav support
In-Reply-To: <20120926193451.GA3983@gmail.com>
References: <20120926193155.GA3942@gmail.com> <20120926193451.GA3983@gmail.com>
Message-ID: <20120926224604.2cb082f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Valentine Barshak,

On Wed, 26 Sep 2012 23:34:51 +0400, Valentine Barshak wrote:

> +ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
> +MPLAYER_CONF_OPTS +=  \
> +	--enable-dvdread \
> +	--disable-dvdread-internal \
> +	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
> +MPLAYER_DEPENDENCIES += libdvdread
> +endif

Don't we want a:

else
MPLAYER_CONF_OPTS += --disable-dvdread --disable-dvdread-internal
endif

> +ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
> +MPLAYER_CONF_OPTS +=  \
> +	--enable-dvdnav \
> +	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
> +MPLAYER_DEPENDENCIES += libdvdnav
> +endif

else
MPLAYER_CONF_OPTS += --disable-dvdnav
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
