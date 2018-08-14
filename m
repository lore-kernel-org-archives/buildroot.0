From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 16:23:23 +0200
Subject: [Buildroot] [PATCH] uboot: add option to depend on host-lzop
In-Reply-To: <20180728201152.5094-1-thomas.petazzoni@bootlin.com>
References: <20180728201152.5094-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180814162323.16e21f36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jul 2018 22:11:52 +0200, Thomas Petazzoni wrote:
> Some U-Boot configurations use lzop, which may not be available on the
> build machine since it's not a mandatory dependency of Buildroot.
> 
> To solve this, a new option BR2_TARGET_UBOOT_NEEDS_LZOP is introduced,
> and handled in a similar way to the existing
> BR2_TARGET_UBOOT_NEEDS_OPENSSL option.
> 
> This fixes the build of the dra7xx_evm U-Boot defconfig as of U-Boot
> 2018.07, on a build machine without lzop installed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 12 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
