From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Thu, 7 Mar 2019 23:00:19 +0000
Subject: [Buildroot] QT 5.6 app with eglfs and etnaviv (imx6 solo,
 buildroot 2018.02.5)
Message-ID: <CAE58QoMfF2Kwi0Hc_yOeOinoLA-82OfzzeymOBXsjMK=nYoK5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to get my Qt 5.6 app to run with the etnaviv driver instead
of vivante. My app has so far been running without any problems with
the vivante driver (I'm using NXP's 4.9.11 kernel). So now I would
like to try and see if I can switch to the community driver and mesa.

These are the variables that I've been exporting with the vivante driver:
FB_MULTI_BUFFER=3
QT_QPA_EGLFS_INTEGRATION=eglfs_viv

For etnaviv, I'm doing:
QT_QPA_EGLFS_INTEGRATION=eglfs_kms

But I'm getting this error::
gbm: failed to open any driver (search paths /usr/lib/dri)
gbm: Last dlopen error: /usr/lib/dri/vivante_dri.so: cannot open
shared object file: No such file or directory
failed to load driver: vivante

These are the contents of /usr/lib/dri/
# ls /usr/lib/dri/
etnaviv_dri.so     imx-drm_dri.so     kms_swrast_dri.so  swrast_dri.so

And I'm enabling these packages:
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT=y

BR2_PACKAGE_LIBDRM=y
BR2_PACKAGE_LIBDRM_HAS_ATOMIC=y
BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC=y
BR2_PACKAGE_LIBDRM_ETNAVIV=y
BR2_PACKAGE_KMSXX=y

I'm obviously missing something here. Any help would be very much appreciated.

Thanks,
Juan
