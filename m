From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 10:06:23 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure due to
 HW PPC Crypto bug
In-Reply-To: <20200101165811.45110-1-giulio.benetti@benettiengineering.com>
References: <20200101163258.13c7de62@windsurf>
 <20200101165811.45110-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200102100623.6ab6714b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

Thanks for the patch. One comment below.

On Wed,  1 Jan 2020 17:58:11 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>  ifeq ($(BR2_aarch64_be),y)
>  LIBNSS_ARCH = aarch64
> +else ifeq ($(BR2_powerpc),y)
> +LIBNSS_ARCH = ppc
> +else ifeq ($(BR2_powerpc64),y)
> +LIBNSS_ARCH = ppc64
> +else ifeq ($(BR2_powerpc64le),y)
> +LIBNSS_ARCH = ppc64le
>  else
>  LIBNSS_ARCH = $(ARCH)
>  endif

Shouldn't we globally review the values that libnss wants for the
OS_TEST variable (which we set to $(LIBNSS_ARCH)) and see if other
architectures need similar tweaks ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
