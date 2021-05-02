From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 11:13:22 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: bump kernel version
 and update
In-Reply-To: <20210423082833.17674-1-vincent.stehle@arm.com>
References: <20210423082833.17674-1-vincent.stehle@arm.com>
Message-ID: <CAK4VdL0-jhUEtTnnYx-Fc_AdtxLBX5G6c2-Jz6KhBqXtpmUPzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 23, 2021 at 10:29 AM Vincent Stehl? <vincent.stehle@arm.com> wrote:
>
> - Bump kernel to version 5.11.16.
>
> We remove the hardcoded ttyAMA0 and rely on the firmware to discover our
> console. This enables serial console on systems, which do not have an Arm
> pl011 UART.
>
> We switch to GPT disklabel and discover our root filesystem using its
> PARTLABEL. This enables booting from more media, such as HDD, SD card or
> USB.
>
> We update the readme, which hinted that ACPI was mandatory. This is not
> strictly the case as we can also boot with a dtb and/or a U-Boot based
> firmware, with no ACPI. While at it, mention EBBR, SystemReady and explain
> how to build and use a U-Boot-based qemu firmware.
>
> Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> ---

These all look like good improvements to me.
I haven't tested the U-Boot based boot but overall the changes look
good and qemu UEFI still works as expected.

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>

Thanks

Erico
