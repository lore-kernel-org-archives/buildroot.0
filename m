From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Sep 2019 19:50:26 +0200
Subject: [Buildroot] [PATCH v12 00/13] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.6
Message-ID: <20190904175039.29279-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

changelog:

v12: bump version to 19.1.6
     added "add support for gallium freedreno driver"
     rebased
v11: added "Gallium vdpau state tracker is only available..."
     rebased on branch 'master'
v10: bump version to 19.1.5
     rebased "rename OSMesa option" for branch 'next'
v9:  fixed x11 dependency for patch "add a new option to enable GLX
     support"

Regards, Bernd

Bernd Kuhls (5):
  package/mesa3d: switch build system to meson
  package/{mesa3d, mesa3d-headers}: bump version to 19.1.6
  package/mesa3d: add support for gallium lima driver
  package/mesa3d: add support for gallium panfrost driver
  package/mesa3d: add support for gallium freedreno driver

Romain Naour (8):
  package/python3-mako: new package
  package/mesa3d: rename OSMesa option
  package/mesa3d: add OSMesa classic needs dri swrast
  package/mesa3d: Only one swrast provider can be built
  package/mesa3d: add xvmc option
  package/mesa3d: Gallium xa state tracker is only available for nouveau
    and svga Gallium drivers
  package/mesa3d: add a new option to enable GLX support
  package/mesa3d: select kmsro for etnaviv

 Config.in.legacy                              |   8 +
 package/mesa3d-demos/mesa3d-demos.mk          |   2 +-
 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...vert-order-for-wayland-scanner-check.patch |  51 ------
 ...d-scanner-provided-by-wayland-scanne.patch |  52 ++++++
 ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch |  39 +++++
 .../mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch   |  37 ----
 package/mesa3d/Config.in                      |  93 ++++++++---
 package/mesa3d/mesa3d.hash                    |  11 +-
 package/mesa3d/mesa3d.mk                      | 158 +++++++++---------
 package/python-mako/python-mako.mk            |   2 +
 package/python3-mako/python3-mako.hash        |   1 +
 package/python3-mako/python3-mako.mk          |  21 +++
 package/wine/wine.mk                          |   2 +-
 14 files changed, 287 insertions(+), 192 deletions(-)
 delete mode 100644 package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
 create mode 100644 package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
 create mode 100644 package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
 delete mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
 create mode 120000 package/python3-mako/python3-mako.hash
 create mode 100644 package/python3-mako/python3-mako.mk

-- 
2.20.1
