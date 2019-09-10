From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Sep 2019 07:26:56 +0300
Subject: [Buildroot] [PATCH 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190910023753.51911-2-matthew.weber@rockwellcollins.com>
References: <20190910023753.51911-1-matthew.weber@rockwellcollins.com>
 <20190910023753.51911-2-matthew.weber@rockwellcollins.com>
Message-ID: <20190910042656.xt3ind6q2vjnvs7o@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, Sep 09, 2019 at 09:37:53PM -0500, Matt Weber wrote:
> -RNG_TOOLS_VERSION = 5
> -RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
> +RNG_TOOLS_VERSION = 6.7
> +RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>  RNG_TOOLS_LICENSE = GPL-2.0
>  RNG_TOOLS_LICENSE_FILES = COPYING
> +RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library
> +
> +# configure is missing but pkg seems to not be compatible with our autoreconf
> +# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES

GPM? Just say "autoreconf".

baruch

> +define RNG_TOOLS_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +RNG_TOOLS_PRE_CONFIGURE_HOOKS += RNG_TOOLS_RUN_AUTOGEN

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
