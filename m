From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 27 Jul 2020 17:30:56 +0200
Subject: [Buildroot] [PATCH v2 3/6] configs/aarch64_efi_defconfig: build
 the EDK2 firmware from source
In-Reply-To: <20200726100541.7710-4-hi@senzilla.io>
References: <20200726100541.7710-4-hi@senzilla.io>
Message-ID: <CAK4VdL04sb1yG0wATrkikbgQSrjMzSEWCicED=6MZD+iTAxFBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jul 26, 2020 at 12:07 PM D. Olsson <hi@senzilla.io> wrote:
>
> From: Dick Olsson <hi@senzilla.io>
>
> Prior to this, you had to manually download a pre-built EDK2 flash device
> image (QEMU_EFI.fd) in order to boot this configuration with QEMU.
> Now, the configuration is building EDK2 from source.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
>
> ---
>
> Revision 2:
>
>  * Explicitly added the default EDK2 platform to defconfig
> ---
>  board/aarch64-efi/readme.txt  | 8 +++-----
>  configs/aarch64_efi_defconfig | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
> index 65a6345b6c..08747027e1 100644
> --- a/board/aarch64-efi/readme.txt
> +++ b/board/aarch64-efi/readme.txt
> @@ -22,13 +22,11 @@ qemu-system-aarch64 \
>         -cpu cortex-a57 \
>         -m 512 \
>         -nographic \
> -       -bios </path/to/QEMU_EFI.fd> \
> +       -bios output/images/QEMU_EFI.fd \
>         -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \

Should we change this to point to the QEMU_VARS file too as was done
in patch 4 for board/pc/readme.txt ?

Otherwise looks good, I tested it and it works for me.
