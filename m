From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jun 2012 09:21:36 +0200
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
In-Reply-To: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
References: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
Message-ID: <20120603092136.3a462ea1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 3 Jun 2012 05:57:46 +0300,
Murat Demirten <mdemirten@yh.com.tr> a ?crit :

> --- /dev/null
> +++ b/package/jpeg-turbo/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_JPEG_TURBO
> + bool "jpeg-turbo"

Indentation should be one tab.

> + help

Here as well.

> +   It is a derivative of libjpeg that uses SIMD instructions
> +   (MMX, SSE2, NEON) to accelerate baseline JPEG compression
> +   and decompression on x86, x86-64, and ARM systems.
> +
> +   http://libjpeg-turbo.virtualgl.org

Indentation should be one tab + two spaces (for the help text)

> +choice
> + prompt "libjpeg api version"

Fix indentation everywhere :)

> --- /dev/null
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO_APIVERSION_62),y)
> + JPEG_TURBO_CONF_ENV += JPEG_LIB_VERSION=62
> +endif
> +
> +$(eval $(call AUTOTARGETS))
> +$(eval $(call AUTOTARGETS,host))

There's no need to have a host variant of this package I think. 

Also, your patch is line-wrapped, so it cannot easily be applied. Could
you fix your e-mail client, or better, use git send-email to send your
patch?

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
