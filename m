From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 13:36:14 +0200
Subject: [Buildroot] [PATCH v2] configs/pc_x86_64_efi: add GPT partition
 table support.
In-Reply-To: <20190922000323.12025-1-unixmania@gmail.com>
References: <20190922000323.12025-1-unixmania@gmail.com>
Message-ID: <20190922133614.008bf16f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

Thanks for following up on this.

On Sat, 21 Sep 2019 21:03:23 -0300
unixmania at gmail.com wrote:

> -cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
> +# Detect boot strategy, EFI or BIOS
> +if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
> +    cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
> +else
> +    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
> +
> +    # Copy grub 1st stage to binaries, required for genimage
> +    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
> +fi
> +
> +#cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"

Do we need to keep this commented line ?

>  
>  # Copy grub 1st stage to binaries, required for genimage
> -cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
> +#cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"

Here as well, and the comment above ?

Note: no need to respin just for this, I can fixup when applying, just
let me know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
