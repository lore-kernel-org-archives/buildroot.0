From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 12:40:57 +0200
Subject: [Buildroot] [PATCH v4 03/10] boot/arm-trusted-firmware:
 Integrate with EDK2 as BL33 payload
In-Reply-To: <THvwh6tvDv2RUIT2KB06w1XqxT1MFcniyo1ZGjAfE@cp3-web-012.plabs.ch>
References: <THvwh6tvDv2RUIT2KB06w1XqxT1MFcniyo1ZGjAfE@cp3-web-012.plabs.ch>
Message-ID: <CAK4VdL3smOoRdUaR5TZMDiyeSRQ+Zb3ChR9ShYb9LCkhLU30Cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 18, 2021 at 4:51 PM Dick Olsson via buildroot
<buildroot@busybox.net> wrote:
>
> Support the use of EDK2 UEFI payloads as BL33 in ARM Trusted Firmware.
> This integrates with the newly introduced boot/edk2 package.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  boot/arm-trusted-firmware/Config.in               | 13 +++++++++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  9 +++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index b11dd67931..9d347550a4 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -135,6 +135,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
>
>  endif
>
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +       bool "Use EDK2 as BL33"
> +       depends on BR2_TARGET_EDK2

I think this patch should be merged with the EDK2 one. Otherwise there
is sort of a deadlock of what comes first, with that patch referencing
a non-existing BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33 and this
one referencing BR2_TARGET_EDK2.
