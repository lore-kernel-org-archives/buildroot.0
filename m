From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 17:11:02 +0100
Subject: [Buildroot] [PATCH 1/1] Added lcms2 package
In-Reply-To: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
References: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130303171102.20719854@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

Thanks for your contribution! A few comments below.

On Sat,  2 Mar 2013 20:47:27 +0200, Olivier Schonken wrote:
> Little CMS intends to be an OPEN SOURCE small-footprint color management engine, with special focus on accuracy and performance.

This should be wrapped at ~80 columns.


> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
> new file mode 100644
> index 0000000..be14554
> --- /dev/null
> +++ b/package/lcms2/lcms2.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# lcms2-2.4.tar.gz

Should be just "lcms2"

> +#
> +#############################################################
> +LCMS2_VERSION = 2.4

One line between the comment header and the first variable line.

> +LCMS2_SITE = http://prdownloads.sourceforge.net/LCMS2/LCMS2/

This should use http://downloads.sourceforge.net instead, see other
packages. downloads.sourceforge.net automatically redirects to a
working SourceForge mirror. 

> +LCMS2_SOURCE = lcms2-$(LCMS2_VERSION).tar.gz

This is not needed, that's the default.

> +LCMS2_INSTALL_STAGING = YES
> +LCMS2_LIBTOOL_PATCH = YES 

This is not needed, that's the default (for LIBTOOL_PATCH).

> +LCMS2_AUTORECONF = NO

This is not needed, that's the default.

> +LCMS2_CONF_OPT =           

Not needed.

> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +             LCMS2_CONF_OPT += --disable-shared 
> +else
> +             LCMS2_CONF_OPT += --enable-shared 
> +endif

Not needed, that's already done by the common autotools infrastructure,
see:
http://git.buildroot.net/buildroot/tree/package/pkg-autotools.mk#n112,
where SHARED_STATIC_LIBS_OPTS is defined at
http://git.buildroot.net/buildroot/tree/package/Makefile.in#n321.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
