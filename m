From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 11 Oct 2019 15:15:16 +0200
Subject: [Buildroot] [PATCH v2 2/4] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <CAOMZO5C8BmpNOn632xrYWTHmD5LeOeoCAsXVfN5Jr1wWtsJmuA@mail.gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-2-festevam@gmail.com>
 <20191010223853.680453ee@windsurf>
 <CAOMZO5C8BmpNOn632xrYWTHmD5LeOeoCAsXVfN5Jr1wWtsJmuA@mail.gmail.com>
Message-ID: <CAK4VdL34zHGntieYHunSrOwMCcH05R_YwhGJd9jd8t_tpPYUvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 11, 2019 at 4:37 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Thomas,
>
> > Fabio Estevam <festevam@gmail.com> wrote:
> >
> > > +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
> >
> > I don't think this is the correct fix. mesa3d itself should be fixed to
> > not require explicitly enabling this option. If
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y is enabled, then you want
> > the etnaviv driver, it should be there.
>
> Yes, it seems we currently have a bug in mesa, which does not install
> imx-drm_dri.so without BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO being
> selected.
I think it is a valid choice to not have it. For example, you might be
interested in only having the GPU for offscreen rendering. So if you
do want the drm driver to bridge to the display, I think you should
just enable kmsro.

Erico
