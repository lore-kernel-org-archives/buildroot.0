From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:02:40 +0100
Subject: [Buildroot] [PATCH 3/3] package/aubio: disable unit tests with
 --notests
In-Reply-To: <1480885126-517-3-git-send-email-romain.naour@gmail.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204220240.408ea3ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 21:58:46 +0100, Romain Naour wrote:

>  AUBIO_CONF_OPTS = \
>  	--disable-docs \
> -	--disable-atlas
> +	--disable-atlas \
> +	--notests
> +
> +# Add --notests for each build step to avoid runing unit tests on the
> +# build machine.
> +AUBIO_MAKE_OPTS = --notests
> +AUBIO_INSTALL_STAGING_OPTS = --notests
> +AUBIO_INSTALL_TARGET_OPTS = --notests

The <pkg>_MAKE_OPTS, <pkg>_INSTALL_STAGING_OPTS and
<pkg>_INSTALL_TARGET_OPTS do not exist in the waf-package
infrastructure, so those lines are no-ops I believe. It seems like
passing --notests at configure time is sufficient.

Could you double check this?

(Other than that, great to see that there is no need for a patch!)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
