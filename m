From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:37:41 +0200
Subject: [Buildroot] [PATCH 2/2] configs/pc_x86_64_efi_defconfig: enable
 kernel EFI support
In-Reply-To: <20160822015216.425-2-nunes.erico@gmail.com>
References: <20160822015216.425-1-nunes.erico@gmail.com>
 <20160822015216.425-2-nunes.erico@gmail.com>
Message-ID: <20160822163741.021a7577@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Added Gustavo in Cc, since he is the original author of this defconfig.

On Mon, 22 Aug 2016 03:52:16 +0200, Erico Nunes wrote:
> The pc_x86_64_efi reference defconfig is targeted towards an EFI
> environment but the kernel which comes with it does not enable EFI
> support by default.
> 
> Booting this defconfig without kernel EFI support on a qemu virtual
> machine with EFI firmware resulted in no output to tty1 or ttyS0.
> Enabling EFI support in the kernel fixed this and seems saner for an EFI
> reference Buildroot defconfig.
> 
> CONFIG_EFI was enabled in a separate kernel config fragment so that it
> doesn't affect pc_x86_64_bios_defconfig needlessly.
> 
> This was tested with qemu 2.6.0 running with kvm enabled and firmware
> EFI v2.60 by EDK II.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  board/pc/linux-efi.config       | 1 +
>  configs/pc_x86_64_efi_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 board/pc/linux-efi.config

Is a separate linux configuration fragment really needed? Why not just
enable CONFIG_EFI in the linux-extras.config?

Yes, it's technically not needed for a BIOS-based configuration, but
the added size is probably not very significant, and I'm not sure it's
worth having a separate linux config fragment for that.

Gustavo?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
