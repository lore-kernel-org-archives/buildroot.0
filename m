From: Ozgun <ozgun.gunay@gmail.com>
Date: Tue, 17 Jan 2012 10:53:19 +0200
Subject: [Buildroot] mesa gles2 under buildroot
Message-ID: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configuration options --enable-gles1, --enable-gles2 are valid above
mesa 7.10.1.
So I incresed the mesa version form mesa.mk.
But now mesa gives import libxml2 error on python.
I chose the python and libxml2 packages as well. But the default libxml2
package package configuation has a --without-python option. So that it
doesn't compile libxml2 python packages.
Then I switched them to --with-python on libxml2.mk file.
But still libxml2 python libraries are absent.

How can I add libxml2 python libraries?


Eventually ;
I need a QT with 3D library.
QT needs  QtOpenGl.
QtOpenGl needs opengl es2
opengl es comes with mesa3d 7.10.1.
mesa3d 7.10.1 needs xorg
mesa3d 7.10.1 needs libxml2 python.
libxml2 python --->
.....
...
..
.





Date: Thu, 12 Jan 2012 10:36:35 +0200
> From: Ozgun <ozgun.gunay@gmail.com>
> To: undisclosed-recipients:;
> Subject: [Buildroot] mesa gles2 under buildroot
> Message-ID:
>        <CAPeX=+soNee6absBROUkCUUkWC_OLXURB1D_kqE5mq6Thray8Q@mail.gmail.com
> >
> Content-Type: text/plain; charset="utf-8"
>
> I'm trying to use QT with opengl support.
> The opengl comes with mesa, and mesa comes with xorg.
> I select them from buildroot configuration.
> The buildroot created rootfs successfully without opengl es support.
> libGL and libGLU files are exist but the libGLES_CM and the libGLESv2
> files (which are the essential files for QT opengl) are absent.
> Then I examined the mesa config.log file;
>
> --------
>  $ ./configure --target=i686-linux --host=i686-linux
> --build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr
> --sysconfdir=/etc --disable-gtk-doc --disable-nls --disable-ipv6
> --enable-egl --enable-glu --disable-glw --disable-glut --enable-gles1
> --enable-gles2 --disable-gallium --with-driver=dri
> --with-dri-drivers=swrast --disable-static
>
>
> configure:9068: WARNING: unrecognized options: --disable-gtk-doc,
> --disable-nls, --disable-ipv6, --enable-gles1, --enable-gles2
>
> --------
>
> Why the mesa doesn't recognize --enable-gles2 option?
>
>
> Also I tried to configure mesa from mesa3d.mk file under buildroot, but
> buildroot still uses the above options.
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <
> http://lists.busybox.net/pipermail/buildroot/attachments/20120112/35855967/attachment-0001.html
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120117/564eb079/attachment.html>
