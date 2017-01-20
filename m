From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:15:13 +1100
Subject: [Buildroot] [PATCH 1/4] configs/altera_sockit: bump kernel to
 4.7 and u-boot to v2016.11-rc3
In-Reply-To: <1484839933-17637-2-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484839933-17637-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484839933-17637-2-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <20170120141513.34e1010e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 10:32:10 -0500, Lucas Bajolet wrote:

>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
> +BR2_TARGET_UBOOT_BOARDNAME="socfpga_sockit"
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
>  BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.11-rc3"

Why do you bump to a -rc version rather than a final stable version?

Also, you only remove the existing U-Boot patch in PATCH 2/4. Which
means if I apply only PATCH 1/4, the build is broken.

Patch series should be bisectable: applying PATCH 1/4 only should work,
applying PATCH 1/4 and 2/4 only should work, applying PATCH 1/4, 2/4
and 3/4 only should work.

Could you rework your series with this in mind?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
