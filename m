From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Oct 2018 22:04:13 +0200
Subject: [Buildroot] [PATCH 1/2] spandsp: fix static build with jpeg
 enabled
In-Reply-To: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
References: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
Message-ID: <20181012220413.3cbd3d90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 07:39:50 +0300, Baruch Siach wrote:

> -SPANDSP_DEPENDENCIES = tiff
> +SPANDSP_DEPENDENCIES = tiff host-pkgconf
>  SPANDSP_INSTALL_STAGING = YES
> +SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"

I have to say I continue to dislike such hacks, and would very much
prefer a change to the package configure.ac script to use pkg-config
directly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
