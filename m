From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:28:26 +0200
Subject: [Buildroot] [PATCH 3/4] configs/qemu_aarch64_virt_defconfig:
 boot with grub bootloader with efi
In-Reply-To: <20200712163422.1162187-3-romain.naour@gmail.com>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
 <20200712163422.1162187-3-romain.naour@gmail.com>
Message-ID: <20200712212826.4025d0d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Jul 2020 18:34:21 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
> tables are missing and the plug and play support is disabled.
> 
> dmesg:
> ACPI: Interpreter disabled.
> [...]
> pnp: PnP ACPI: disabled
> 
> The ACPI support is already available in the kernel defconfig, the
> memory hotplug support will be added by the next patch.
> 
> Borrow the post image script, genimage and bootloader configuration from
> aarch64_efi_defconfig to build the disk image used to boot the system
> in efi mode.
> 
> As a side effect, the bootloader grub2 is now runtime tested in the
> Buildroot gitlab-ci while testing this defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

But isn't this making qemu_aarch64_virt_defconfig too similar to
aarch64_efi_defconfig ?

Shouldn't we keep qemu_aarch64_virt_defconfig as-is, and simply add
runtime testing for aarch64_efi_defconfig ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
