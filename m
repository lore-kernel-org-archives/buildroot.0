From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 11 Aug 2019 14:15:39 +0200
Subject: [Buildroot] [PATCH v7 11/11] package/mesa3d: add support for
 gallium lima driver
In-Reply-To: <20190811103859.4841-11-bernd.kuhls@t-online.de>
References: <20190811103859.4841-1-bernd.kuhls@t-online.de>
 <20190811103859.4841-11-bernd.kuhls@t-online.de>
Message-ID: <CAK4VdL2T3cdHZEKPNQepgSKVY97abSZdqie0oxpRaar1ArEsgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 11, 2019 at 12:39 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> More infos can be found here:
> https://gitlab.freedesktop.org/lima/web/wikis/home
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v7: initial version
>
>  package/mesa3d/Config.in | 6 ++++++
>  package/mesa3d/mesa3d.mk | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 27ab0dce22..b8a143368d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -111,6 +111,12 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
>  comment "Gallium KMSRO needs one or more renderonly drivers"
>         depends on !BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
> +       bool "Gallium lima driver"
> +       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +       help
> +         Mesa driver for ARM Mali Utgard GPUs.
> +

As Romain already mentioned in another thread, lima uses renderonly
with kmsro, so it probably needs
select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO

And as lima is now being enabled in this same patchset, maybe panfrost
can be enabled too?

Cheers

Erico
