From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Feb 2019 00:19:17 +0100
Subject: [Buildroot] [PATCH v2,2/2] package/madplay: fix static build
In-Reply-To: <20190216134017.3083-2-fontaine.fabrice@gmail.com>
References: <20190216134017.3083-1-fontaine.fabrice@gmail.com>
 <20190216134017.3083-2-fontaine.fabrice@gmail.com>
Message-ID: <b381e2c2-59e2-1d0b-af87-568e440877a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/02/2019 14:40, Fabrice Fontaine wrote:
> Add a patch to use pkg-config to find id3tag dependency (-lz)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5e4882ddacf205a92a3ff1e79649cf16e4b6c0ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

[snip]
>  # Force autoreconf to be able to use a more recent libtool script, that
>  # is able to properly behave in the face of a missing C++ compiler.

 I've extended this comment to refer to the new patch.

 Regards,
 Arnout

> @@ -18,7 +18,7 @@ MADPLAY_AUTORECONF = YES
>  # ./configure can find alsa-lib.
>  ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
>  MADPLAY_CONF_OPTS += --with-alsa
> -MADPLAY_DEPENDENCIES += host-pkgconf alsa-lib
> +MADPLAY_DEPENDENCIES += alsa-lib
>  MADPLAY_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs alsa`"
>  endif
>  
> 
