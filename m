From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 21:46:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] ti-gfx: bump to version 5_01_01_01
 if EABIhf is used
In-Reply-To: <1402427667-26813-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1402427667-26813-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140610214610.03f16f6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Tue, 10 Jun 2014 21:14:27 +0200, Hadrien Boutteville wrote:

> +# SDK 5_01_01_01 only support EABIhf so we downgrade to 5_01_00_01 if we can't
> +# use it.

The wording is a bit confusing here: you say that "we downgrade to
5_01_00_01 if we can't use it", which to me doesn't make much sense, as
we downgrade to something we can't use :-)

>  ifeq ($(BR2_ARM_EABIHF),y)
> +TI_GFX_VERSION = 5_01_01_01
>  TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
>  else
> +TI_GFX_VERSION = 5_01_00_01
>  TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
>  endif
>  
> +TI_GFX_SO_VERSION = 1.10.2359475

Is the TI_GFX_SO_VERSION the same between both versions of ti-gfx?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
