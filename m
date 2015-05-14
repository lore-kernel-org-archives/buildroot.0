From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 May 2015 23:14:44 +0200
Subject: [Buildroot] [git commit] libupnpp: fix static linking issue
 with libcurl
In-Reply-To: <20150514210426.753DC800DE@busybox.osuosl.org>
References: <20150514210426.753DC800DE@busybox.osuosl.org>
Message-ID: <20150514231444.4ea9a128@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 14 May 2015 22:44:06 +0200, Peter Korsgaard wrote:

>  # configure script fails to link against the dependencies of libupnp
> -# causing upnp detection to fail when statically linking
> +# and libcurl causing detection to fail when statically linking
>  ifeq ($(BR2_STATIC_LIBS),y)
> -LIBUPNPP_CONF_ENV += LIBS='-lthreadutil -lixml -pthread'
> +LIBUPNPP_DEPENDENCIES += host-pkgconf
> +LIBUPNPP_CONF_ENV += \
> +	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl)'
>  endif

I'm glad to see that we're moving away from a hardcoded LIBS value to
using pkg-config :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
