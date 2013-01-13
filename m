From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 18:59:28 +0100
Subject: [Buildroot] [PATCH 1/1 v3] New package : GNU SASL Library -
 libgsasl
In-Reply-To: <1358098580-8796-1-git-send-email-sagaert.johan@skynet.be>
References: <1358098580-8796-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130113185928.6e6c1a87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 13 Jan 2013 18:36:20 +0100, Sagaert Johan wrote:
> 
> GNU SASL is an implementation of the Simple Authentication and Security Layer framework
> and a few common SASL mechanisms.
> SASL is used by network servers (e.g., IMAP, SMTP) to request authentication from clients,
> and in clients to authenticate against servers.

Commit logs must be wrapped to ~75-80 columns.

> libgsasl will be used in future versions of libesmtp.
> 
> Patch v3 : corrected license information in libgsasl.mk
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

The changelog must be after the "---" marker. The last paragraph of the
commit log should be separated with the Signed-off-by line by one
empty new line.

> --- /dev/null
> +++ b/package/libgsasl/libgsasl.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# libgsasl
> +#
> +#############################################################
> +LIBGSASL_VERSION = 1.8.0
> +LIBGSASL_SOURCE = libgsasl-$(LIBGSASL_VERSION).tar.gz
> +LIBGSASL_SITE = ftp://ftp.gnu.org/gnu/gsasl

Please use BR2_GNU_MIRROR. So:

LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl

> +LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
> +LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
> +LIBGSASL_INSTALL_STAGING = YES
> +LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
> +
> +$(eval $(autotools-package))
> +
> +
> +  
> +

Please remove those last empty lines.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
