From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:35:53 +0100
Subject: [Buildroot] [git commit master 1/1] openssl: add ocf support
In-Reply-To: <20110117214924.564878A3BF@busybox.osuosl.org>
References: <20110117214924.564878A3BF@busybox.osuosl.org>
Message-ID: <20110124173553.61328a62@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Jan 2011 22:27:41 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> +define OPENSSL_INSTALL_CRYPTODEV_H
> +$(INSTALL) -D package/openssl/ocf-cryptodev-20101223.h \
> +	$(STAGING_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +OPENSSL_POST_EXTRACT_HOOKS += OPENSSL_INSTALL_CRYPTODEV_H
> +endif

This is not a problem today, but it will break horribly when we'll try
to merge the packaging work from Lionel, because here we are installing
a file to the $(STAGING_DIR) outside of a package staging installation
step.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
