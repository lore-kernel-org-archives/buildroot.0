From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2011 23:51:45 +0200
Subject: [Buildroot] [PATCHv2] toolchain: fix build with empty
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
In-Reply-To: <0056cd290aa1be1559ccdd6b3877927fe51ecbe0.1317023087.git.baruch@tkos.co.il>
References: <0056cd290aa1be1559ccdd6b3877927fe51ecbe0.1317023087.git.baruch@tkos.co.il>
Message-ID: <20110927235145.544b91ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

Le Mon, 26 Sep 2011 10:48:57 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> The "" string is not equal to the empty string. This fixes build
> errors like:
> 
> arm-none-linux-gnueabi-gcc: : No such file or directory
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

For some reason, your patch does not seem to apply on current master.

>  # march/mtune/floating point mode needs to be passed to the external toolchain
>  # to select the right multilib variant
> -ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
> +TOOLCHAIN_EXTERNAL_CUSTOM_ARGS = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS))
> +ifneq ($(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
>  TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'

Should be use TOOLCHAIN_EXTERNAL_CUSTOM_ARGS in these two lines
instead ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
