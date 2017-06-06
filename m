From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:33:43 +0200
Subject: [Buildroot] [PATCH] package/tslib: enable statically linked
 building
In-Reply-To: <20170606160008.20503-1-martin.kepplinger@ginzinger.com>
References: <20170606160008.20503-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170606213343.198d1375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Jun 2017 18:00:08 +0200, Martin Kepplinger wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +TSLIB_CONF_OPTS += --disable-shared --enable-static \

These are not needed, and in fact wrong, because they don't do the
right thing for BR2_SHARED_STATIC_LIBS.

--{enable,disable}-{shared,static} is already automartically passed by
the package infrastructure.

> +		   --enable-input=static \
> +		   --enable-linear=static \
> +		   --enable-median=static \
> +		   --enable-pthres=static \
> +		   --enable-iir=static \
> +		   --enable-dejitter=static \
> +		   --enable-debounce=static \
> +		   --enable-skip=static

OK, for these, but please use just one tab for the indentation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
