From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 10:19:37 +0100
Subject: [Buildroot] [RFC PATCH 2/2] package/libvips: enable
 introspection
In-Reply-To: <bc187a133185f0bf07a8fe9368dee4ffb8c785d6.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <bc187a133185f0bf07a8fe9368dee4ffb8c785d6.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <20170223101937.5e705932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 11:54:55 +1100, Sam Bobroff wrote:

> diff --git a/package/libvips/Config.in b/package/libvips/Config.in
> index 87ada513d..4380f2d1a 100644
> --- a/package/libvips/Config.in
> +++ b/package/libvips/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_LIBVIPS
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION

Clearly, seeing how gobject-introspection is complicated and brings
build dependencies, we want to keep this optional. So please do just:

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
LIBVIPS_CONF_OPTS += --enable-introspection
LIBVIPS_DEPENDENCIES += gobject-introspection
else
LIBVIPS_CONF_OPTS += --disable-introspection
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
