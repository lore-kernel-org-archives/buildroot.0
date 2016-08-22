From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Aug 2016 17:03:26 -0300
Subject: [Buildroot] [PATCH v2 1/1] configs/pc_x86_64_efi_defconfig:
 enable kernel EFI support
In-Reply-To: <20160822214915.6640-1-nunes.erico@gmail.com>
References: <20160822214915.6640-1-nunes.erico@gmail.com>
Message-ID: <16050e6bbc2142d807584f2514f517ee@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-08-22 18:49, Erico Nunes wrote:

> The pc_x86_64_efi reference defconfig is targeted towards an EFI
> environment but the kernel which comes with it does not enable EFI
> support by default.
> 
> Booting this defconfig without kernel EFI support on a qemu virtual
> machine with EFI firmware resulted in no output to tty1 or ttyS0.
> Enabling EFI support in the kernel fixed this and seems saner for an 
> EFI
> reference Buildroot defconfig.
> 
> Adding CONFIG_EFI to board/pc/linux-extras.config also affects
> pc_x86_64_bios_defconfig which doesn't require it, however it was
> observed that the extra overhead is small and so this is preferred
> rather than having a separate config file.
> 
> This was tested with qemu 2.6.0 running with kvm enabled and firmware
> EFI v2.60 by EDK II. Also built and verified bios defconfig on the same
> setup but with BIOS firmware instead.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
