From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:21:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] sunxi-mali-mainline: add support for
 arm64(aarch64) architecture and r8p1 blob version.
In-Reply-To: <20180822000648.23314-2-giulio.benetti@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-2-giulio.benetti@micronovasrl.com>
Message-ID: <20180822132113.78b0d190@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 02:06:47 +0200, Giulio Benetti wrote:
> Blobs for arm64(aarch64) and r8p1 version are now available at Bootlin
> Github.
> 
> So:
> - Bump version to latest commit:
> For arm64 architecture and r8p1 version.
> 
> git shortlog --no-merges cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023..
> Giulio Benetti (1):
>       Reorder folders splitting includes and libraries.
> 
> Maxime Ripard (6):
>       Move binaries to an arch subfolder
>       Make x11 binaries path consistent
>       Add r6p2 arm wayland blobs
>       Add r6p2 arm64 blobs
>       Add r8p1 fbdev blobs
>       Add r8p1 arm64 fbdev blobs
> 
> - Add support for them also under arm64(aarch64) architecture copying the
> right blobs according to architecture(arm or arm64) checking if BR2_arm
> or BR2_aarch64 is enabled.
> Only BR2_arm needs to provide BR2_ARM_EABIHF, so check must be done only
> in that case.
> - Mali-blobs repository folder layout has been reordered, so modify path
> when copying headers and libraries.
> - When copying libraries copy only *.so* files to avoid useless files to
> end into target folder.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/sunxi-mali-mainline/Config.in             |  6 ++++--
>  .../sunxi-mali-mainline/sunxi-mali-mainline.mk    | 15 ++++++++++-----
>  2 files changed, 14 insertions(+), 7 deletions(-)

This could have been three patches: one bumping the version, one adding
support for the r8p1 version, and one adding support for aarch64. But
OK, I've applied as is, as the patch wasn't too large. But for your
next contributions, please make sure to split them in logical changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
