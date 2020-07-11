From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 12:59:19 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
In-Reply-To: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
References: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
Message-ID: <20200711125919.6e484aef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 01:02:01 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> I would like to rename the aarch64_efi_defconfig to
> qemu_aarch64_virt_efi_defconfig  in order to do a runtime test in the Buildroot
> gitlab-ci.

The thing is that the idea of the aarch64_efi_defconfig is that it is a
generic AArch64 image that should work on all EFI compliant AArch64
systems, not just Qemu.

Renaming it with a "qemu_" prefix kind of losses that implicit
"documentation" that it is a generic AArch64 configuration.

If your goal is to have this defconfig tested under Qemu, then I would
rather suggest that we improve the logic that decides which defconfig
can be tested under Qemu, and not just rely on a qemu_ prefix, but
maybe some kind of explicit list ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
