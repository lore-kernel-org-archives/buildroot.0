From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Dec 2018 14:47:59 +0100
Subject: [Buildroot] [PATCH] boot/uboot: add support for custom DT name
In-Reply-To: <20181224131904.20891-1-kostap@marvell.com>
References: <20181224131904.20891-1-kostap@marvell.com>
Message-ID: <20181224144759.283fe055@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kostya,

+Clemens Gruber in Cc, who posted a related U-Boot patch.

On Mon, 24 Dec 2018 15:19:04 +0200, kostap at marvell.com wrote:
> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Some u-boot default configuration files could be shared between
> targets and used for building images for multiple board types.
> The only difference between such builds is the DTB embedded in
> in the boot image for each specific platform.
> This approach is widely used by Marvell, having the same u-boot
> configuration file for the entire SoC family, but allowing builds
> of multiple target flavors by supplying the device tree name through
> make command parameter DEVICE_TREE=xxx
> This patch adds such capability to uboot module of the buildroot.
> The custome DT name could be  defined by
> BR2_TARGET_UBOOT_CUSTOM_DTS_NAME entry.
> 
> Change-Id: I69e193339b0369a736bdf98491b9914d24a54e17
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>

Reading this again, in fact it is very similar to patch
http://patchwork.ozlabs.org/patch/881197/ we already have in the queue.
With a very important distinction: your patch passes DEVICE_TREE=,
while the existing pending patch passes EXT_DTB=. The obvious question
that comes up is: which one is right ? Or are these two orthogonal
things ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
