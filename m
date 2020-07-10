From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Jul 2020 01:02:01 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
Message-ID: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico, All,

I would like to rename the aarch64_efi_defconfig to
qemu_aarch64_virt_efi_defconfig  in order to do a runtime test in the Buildroot
gitlab-ci.

See the gitlab-ci job for the qemu_aarch64_virt_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/623442197

Note: There is no ACPI table while booting the kernel built with
qemu_aarch64_virt_defconfig since there is no bootloader.

But we need to build or download the aarch64 UEFI firmware image (QEMU_EFI.fd)
also called Open Virtual Machine Firmware (OVMF).

Building QEMU_EFI.fd would require to package Tianocore's edk2 [1] for the host
and deal with the specific buildsystem (bash + Makefiles).

But since it's only for testing, I'm wondering if we should use a prebuilt
QEMU_EFI.fd instead building it.

I propose to use the one provided by Linaro [2] that is periodically released
(~once a year) and probably well tested.

What do you think?

[1] https://github.com/tianocore/edk2.git
[2]
http://releases.linaro.org/reference-platform/enterprise/firmware/open-source/19.03/

Best regards,
Romain
