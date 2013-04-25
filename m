From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 15:50:24 +0200
Subject: [Buildroot] [PATCH 1/2] wvstreams: new package
In-Reply-To: <1366881542-15350-2-git-send-email-spdawson@gmail.com>
References: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
 <1366881542-15350-2-git-send-email-spdawson@gmail.com>
Message-ID: <20130425155024.7142922d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

This one looks good. Just a few questions below.

On Thu, 25 Apr 2013 10:19:01 +0100, spdawson at gmail.com wrote:

> diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
> new file mode 100644
> index 0000000..341fc09
> --- /dev/null
> +++ b/package/wvstreams/wvstreams.mk
> @@ -0,0 +1,51 @@
> +#############################################################
> +#
> +# wvstreams
> +#
> +#############################################################
> +
> +WVSTREAMS_VERSION = 4.6.1
> +WVSTREAMS_SITE = http://wvstreams.googlecode.com/files
> +WVSTREAMS_DEPENDENCIES = openssl zlib

openssl/zlib dependencies are mandatory here...

> +WVSTREAMS_INSTALL_STAGING = YES
> +
> +WVSTREAMS_LICENSE = LGPLv2+
> +WVSTREAMS_LICENSE_FILES = LICENSE
> +
> +# N.B. parallel make fails
> +WVSTREAMS_MAKE = $(MAKE1)
> +
> +# Needed to work around problem with wvassert.h
> +WVSTREAMS_CONF_OPT += CPPFLAGS=-DNDEBUG
> +
> +WVSTREAMS_CONF_OPT += --with-openssl --with-zlib --without-pam

but this seems to suggest that openssl/zlib support is not mandatory.
Can we make this optional if it's possible?

Other than that, it looks good to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
