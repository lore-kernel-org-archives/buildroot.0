From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 15:49:39 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
In-Reply-To: <CAK4VdL3Jn_zNH3XuLfCTbzTVG=JDjDNk1=r1CivOgNQ64=3aAw@mail.gmail.com>
References: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
 <20200711125919.6e484aef@windsurf.home>
 <39be97c6-9569-e206-ebe5-a49ca65015af@gmail.com>
 <20200711151214.44b2b74a@windsurf.home>
 <8869dfef-7cd1-999a-5b34-bc319dce218b@gmail.com>
 <CAK4VdL3Jn_zNH3XuLfCTbzTVG=JDjDNk1=r1CivOgNQ64=3aAw@mail.gmail.com>
Message-ID: <20200715154939.4f3ffc2c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 15:18:28 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> as you already mentioned, the original intent of aarch64_efi_defconfig
> is to be used with standards compliant aarch64 systems running
> ACPI/UEFI. It is analogous to the pc_* defconfigs for x86_64.
> There is a short documentation on it at
> https://git.buildroot.net/buildroot/tree/board/aarch64-efi/readme.txt
> where the need for OVMF is mentioned.
> That was a manual example though as it requires users to pull OVMF
> from the distribution. If there are plans to turn it into an automated
> test, then indeed it would be better to have a Buildroot provided one
> and this readme can also be updated.

Romain has already submitted a patch series that adds a package for
edk2, in a precompiled form. I don't know if you have been Cc'ed on
that.

> > >> Instead of renaming aarch64_efi_defconfig, we can enable UEFI and grub in the
> > >> qemu_aarch64_virt_defconfig itself.  
> 
> Probably needs ACPI support in the kernel config as well, and be
> booted with acpi=on as device tree is probably the default in upstream
> kernels in case both are available.
> 
> > >
> > > Seems like a good idea.  
> >
> > Ok  
> 
> Just to double check, wouldn't it be the case to have 2 qemu configs,
> one to test the ACPI/UEFI+grub2 profile and another one for the qemu
> direct kernel boot?
> If qemu_aarch64_virt_defconfig gets converted to that (which is a
> little more complex and I believe less used with Buildroot), then only
> that would get the automated testing coverage.

But we already have 2 defconfigs:

 - qemu_aarch64_virt_defconfig, which IMO should stay pretty much as it
   is: directly kernel boot

 - aarch64_efi_defconfig, which should be usable by EFI/ACPI compliant
   platform, and Qemu should be one of them.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
