From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Sep 2018 13:24:07 +0200
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <6c81203c-261c-8525-1fda-5da1074db56e@embecosm.com>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
 <6c81203c-261c-8525-1fda-5da1074db56e@embecosm.com>
Message-ID: <20180904132407.08be2dc1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Sep 2018 11:03:22 +0100, Mark Corbin wrote:

> There is a name clash with using GCC_TARGET_* - some of these names are
> already used in packages/gcc/gcc.mk.
> 
> GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))

Well, just get rid of this line, since it's now going to be in
arch/arch.mk.

> ifneq ($(GCC_TARGET_FPU),)
> HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
> endif
> 
> GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))

Ditto.

> ifneq ($(GCC_TARGET_FLOAT_ABI),)
> HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
> endif
> 
> GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))

Ditto.

> ifneq ($(GCC_TARGET_MODE),)
> HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
> endif
> 
> Anybody have any thoughts for a new prefix for either set of variables?

Not needed: the whole idea of the change is to move those line setting
GCC_TARGET_* variables from package/gcc/ to arch/arch.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
