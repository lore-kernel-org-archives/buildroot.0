From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:51:24 +0200
Subject: [Buildroot] [PATCH] package/boost: disable for cortex-M cpus
In-Reply-To: <1470157264-9693-1-git-send-email-romain.naour@gmail.com>
References: <1470157264-9693-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160802225124.14148e58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 19:01:04 +0200, Romain Naour wrote:
> Triggers compiler error:
> libs/context/src/asm/make_arm_aapcs_elf_gas.S: Assembler messages:
> libs/context/src/asm/make_arm_aapcs_elf_gas.S:33: Error: unshifted register required -- `bic a1,a1,#15'

This is ARM assembly, which indeed doesn't build on Thumb-2 only
platforms.

> +	depends on ((BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV7M) || \

So I believe BR2_ARM_CPU_HAS_ARM is more correct
than !BR2_ARM_CPU_ARMV7M even though both have currently exactly the
same meaning.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
