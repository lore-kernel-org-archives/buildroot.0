From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Oct 2019 23:37:39 -0300
Subject: [Buildroot] [PATCH v2 2/4] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <20191010223853.680453ee@windsurf>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-2-festevam@gmail.com>
 <20191010223853.680453ee@windsurf>
Message-ID: <CAOMZO5C8BmpNOn632xrYWTHmD5LeOeoCAsXVfN5Jr1wWtsJmuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Fabio Estevam <festevam@gmail.com> wrote:
>
> > +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>
> I don't think this is the correct fix. mesa3d itself should be fixed to
> not require explicitly enabling this option. If
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y is enabled, then you want
> the etnaviv driver, it should be there.

Yes, it seems we currently have a bug in mesa, which does not install
imx-drm_dri.so without BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO being
selected.

> >  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>
> BTW, why do you need this ?

Yes, I can remove it.

Thanks
