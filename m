From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 20:48:58 +0100
Subject: [Buildroot] [PATCH 1/1 v4] New package : GNU SASL Library -
	libgsasl
In-Reply-To: <1358103523-30951-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Sun, 13 Jan 2013 19:58:43 +0100")
References: <1358103523-30951-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87bocsyic5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> GNU SASL is an implementation of the Simple Authentication and Security Layer framework
 Sagaert> and a few common SASL mechanisms.
 Sagaert> SASL is used by network servers (e.g., IMAP, SMTP) to request authentication from clients,
 Sagaert> and in clients to authenticate against servers.

 Sagaert> libgsasl will be used in future versions of libesmtp.

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 Sagaert> ---
 Sagaert>  v2: Added more information in the help section of Config.in
 Sagaert>  v3: Fix license information
 Sagaert>  v4: Use the BR2_GNU_MIRROR

 Sagaert>  package/Config.in            |  1 +
 Sagaert>  package/libgsasl/Config.in   | 10 ++++++++++
 Sagaert>  package/libgsasl/libgsasl.mk | 14 ++++++++++++++
 Sagaert>  3 files changed, 25 insertions(+)
 Sagaert>  create mode 100644 package/libgsasl/Config.in
 Sagaert>  create mode 100644 package/libgsasl/libgsasl.mk

 Sagaert> diff --git a/package/Config.in b/package/Config.in
 Sagaert> index fcc2480..427b4db 100644
 Sagaert> --- a/package/Config.in
 Sagaert> +++ b/package/Config.in
 Sagaert> @@ -481,6 +481,7 @@ source "package/libdnet/Config.in"
 Sagaert>  source "package/libesmtp/Config.in"
 Sagaert>  source "package/libeXosip2/Config.in"
 Sagaert>  source "package/libfcgi/Config.in"
 Sagaert> +source "package/libgsasl/Config.in"
 Sagaert>  source "package/libidn/Config.in"
 Sagaert>  source "package/libiscsi/Config.in"
 Sagaert>  source "package/liboauth/Config.in"
 Sagaert> diff --git a/package/libgsasl/Config.in b/package/libgsasl/Config.in
 Sagaert> new file mode 100644
 Sagaert> index 0000000..b6fe02b
 Sagaert> --- /dev/null
 Sagaert> +++ b/package/libgsasl/Config.in
 Sagaert> @@ -0,0 +1,10 @@
 Sagaert> +config BR2_PACKAGE_LIBGSASL
 Sagaert> +	bool "libgsasl"
 Sagaert> +	help
 Sagaert> +	  Simple Authentication and Security Layer framework Library.
 Sagaert> +	  GNU SASL is an implementation of the Simple Authentication and 
 Sagaert> +	  Security Layer framework and a few common SASL mechanisms.
 Sagaert> +	  SASL is used by network servers (e.g., IMAP, SMTP) to request 
 Sagaert> +	  authentication from clients, and in clients to authenticate against servers.

Trailing spaces and too long lines. The help text should be visible in
make menuconfig without sideways scrolling on a normal 80 col terminal.

 Sagaert> +++ b/package/libgsasl/libgsasl.mk
 Sagaert> @@ -0,0 +1,14 @@
 Sagaert> +#############################################################
 Sagaert> +#
 Sagaert> +# libgsasl
 Sagaert> +#
 Sagaert> +#############################################################
 Sagaert> +LIBGSASL_VERSION = 1.8.0

We normally add an empty line after the header.

 Sagaert> +LIBGSASL_SOURCE = libgsasl-$(LIBGSASL_VERSION).tar.gz

This is default, so it can be removed.

 Sagaert> +LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 Sagaert> +LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
 Sagaert> +LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 Sagaert> +LIBGSASL_INSTALL_STAGING = YES
 Sagaert> +LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
 Sagaert> +
 Sagaert> +$(eval $(autotools-package))
 Sagaert> \ No newline at end of file

You forgot the final newline.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
