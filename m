From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 23:58:19 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: disable spinlock support
 for riscv64
In-Reply-To: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
References: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
Message-ID: <20181020235819.42a5206b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Mark Corbin in Cc.

On Sat, 20 Oct 2018 22:22:19 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/deebc4b8f615e1216279d6587e91f5654da2ad68
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

> -ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_xtensa),y)
> +ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_RISCV_64)$(BR2_xtensa),y)

Any reason for doing that only for riscv64 and not for RISC-V
entirely ? Does PostgreSQL has a spinlock implementation for RISC-V 32
but not RISC-V 64 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
