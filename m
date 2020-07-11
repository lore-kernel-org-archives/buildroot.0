From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Jul 2020 15:34:16 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
In-Reply-To: <20200711151214.44b2b74a@windsurf.home>
References: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
 <20200711125919.6e484aef@windsurf.home>
 <39be97c6-9569-e206-ebe5-a49ca65015af@gmail.com>
 <20200711151214.44b2b74a@windsurf.home>
Message-ID: <8869dfef-7cd1-999a-5b34-bc319dce218b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/07/2020 ? 15:12, Thomas Petazzoni a ?crit?:
> On Sat, 11 Jul 2020 15:08:27 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Not really just testing this defconfig under Qemu, but having ACPI tables and
>> other features enabled by EFI and grub when booting the system under Qemu.
>>
>> The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
>> tables are missing and the plig and play support is disabled.
>>
>> dmesg:
>> ACPI: Interpreter disabled.
>> [...]
>> pnp: PnP ACPI: disabled
>>
>> For example, ACPI and hotplug support is required to use QEMU Virtual NVDIMM
>>
>> -device nvdimm,id=nvdimm1,memdev=mem1
>>
>> Instead of renaming aarch64_efi_defconfig, we can enable UEFI and grub in the
>> qemu_aarch64_virt_defconfig itself.
> 
> Seems like a good idea.

Ok

> 
>> But it still require the QEMU_EFI.fd firmware, either built by
>> Buildroot (complex hand written build system) or fetched from Linaro.
> 
> Of course, it's always better to build things from source, but if it's
> really too horrible, we can have a package that fetches pre-compiled
> binaries from Linaro.

I'm agree, but I would like to avoid to spent too much time on it while it
already available from Linaro.

I suggest to call the package providing the prebuilt QEMU_EFI.fd "ovmf-bin" and
latter add the "ovmf" package to build it from source (like the rust packaging
does with "rust", "rustc" and "rust-bin").

Best regards,
Romain

> 
> Thomas
> 
