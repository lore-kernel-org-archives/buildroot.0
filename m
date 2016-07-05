From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:35:45 +0200
Subject: [Buildroot] [PATCH] uboot: install multiple spl images
In-Reply-To: <1467717445-29708-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467717445-29708-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160705173545.575e406f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 13:17:25 +0200, Maxime Hadjinlian wrote:
> From: Jason Abele <jason@nextthing.co>
> 
> For some platforms, there are multiple generated spl images.  Extend
> BR2_TARGET_UBOOT_SPL_NAME to allow these multiple images to be installed
> after uboot build completes.
> 
> For example, the NextThingCo C.H.I.P. uses two binaries from uboot,
> spl/sunxi-spl.bin and spl/sunxi-spl-with-ecc.bin.
> 
> Signed-off-by: Jason Abele <jason@nextthing.co>
> [Maxime:
>  - Add foreach loop for general case and mkpimage
>  - Use firstword for zynq case]
> Signe-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  boot/uboot/Config.in |  2 +-
>  boot/uboot/uboot.mk  | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
