From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 23:10:48 +0200
Subject: [Buildroot] [PATCH 0/8] Introduce EDK2 firmware builds
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200720231048.35f0aa60@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dick,

On Sun, 19 Jul 2020 18:08:13 +0000
Dick Olsson <hi@senzilla.io> wrote:

> One of the main reasons one would use EDK2 and UEFI on a AArch64 is for
> different standards compliance scenarios. The most prevalent standards in this
> space are:
> 
> * Server Base System Architecture (SBSA) for hardware platforms
> * Server Base Boot Requirement (SBBR) for bootloader firmware
> 
> This series introduces a new generic SBSA board called aarch64-sbsa which can
> be used by any configuration providing SBBR firmware.
> 
> Three of the four configurations in this series implement SBBR firmware:
> 
> 1. aarch_efi_defconfig: EDK2 as stand-alone flash device for QEMU Virt
> 2. qemu_aarch64_virt_sbbr_defconfig: EDK2 as ATF BL33 for QEMU Virt
> 3. qemu_aarch64_sbsa_sbbr_defconfig: EDK2 as ATF BL33 for QEMU SBSA
> 4. arm_foundationv8_sbbr_defconfig: EDK2 as ATF BL33 for ARM FVP

I must say my knowledge of SBBR/SBBA is very limited, but I'm confused
by the addition of all those configurations.

First of all, Buildroot doesn't really have a concept of a "board"
separated from a defconfig. It seems like you believe you have created
the support for a board by creating board/aarch64-sbsa/, but really the
support for a board in Buildroot is mainly a defconfig. So here, you
have adjusted one board configuration and created 3 new ones.

What is the Qemu SBSA platform compared to the QEMU Virt one ? Why
would we want qemu_aarch64_virt_sbbr_defconfig and
qemu_aarch64_sbsa_sbbr_defconfig ?

What makes these platform Qemu specific ? The fact that we do build
EDK2, which is the firmware, and therefore is obviously
board/platform-specific ? If that's the case how is EDK2 useful on the
aarch64_efi case, which is a cross-platform defconfig that should work
on any EFI-capable AArch64 system ?

I know, lots of questions there. Just trying to figure out how things
work, and what is the most relevant for Buildroot to handle this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
