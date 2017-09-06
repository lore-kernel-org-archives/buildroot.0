From: =?iso-8859-1?Q?=22Bj=F6rn_Kirchner=22?= <bjoern@am-soft.de>
Date: Wed, 6 Sep 2017 07:05:59 +0200
Subject: [Buildroot] rk3288: Qt5 with Mali test failed
In-Reply-To: <CAMty3ZAHzbwNR98FMu-ynKfnu4xwVGUe8hny7rRBz=B4uQVxnQ@mail.gmail.com>
References: <CAMty3ZAHzbwNR98FMu-ynKfnu4xwVGUe8hny7rRBz=B4uQVxnQ@mail.gmail.com>
Message-ID: <321fc040a8805754cf05124bc5e6253d.squirrel@3p.am-soft.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

Am Di, 5.09.2017, 21:14 schrieb Jagan Teki:
> Hi,
>
>
> I'm trying to use MALI_T76X with QT5 packages with reference to
> firefly-rk3288 able to detect HDMI and observed below Error log
>
> I'm sure that all Mali libraries are in rootfs and the only difference
> is I'm using Mainline Kernel. # find -iname libEGL.so
> ./usr/lib/libEGL.so
> # find -iname libmali.so
> ./usr/lib/libmali.so
> # find -iname libGLESv1_CM.so
> ./usr/lib/libGLESv1_CM.so
> # find -iname libGLESv2.so
> ./usr/lib/libGLESv2.so
> # find -iname libOpenCL.so
> ./usr/lib/libOpenCL.so
>
>
> Error log:
> -----------
> # export
> export PWD='/usr/lib/qt/examples/opengl' export QT_QPA_EGLFS_FB='/dev/fb0'
> export QT_QPA_EGLFS_INTEGRATION='none' export QT_QPA_PLATFORM='eglfs' #
> ./hellowindow/hellowindow
> Could not initialize egl display
> Aborted
>
>
> Does mainline still not support Mali setup here or did I miss
> anything, request for help
>

right now don't have access to my board with mali GPU, so I can't double
check, but if I remember correctly, there is a device driver in the
kernel, that needs to be built. To state the obvious, if built as a
module, the module has to be loaded... :)
At least I'm of the mind that this was the case with my Allwinner A10
board with mali GPU. Can you verify that the driver was built and is
loaded, please?

For other reasons I used a non-mainline kernel with my A10 board, so I
can't tell you, if the mainline kernel supports your version of the
mali GPU out of the box.


Regards,

Bj?rn

> thanks! --
> Jagan Teki
> Senior Linux Kernel Engineer | Amarula Solutions
> U-Boot, Linux | Upstream Maintainer
> Hyderabad, India.
> _______________________________________________
> buildroot mailing list buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
