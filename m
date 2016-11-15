From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 23:31:36 +0100
Subject: [Buildroot] [PATCH] package/tremor: fix build with Thumb only
 ARM archs
In-Reply-To: <20161115204658.14288-1-joerg.krause@embedded.rocks>
References: <20161115204658.14288-1-joerg.krause@embedded.rocks>
Message-ID: <20161115233136.63503880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 21:46:58 +0100, J?rg Krause wrote:
> Some ARM architectures like ARNv7-M only supports Thumb instructions,

ARNv7 -> ARMv7

> +ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
> +TREMOR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
> +else
> +TREMOR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -U_ARM_ASSEM_"
> +endif

I would have preferred a better solution than this, with a patch to
configure.in, to add the appropriate autoconf checks to decide whether
or not the optimized ARM code should be used or not.

However, consider the fact that the upstream Tremor project seems more
or less dead, it means there is very little chance to get our patches
merged upstream. So your simple solution is good enough.

Therefore: applied to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
