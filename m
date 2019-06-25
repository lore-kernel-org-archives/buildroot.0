From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Jun 2019 22:14:05 +0200
Subject: [Buildroot] [PATCH v3 8/9] package/mesa3d: switch build system
 to meson
References: <20190506095451.26522-1-romain.naour@smile.fr>
 <20190506095451.26522-8-romain.naour@smile.fr>
 <7c733dcb-2368-a98d-33c3-6e21ade70a6c@smile.fr>
Message-ID: <dtbaufxfem.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 25 Jun 2019 09:50:14 +0200 schrieb Romain Naour:

> It would be great to have reviewers on this series, otherwise we are
> stuck in mesa 19.0.x. Also we need meson to have the latest feature
> added after autotools freeze, see [1].

Hi Romain,

these mesa3d options

$ grep MESA3D .config | grep -v \#
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER=y
BR2_PACKAGE_MESA3D_DRIVER=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y

result in a configure error:

Run-time dependency xcb found: NO (tried pkgconfig)

meson.build:1375:4: ERROR: Dependency "xcb" not found, tried pkgconfig

Regards, Bernd
