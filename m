From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 10:34:15 +0200
Subject: [Buildroot] [PATCH v3] package/libmicrohttpd: minor fixes and
	additions
In-Reply-To: <1372272580-26574-1-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Wed, 26 Jun 2013 20:49:40 +0200")
References: <1372272580-26574-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87fvw43qbc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:
h
 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Correcting the indentation inside Config.in. Also adding the missed
 Carsten> license information.

 Carsten> Note: libmicrohttpd is partialy dual licensed, if you don't need or want
 Carsten> to use the HTTPS option you can choose between LPGLv2.1+ and the eCos
 Carsten> license (http://ecos.sourceware.org/license-overview.html).
 Carsten> If you use the HTTPS option you have to agree to the LGPLv2.1+!

 Carsten> --- a/package/libmicrohttpd/libmicrohttpd.mk
 Carsten> +++ b/package/libmicrohttpd/libmicrohttpd.mk
 Carsten> @@ -6,13 +6,16 @@
 
 Carsten>  LIBMICROHTTPD_VERSION = 0.9.27
 Carsten>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 Carsten> +LIBMICROHTTPD_LICENSE_FILE = COPYING
 Carsten>  LIBMICROHTTPD_INSTALL_STAGING = YES
 
 Carsten>  ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 Carsten> +LIBMICROHTTPD_LICENSE = LGPLv2.1+
 Carsten>  LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
 Carsten>  LIBMICROHTTPD_CONF_OPT += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 Carsten> -			  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 Carsten> +						  --with-libgcrypt-prefix=$(STAGING_DIR)/usr

No need to indent this far. Other than that it looks good - Committed,
thanks.

-- 
Bye, Peter Korsgaard
