From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 12:43:02 +0200
Subject: [Buildroot] [PATCH v4 06/10]
 configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref
In-Reply-To: <Z9iNUXrUAMThOadKFwRuahfxRG9iic9FRPGkCxl3PE@cp3-web-016.plabs.ch>
References: <Z9iNUXrUAMThOadKFwRuahfxRG9iic9FRPGkCxl3PE@cp3-web-016.plabs.ch>
Message-ID: <CAK4VdL02XD79E_RFONL=vJW1AN53j_HunCCUiYhzR-P_qDF2ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 18, 2021 at 4:52 PM Dick Olsson via buildroot
<buildroot@busybox.net> wrote:
>
> This introduces a configuration for the SBSA reference machine under
> QEMU that is intended for developing and testing firmware. It consists
> of ATF that load EDK2 as BL33 which in turn will load the kernel in EFI
> stub mode with ACPI.

It confuses me a bit that there are so many defconfigs for qemu now.
This one seems like a good addition if it is maintianed as a reference
machine that follows SBSA, but if we have it, do we still really need
qemu_aarch64_virt_efi_defconfig in Buildroot?

> +Emulation
> +=========
> +
> +Run the emulation with:
> +
> +  output/host/bin/qemu-system-aarch64 \
> +    -M sbsa-ref \
> +    -cpu cortex-a57 \
> +    -smp 4 \
> +    -m 1024 \
> +    -nographic \
> +    -pflash output/images/SBSA_FLASH0.fd \
> +    -pflash output/images/SBSA_FLASH1.fd \
> +    -hda output/images/disk.img

It looks like all readme.txt reference qemu-system-* without the
output/host/bin/ path, so I think that the new ones in this patchset
should do that too at least for consistency.
