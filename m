From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Aug 2018 15:48:06 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-mali-mainline: add EULA license
 file
In-Reply-To: <20180825133843.116694-2-giulio.benetti@micronovasrl.com>
References: <20180825133843.116694-1-giulio.benetti@micronovasrl.com>
 <20180825133843.116694-2-giulio.benetti@micronovasrl.com>
Message-ID: <2b25f761-50df-cba2-907e-adbdcac0620b@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 25/08/2018 15:38, Giulio Benetti ha scritto:
> sunxi-mali-mainline package has not license file at the moment.
> 
> License file is a pdf EULA, but its name contains whitespaces. This
> gives problems when passing filename to SUNXI_MALI_MAINLINE_LICENSE_FILES
> since it expects a list of files.
> Other attempts with \ or \\ to keep spaces were tried with no luck.
> Add a define to POST_PATCH_HOOKS to change pdf filename from
> 'EULA for Mali 400MP _AW.pdf' to 'EULA_for_Mali_400MP_AW.pdf'.
> Add EULA file to hash.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/sunxi-mali-mainline/sunxi-mali-mainline.hash |  1 +
>   package/sunxi-mali-mainline/sunxi-mali-mainline.mk   | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> index 5d9d1a52b4..71a784ab63 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> @@ -1,2 +1,3 @@
>   # Locally calculated
>   sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
> +sha256 8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
> \ No newline at end of file

This breaks make legal-info.
Sorry I resend patches.

Giulio
