From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:41:45 +0100
Subject: [Buildroot] [PATCH 1/1] configs/rock64: update defconfig
In-Reply-To: <20201215004903.8829-1-xuminready@gmail.com>
References: <20201215004903.8829-1-xuminready@gmail.com>
Message-ID: <20201231174145.64913277@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Dec 2020 00:49:03 +0000
Min Xu <xuminready@gmail.com> wrote:

> Revert "configs/rock64_defconfig: remove defconfig" a5fa2469e6506ea4f5a91739aa099f63a10e45ce
> 
> bump uboot from 2017.09 to release-2020-07 from ayufan-rock64/linux-mainline-u-boot
> 
> Signed-off-by: Min Xu <xuminready@gmail.com>

Thanks, I've applied to master, with two changes. First, I changed the
commit title to "configs/rock64: new defconfig", as this commit is not
"updating" a defconfig, it's really adding a new one.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/*.elf"

I've added a fixed version of ATF here instead of relying on the
default "latest" version, which can change over time.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
