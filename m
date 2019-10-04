From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Oct 2019 16:06:04 +0200
Subject: [Buildroot] [PATCH/next v4 3/3] package/weston: bump to version
 7.0.0
References: <20190826004742.81132-1-james.hilliard1@gmail.com>
 <20190826004742.81132-3-james.hilliard1@gmail.com>
Message-ID: <c70k6gxhu8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 25 Aug 2019 18:47:42 -0600 schrieb James Hilliard:

>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL

Hi,

demo clients seems to need glesv2 as well:

Run-time dependency glesv2 found: NO (tried pkgconfig and cmake)

clients/meson.build:292:4: ERROR: Problem encountered: weston-subsurfaces 
requires 'glesv2' which was not found. If you rather not build this, set 
'-Ddemo-clients=false'.

https://cgit.freedesktop.org/wayland/weston/tree/clients/meson.build?
h=7.0.0#n279

Mesa3d was configured with these options:

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER=y
BR2_PACKAGE_MESA3D_DRIVER=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y

Regards, Bernd
