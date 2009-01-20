From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 20 Jan 2009 07:02:39 +0100
Subject: [Buildroot] tslib puts staging_dir into pkgconfig file
In-Reply-To: <1232382648.8906.11.camel@sven>
References: <1232382648.8906.11.camel@sven>
Message-ID: <20090120070239.53b5e464@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Jan 2009 17:30:48 +0100
Sven Neumann <s.neumann@phase-zero.de> wrote:

<snipp>

> Index: package/tslib/tslib.mk
> ===================================================================
> --- package/tslib/tslib.mk	(revision 24807)
> +++ package/tslib/tslib.mk	(working copy)
> @@ -29,13 +29,13 @@
>  	--target=$(GNU_TARGET_NAME) \
>  	--host=$(GNU_TARGET_NAME) \
>  	--build=$(GNU_HOST_NAME) \
> -	--prefix=$(STAGING_DIR)/usr \
> -	--exec_prefix=$(STAGING_DIR)/usr \
> +	--prefix=/usr \

This is usually enough to specify.

> +	--exec_prefix=/usr \
>  	--sysconfdir=/etc \

Along with this one.

>  	--datadir=/usr/share \
>  	--localstatedir=/var \
> -	--includedir=$(STAGING_DIR)/usr/include \
> -	--libdir=$(STAGING_DIR)/usr/lib \
> +	--includedir=/usr/include \
> +	--libdir=/usr/lib \
>  	--disable-static \
>  	--disable-linear-h2200 \
>  	--disable-ucb1x00 \

Why not just convert it to Makefile.autotools.in?

-- 
Best regards,
Hans-Christian Egtvedt
