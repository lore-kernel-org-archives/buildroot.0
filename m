From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 May 2020 14:47:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to
 enable some features
In-Reply-To: <20200511112840.634268-2-erwan.gautron@bertin.fr>
References: <20200511112840.634268-1-erwan.gautron@bertin.fr>
 <20200511112840.634268-2-erwan.gautron@bertin.fr>
Message-ID: <20200511144711.04ae03e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Erwan,

On Mon, 11 May 2020 13:28:40 +0200
Erwan GAUTRON <erwan.gautron@bertin.fr> wrote:

>  package/libopenssl/Config.in     | 151 +++++++++++++++++++++++++++++++
>  package/libopenssl/libopenssl.mk |  25 +++++
>  2 files changed, 176 insertions(+)

Thanks for this new iteration!

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
> +	bool "enable openssl CHACHA "
> +	default y
> +	help
> +	  Enable CHACHA cipher in libopenssl.

The "in openssl" part of each help text is not really useful, as these
are suboptions of libopenssl already.

> +config BR2_PACKAGE_LIBOPENSSL_UNSECURE
> +	bool "enable unit test, debug, backtrace"
> +	default y
> +	help
> +	  Enable unit-test crypto-mdebug-backtrace crypto-mdebug autoerrinit mode in libopenssl.

This line is too long, "make check-package" most likely complains about
this.

> +config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
> +	bool "enable openssl dynamic engine"
> +	default y
> +	help
> +	  Enable dynamic engine in libopenssl.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_IPV6
> +	bool "enable openssl IPV6"
> +	default y
> +	help
> +	  Enable IPV6 in libopenssl.

Is it really useful to make IPv6 optional? Is that necessary for your
certification? IPv6 used to be optional in Buildroot in general, and we
got rid of that several years ago, so reintroducing IPv6 options will
really need some good jusitification.

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
> +	bool "enable openssl compression"
> +	default y
> +	help
> +	  Enable compression in libopenssl.

So you dropped the zlib option? Why?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
