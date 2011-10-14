From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2011 08:35:27 +0200
Subject: [Buildroot] [PATCH] package: add libfcgi fast cgi library.
In-Reply-To: <1318546019-28462-1-git-send-email-arnout@mind.be>
References: <201110140033.51194.arnout@mind.be>
 <1318546019-28462-1-git-send-email-arnout@mind.be>
Message-ID: <20111014083527.26ceb18f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 14 Oct 2011 00:46:59 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> +config BR2_PACKAGE_LIBFCGI
> +    bool "libfcgi"
> +    help

One tab.

> +        This is a fastcgi developer library for C/C++
> +        http://www.fastcgi.com/

One tab + two spaces.

> diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
> new file mode 100644
> index 0000000..72bbf9a
> --- /dev/null
> +++ b/package/libfcgi/libfcgi.mk
> @@ -0,0 +1,12 @@
> +##############################################################################
> +#
> +# libfcgi
> +#
> +##############################################################################
> +LIBFCGI_VERSION = 2.4.0
> +LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
> +LIBFCGI_SITE = http://www.fastcgi.com/dist
> +LIBFCGI_INSTALL_STAGING = YES
> +LIBFCGI_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -lm"
> +
> +$(eval $(call AUTOTARGETS,package,libfcgi))

$(eval $(call AUTOTARGETS))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
