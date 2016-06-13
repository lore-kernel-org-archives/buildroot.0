From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:20:11 +0200
Subject: [Buildroot] [PATCH v2 05/14] xdriver_xf86-video-imx-viv: bump
	version to 5.0.11-p8.4
In-Reply-To: <acc40a04b76b5069de297330cc9207d20f69a9a1.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <acc40a04b76b5069de297330cc9207d20f69a9a1.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yvnwAdtfHfaMez7CZOnYd-SNQAd6ey7XnbLrF0bg21UPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:11 PM, Andrew Webster <awebster@arcx.com> wrote:
> Remove upstreamed patch.
> Add patch from Yocto to not use git for versioning.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/06a0574
> https://github.com/Freescale/meta-fsl-arm/commit/076df90
>
> The following xorg.conf was used in order to force the use of the
> vivante module:
> https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
>
> Note that the X server must be started with the "noreset" option to
> avoid crashes when closing X apps.
> Tested with:
>  # X -noreset &
>  # cd /usr/share/examples/viv_samples/vdk/
>  # DISPLAY=:0 ./tutorial7
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>
> ---
> Changes v1 -> v2:
>   - added test procedure to comment
>   - updated from p8.3 to p8.4
>
>  .../0001-Remove-dix-internal-header-usage.patch    | 31 --------
>  ...001-Stop-using-Git-to-write-local-version.patch | 87 ++++++++++++++++++++++
>  .../xdriver_xf86-video-imx-viv.hash                |  3 +-
>  .../xdriver_xf86-video-imx-viv.mk                  |  2 +-
>  4 files changed, 89 insertions(+), 34 deletions(-)
>  delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch
>
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
> deleted file mode 100644
> index f146ba3..0000000
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 80c419dddf6483873503d90694c4b4ae34ffa5e4 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Wed, 2 Dec 2015 13:50:57 +0000
> -Subject: [PATCH] Remove 'dix' internal header usage
> -Organization: O.S. Systems Software LTDA.
> -
> -The 'swaprep.h' is an internal Xorg header and is not being installed
> -anymore. The swap features are provided by the 'misc.h' header now.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I think you need to add your SOB in the patch like:

sob: Otavio

Downloaded from:
<url from yocto>

sob: Andrew

---

Also, should we add a dependency on ARM_EABIHF since it depends on
imx-gpu-viv? I'm never a 100% sure when you need to propagate those
dependencies.

Regards,
Gary
