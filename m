From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 5 Nov 2018 13:52:12 +0100
Subject: [Buildroot] [PATCH v2 1/1] fwts: Enable optional efi_runtime
 kernel module build
In-Reply-To: <1541419404-28044-1-git-send-email-sumit.garg@linaro.org>
References: <1541419404-28044-1-git-send-email-sumit.garg@linaro.org>
Message-ID: <CAK4VdL3nJOVgqLhRD4X700wf0oPFhp4C2_pjbNLXpXoq=cjWEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 5, 2018 at 1:03 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Firmware test suite does provides efi_runtime kernel module required
> to run UEFI tests. So optionally enable this module build.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> 1. Keep efi_runtime config option inside if block.
> 2. Remove linux dependency as $(kernel-module) takes care of this.
> 3. Correct placement of config and $(kernel-module) blocks.

v2 looks good to me and I gave it a quick test, seems to work fine.

> +config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> +       bool "efi_runtime module"
> +       depends on BR2_LINUX_KERNEL
> +       help
> +         Firmware Test Suite (FWTS) also provides EFI runtime kernel
> +         module required to run UEFI tests.
> +
> +comment "efi-runtime module needs a Linux kernel to be built"
> +       depends on !BR2_LINUX_KERNEL

These efi_runtime and efi-runtime strings should at least be
consistent in the menu, either with dash or underscore. If nobody has
other issues, maybe this can be fixed while applying?

Other than that:

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
