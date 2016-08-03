From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 11:53:41 +0200
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
In-Reply-To: <CAMWiJUs2371W5JZGnDuAozTCKUHKQtoU+V1hrb1rHKsh=nG6DA@mail.gmail.com>
References: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
 <20160802213044.264e63f8@free-electrons.com>
 <CAMWiJUs2371W5JZGnDuAozTCKUHKQtoU+V1hrb1rHKsh=nG6DA@mail.gmail.com>
Message-ID: <20160803115341.21a3018b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Cc'ing Gary, our i.MX6 expert.

On Wed, 3 Aug 2016 11:03:28 +0200, Zhaozhou Meng wrote:

> So if I want to use QT5 without Xorg:
> I have to use eglfs support and OpenGL ES2 support, at the same time, can I
> use the imx-gpu-viv driver for the acceleration ?

Well, imx-gpu-viv is precisely what provides the OpenGL ES
implementation.

> I have tried to set the Freescale imx libraries->imx-gpu-viv->output
> option->Framebuffer, there is no problem during the building, but I don't
> know if it will accelerate the output of QT5 ?

It will.

> The second way that I have tired is to use QT5 under Xorg:
> Xorg X Window Sytem -> X11R7 Drivers -> x86-video-fbdev &&
> x86-video-fbturbo

No, you need to use the Vivante X.org driver.

> Freescale imx libraries -> imx-gpu-viv -> output option -> Framebuffer

No, you need to enable the X11 output
(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11).

> QT5 -> OpenGL API -> OpenGL ES 2.0 +
> QT5 -> Xorg XCB support
> QT5-> eglfs support

eglfs support is not needed in this case, as far as I know.

> But I changed the option to this:
> Xorg X Window Sytem -> X11R7 Drivers -> x86-video-imx-viv (with Mesa3D
> selected automatic)
> Freescale imx libraries -> imx-gpu-viv -> output option -> X11
> QT5 -> OpenGL API -> OpenGL ES 2.0 +
> QT5 -> Xorg XCB support
> QT5-> eglfs support
> 
> With this option, I have the problem with QT Widget during the building.
> 
> I attache the config file and the infomations about build.

I'll fire up a build and see what happens. Gary, do you have an idea?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
