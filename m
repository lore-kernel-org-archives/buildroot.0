From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Nov 2012 10:25:45 +0100
Subject: [Buildroot] [PATCH 1/1] libxml2: add support for building host
 library with python support
In-Reply-To: <1352883977-16288-1-git-send-email-noel.vellemans@visionbms.com>
References: <1352883977-16288-1-git-send-email-noel.vellemans@visionbms.com>
Message-ID: <20121114102545.7f835367@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noel,

On Wed, 14 Nov 2012 10:06:17 +0100, Noel vellemans wrote:

> +config BR2_PACKAGE_HOST_LIBXML2_PYTHON
> +    bool
> \ No newline at end of file

I don't know if we want to introduce sub-options for host packages.

> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 71f2bd1..fde3735 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -26,7 +26,15 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS +=
> LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP 
>  HOST_LIBXML2_DEPENDENCIES = host-pkgconf
>  
> -HOST_LIBXML2_CONF_OPT = --without-debug --without-python
> +HOST_LIBXML2_CONF_OPT = --without-debug
> +
> +ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
> +HOST_LIBXML2_DEPENDENCIES += host-python
> +HOST_LIBXML2_CONF_OPT += --with-python=$(HOST_DIR)/usr
> +else
> +HOST_LIBXML2_CONF_OPT += --without-python
> +endif

I'm confused here. I thought mesa required a Python that has xml2
support. But here you're building xml2 with Python support. Could you
enlighten me? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
