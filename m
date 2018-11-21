From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 09:40:48 +0100
Subject: [Buildroot] [PATCH] package/wolfssl: bump to version 3.15.5
In-Reply-To: <20181120173801.15024-1-sergio.prado@e-labworks.com>
References: <20181120173801.15024-1-sergio.prado@e-labworks.com>
Message-ID: <20181121094048.4fc2e0c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergio,

On Tue, 20 Nov 2018 15:38:01 -0200, Sergio Prado wrote:
> Also enable ARMv8 hardware acceleration (tested with
> qemu_aarch64_virt_defconfig).

Could be done in two separate patches (bump and ARMv8 HW acceleration
enabling).

> -# build fails when ARMv8 hardware acceleration is enabled
> +# enable ARMv8 hardware acceleration
> +ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +WOLFSSL_CONF_OPTS += --enable-armasm CPPFLAGS=-mstrict-align

Why is -mstrict-align needed ? A comment above, or at least in the
commit log would be useful. Also, don't override CPPFLAGS like this,
something like that would be preferred:

WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
