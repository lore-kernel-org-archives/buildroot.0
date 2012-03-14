From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 07:57:21 +0100
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
In-Reply-To: <1331680899-25945-1-git-send-email-yann.morin.1998@free.fr>
References: <1331680899-25945-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120314075721.68ff49ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 00:21:39 +0100,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
> index 8288b74..b298606 100644
> --- a/package/giblib/giblib.mk
> +++ b/package/giblib/giblib.mk
> @@ -8,7 +8,7 @@ GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
>  GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
>  GIBLIB_INSTALL_STAGING = YES
>  GIBLIB_DEPENDENCIES = imlib2
> -GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
> -		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
> +GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr \
> +		  --with-imlib2-exec-prefix=$(STAGING)/usr

s/STAGING/STAGING_DIR/.

Also, the modification on ./configure should be removed, and instead
the package marked AUTORECONF=YES. I'll test this this evening.

Thanks for working on this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
