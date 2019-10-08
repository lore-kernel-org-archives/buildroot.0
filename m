From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Oct 2019 21:39:31 +0200
Subject: [Buildroot] imx-drm not getting installed
In-Reply-To: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
References: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
Message-ID: <20191008213931.1409bd7f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Mon, 7 Oct 2019 10:31:16 -0300, Fabio Estevam <festevam@gmail.com> wrote:

> Hi Bernd,
>
> I am testing the latest Mesa 19.2 on imx6 (Etnaviv) and mx53
> (Freedreno) and I notice that the imx-drm library is no longer getting
> installed:
>
> # /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
> MESA-LOADER: failed to open imx-drm (search paths /usr/lib/dri)
> failed to load driver: imx-drm
>
> # ls /usr/lib/dri
> etnaviv_dri.so     kms_swrast_dri.so  swrast_dri.so
> kgsl_dri.so        msm_dri.so
> #
>
> For imx6 I am using the configs/imx6-sabresd_qt5_defconfig target.
>
> Any ideas?

Enabling 'BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y' enables the
missing drivers...

Before:
	$ ls target/usr/lib/dri/
	etnaviv_dri.so  kms_swrast_dri.so  swrast_dri.so

After:
	$ ls target/usr/lib/dri/
	armada-drm_dri.so  ili9341_dri.so     mxsfb-drm_dri.so  st7735r_dri.so
	etnaviv_dri.so     imx-drm_dri.so     pl111_dri.so      stm_dri.so
	exynos_dri.so      kms_swrast_dri.so  repaper_dri.so    sun4i-drm_dri.so
	hx8357d_dri.so     meson_dri.so       rockchip_dri.so   swrast_dri.so
	ili9225_dri.so     mi0283qt_dri.so    st7586_dri.so

Regards,
Peter

>
> Thanks,
>
> Fabio Estevam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
