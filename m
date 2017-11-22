From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:33:36 +0100
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171122041747.11363-1-yurovsky@gmail.com>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
Message-ID: <20171122213336.52a3e196@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 20:17:47 -0800, Andrey Yurovsky wrote:

> -RAUC_VERSION = 0.1.1
> +RAUC_VERSION = 0.2
>  RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>  RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>  RAUC_LICENSE = LGPL-2.1
> @@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  RAUC_DEPENDENCIES += systemd
>  endif
>  
> -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
>  HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service

Another question about this dependency: how is it possible that
host-squashfs is a runtime dependency of the host variant of rauc, but
that squashfs is not a runtime dependency of the target variant of
rauc ?

I can imagine that host-mksquashfs is needed by host-rauc to prepare
some filesystem image. But how does the target build of RAUC know that
it doesn't need mksquashfs ?

Is host-mksquashfs always needed by host-rauc, or only under certain
conditions/configurations ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
