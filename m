From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 20:32:51 +0200
Subject: [Buildroot] [PATCH 1/2] boot/riscv-pk: add generation of binary
 bbl file
In-Reply-To: <20190414134307.24754-1-mark.corbin@embecosm.com>
References: <20190414134307.24754-1-mark.corbin@embecosm.com>
Message-ID: <7e1dabb0-35e1-8783-9cdc-e4a793afdc45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 15:43, Mark Corbin wrote:
> In order to support the SiFive HiFive Unleashed board we need to
> generate a binary bootloader file ready for writing to an SD card.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  boot/riscv-pk/riscv-pk.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
> index 0ab5879ee4..f32d96ed3a 100644
> --- a/boot/riscv-pk/riscv-pk.mk
> +++ b/boot/riscv-pk/riscv-pk.mk
> @@ -26,7 +26,9 @@ define RISCV_PK_BUILD_CMDS
>  endef
>  
>  define RISCV_PK_INSTALL_IMAGES_CMDS
> +	$(TARGET_OBJCOPY) -S -O binary $(@D)/build/bbl $(@D)/build/bbl.bin

 It's a small nit, but it would be better to do this as part of the BUILD_CMDS.

 Regards,
 Arnout

>  	$(INSTALL) -D -m 0755 $(@D)/build/bbl $(BINARIES_DIR)/bbl
> +	$(INSTALL) -D -m 0755 $(@D)/build/bbl.bin $(BINARIES_DIR)/bbl.bin
>  endef
>  
>  $(eval $(generic-package))
> 
