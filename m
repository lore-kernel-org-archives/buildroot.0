From: D. Olsson <hi@senzilla.io>
Date: Fri, 31 Jul 2020 12:00:26 +0000
Subject: [Buildroot] [PATCH v2 5/6] boot/arm-trusted-firmware: add EDK2
 as BL33 option
In-Reply-To: <20200727082444.GB1615@curiosity>
References: <20200726100541.7710-6-hi@senzilla.io>
 <20200727082444.GB1615@curiosity>
Message-ID: <dqH0OqAw0-68d8tEZsNLlapM2pAJNOznoAXq6p0h_ptpqPwFLljWH3l3UiYO3xbYKMcAc_TsYKNm8Cs-GhGrKEW2UNyrjUk7JrKAb876pJA=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Monday, 27 July 2020 10:19, Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Is it possible to 'automate' this restriction by someConfig.in rule,
> e.g. depends on !BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA ?

Yes, that should be possible. I'll address this in the next revision.

> This option is not added but not used in this patch series. I see that
> it should not be added for SBSA reference platform since in that case
> EDK2 embeds ATF binaries.
>
> Is it prepared for the upcoming new boards or is it supposed to be used
> by aarch64_efi_defconfig ? In the latter case ATF as well as this new
> BL33 option has to be explicitly specified in board config.

I've intentionally kept the initial revisions of this series simple and
didn't want to introduce yet another board (other than the SBSA board).

But if you think introducing a usage of the configuration I think either
qemu_aarch64_virt_efi_defconfig or arm_foundationv8_efi_defconfig would
make sense.
The former would be easier and more accessible to test by most people.
But the latter would be a more accurate emulation of something that
would resemble the SBBR standard.



Cheers

D. Olsson
PGP: 8204A8CD
