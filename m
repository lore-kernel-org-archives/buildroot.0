From: Johan Derycke <johanderycke@gmail.com>
Date: Fri, 11 Oct 2019 10:22:05 +0200
Subject: [Buildroot] imx-drm not getting installed
In-Reply-To: <20191010205332.6ee2863a@gmx.net>
References: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
 <20191008213931.1409bd7f@gmx.net>
 <CAOMZO5Bu4cxZ6n5ceTwP5DqXwaH-23xVOxQAGaEwDWufB9dB9A@mail.gmail.com>
 <CAKHhJn3iFOTsB8HW2Mi6vVCYH94+o_2YHqoBJN5JpAaoe1QVog@mail.gmail.com>
 <20191010190116.163c4a44@gmx.net> <20191010205332.6ee2863a@gmx.net>
Message-ID: <CAKHhJn3iAfYE1RuejWYBF+XW_cLQzaMwa7X-h4kKqtRk5g=TqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for clearing that up!
Checked on my target, the links are preserved:
ls -lhi /usr/lib/dri/*.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019
/usr/lib/dri/armada-drm_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/etnaviv_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/exynos_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/hx8357d_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/ili9225_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/ili9341_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/imx-drm_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/meson_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/mi0283qt_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/pl111_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/repaper_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/rockchip_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/st7586_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/st7735r_dri.so
5487 -rwxr-xr-x 15 root root 5.8M Oct 11  2019 /usr/lib/dri/sun4i-drm_dri.so

'Hard to spot links' they should be called :-)

Johan

Op do 10 okt. 2019 om 20:53 schreef Peter Seiderer <ps.report@gmx.net>:

> Hello Johan,
>
> On Thu, 10 Oct 2019 19:01:16 +0200, Peter Seiderer <ps.report@gmx.net>
> wrote:
>
> > Hello Johan,
> >
> > On Thu, 10 Oct 2019 15:05:18 +0200, Johan Derycke <
> johanderycke at gmail.com> wrote:
> >
> > > Hi,
> > >
> > > While testing this (it works :-)) I discovered that those .so files
> are all
> > > identical files.
> >
> > Funny (but true):
> >
> >       $ ls -l target/usr/lib/dri/
> > total 108148
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 armada-drm_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 etnaviv_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 exynos_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 hx8357d_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 ili9225_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 ili9341_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 imx-drm_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 kms_swrast_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 meson_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 mi0283qt_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 mxsfb-drm_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 pl111_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 repaper_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 rockchip_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 st7586_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 st7735r_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 stm_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 sun4i-drm_dri.so
> > -rwxr-xr-x 19 seiderer users 5827712 Oct  8 22:48 swrast_dri.so
> >
> >
> >       $ md5sum target/usr/lib/dri/*
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/armada-drm_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/etnaviv_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/exynos_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/hx8357d_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/ili9225_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/ili9341_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/imx-drm_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/kms_swrast_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/meson_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/mi0283qt_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/mxsfb-drm_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/pl111_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/repaper_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/rockchip_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/st7586_dri.so
> > 5b80a22b0dc635fc311aa6e0a9964d32  target/usr/lib/dri/st7735r_dri.so
> >
> >
> > > Shouldn't this be all symlinks? My rootfs image actually got to big to
> fit
> > > my embedded device ...
>
> The meson install script (see
> build/mesa3d-19.2.0/bin/install_megadrivers.py) installs
> hard links to the given master libgallium_dri.so (and removes the master
> afterwards):
>
>         $ ls -i ./target/usr/lib/dri/*.so
> 615855947 ./target/usr/lib/dri/armada-drm_dri.so
> 615855947 ./target/usr/lib/dri/etnaviv_dri.so
> 615855947 ./target/usr/lib/dri/exynos_dri.so
> 615855947 ./target/usr/lib/dri/hx8357d_dri.so
> 615855947 ./target/usr/lib/dri/ili9225_dri.so
> 615855947 ./target/usr/lib/dri/ili9341_dri.so
> 615855947 ./target/usr/lib/dri/imx-drm_dri.so
> 615855947 ./target/usr/lib/dri/kms_swrast_dri.so
> 615855947 ./target/usr/lib/dri/meson_dri.so
> 615855947 ./target/usr/lib/dri/mi0283qt_dri.so
> 615855947 ./target/usr/lib/dri/mxsfb-drm_dri.so
> 615855947 ./target/usr/lib/dri/pl111_dri.so
> 615855947 ./target/usr/lib/dri/repaper_dri.so
> 615855947 ./target/usr/lib/dri/rockchip_dri.so
> 615855947 ./target/usr/lib/dri/st7586_dri.so
> 615855947 ./target/usr/lib/dri/st7735r_dri.so
> 615855947 ./target/usr/lib/dri/stm_dri.so
> 615855947 ./target/usr/lib/dri/sun4i-drm_dri.so
> 615855947 ./target/usr/lib/dri/swrast_dri.so
>
> All libs share the same inode (and filesystem space), did not check if
> this is transferred correctly into the tar and/or file system image...
>
> Regards,
> Peter
>
> >
> > More a question for the mesa3d developer group?
> >
> > Or in case this is intentional something for an customized install
> step...
> >
> > Regards,
> > Peter
> >
> > >
> > > Best regards,
> > >
> > >
> > >
> > >
> > > Op di 8 okt. 2019 om 21:54 schreef Fabio Estevam <festevam@gmail.com>:
> > >
> > > > Hi Peter,
> > > >
> > > > On Tue, Oct 8, 2019 at 4:39 PM Peter Seiderer <ps.report@gmx.net>
> wrote:
> > > >
> > > > > Enabling 'BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y' enables the
> > > > > missing drivers...
> > > >
> > > > Excellent, thanks!
> > > >
> > > > Should BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y be automatically
> > > > selected when a gallium driver is selected?
> > > >
> > > > Otherwise we will need to patch the existing defconfig files to avoid
> > > > a regression.
> > > >
> > > > Thanks
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191011/8905d3db/attachment.html>
