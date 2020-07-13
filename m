From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jul 2020 23:21:54 +0200
Subject: [Buildroot] [PATCH 3/4] configs/qemu_aarch64_virt_defconfig:
 boot with grub bootloader with efi
In-Reply-To: <20200712212826.4025d0d5@windsurf.home>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
 <20200712163422.1162187-3-romain.naour@gmail.com>
 <20200712212826.4025d0d5@windsurf.home>
Message-ID: <daaa32d9-5da6-84c6-3546-6abb04542530@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 12/07/2020 ? 21:28, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun, 12 Jul 2020 18:34:21 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
>> tables are missing and the plug and play support is disabled.
>>
>> dmesg:
>> ACPI: Interpreter disabled.
>> [...]
>> pnp: PnP ACPI: disabled
>>
>> The ACPI support is already available in the kernel defconfig, the
>> memory hotplug support will be added by the next patch.
>>
>> Borrow the post image script, genimage and bootloader configuration from
>> aarch64_efi_defconfig to build the disk image used to boot the system
>> in efi mode.
>>
>> As a side effect, the bootloader grub2 is now runtime tested in the
>> Buildroot gitlab-ci while testing this defconfig.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> But isn't this making qemu_aarch64_virt_defconfig too similar to
> aarch64_efi_defconfig ?

Well, that why I suggested to merge the two defconfig. But I'm fine having two
defconfig for different purpose.

> 
> Shouldn't we keep qemu_aarch64_virt_defconfig as-is, and simply add
> runtime testing for aarch64_efi_defconfig ?

I would like to continue enabling features in the qemu_aarch64_virt_defconfig
and some of them require ACPI support. That is why I borrowed the post-image
script, grub defconfig from aarch64_efi_defconfig and packaged the edk2-bin.

If we start enabling qemu runtime testing for other defconfig that the one named
qemu_* we could continue (for example) test the nitrogen6x_defconfig with
qemu-system-arm -M sabrelite. This can be interesting :)

For now, I would like to focus on qemu_* defconfigs.

Best regards,
Romain

> 
> Thomas
> 
