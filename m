From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 9 Aug 2019 14:37:48 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg
 Stompler
In-Reply-To: <20190804220044.33D7082C8B@busybox.osuosl.org>
References: <20190804220044.33D7082C8B@busybox.osuosl.org>
Message-ID: <a931ec3a-ed19-9641-c806-c5b79348700e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/08/2019 ? 00:03, Thomas Petazzoni a ?crit?:
> commit: https://git.buildroot.net/buildroot/commit/?id=5e45febb58d645de8875b9ad6bf964b0472555fa
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The odroidc2_defconfig has been dropped in commit
> b80712a16ae3deb65331a7923aa878e13e2e66b6, do it no longer makes sense
> to list it in the DEVELOPERS file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d43a9f2c74..6f15574e39 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -576,8 +576,6 @@ F:	arch/Config.in.powerpc
>  F:	package/kvm-unit-tests
>  
>  N:	Dagg Stompler <daggs@gmx.com>
> -F:	board/hardkernel/odroidc2

Indeed, I forgot to remove this directory...

Actually there are still two packages related to the odroidc2 board:
odroid-script and odroid-mali.

I haven't noticed the BR2_PACKAGE_ODROID_SCRIPTS=y in the odroidc2 board defconfig.

odroid-script package is odroidc2 board specific and is selected by odroid-mali
package which is itself selected by kodi for AMLogic GPU support.

So up to BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML is related to the odroidc2 board
(from the Buildroot packaging point of view) and should be removed too.

Maybe KODI AML support can be used on other AML based board?

Best regards,
Romain

> -F:	configs/odroidc2_defconfig
>  F:	package/libamcodec/
>  F:	package/odroid-mali/
>  F:	package/odroid-scripts/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
