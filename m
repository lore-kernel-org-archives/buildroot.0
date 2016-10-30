From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:02:18 +0100
Subject: [Buildroot] [PATCH 00/10] core: add waf-package infra,
	convert packages
Message-ID: <cover.1477843328.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the waf-package infrastructure for packages based
on the Waf buildsystem.

Then, packages using Waf are converted to use this new infra, except for
samba4 which only uses it for configure, not for build.

The converted packages still build fine with this defconfig:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_GSTREAMER1=y
    BR2_PACKAGE_GST1_IMX=y
    BR2_PACKAGE_JACK2=y
    BR2_PACKAGE_MPV=y
    BR2_PACKAGE_GLMARK2=y
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_MESA3D_OPENGL_ES=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
    BR2_PACKAGE_LIBIMXVPUAPI=y
    BR2_PACKAGE_NORM=y

Except for these platitudes, nothing interesting to state about this new
infra; it is pretty straightforward...

Thanks to Romain for early review. ;-)


Regards,
Yann E. MORIN.


The following changes since commit 5f1e0e688bba9b94287302258afdfacd6e6344e2

  trinity: fix Config.in depends on logic (2016-10-30 16:42:16 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f821d5032f417f98141d6fb30f92c28feb16d2e0

  package/norm: make it a waf-package (2016-10-30 17:00:52 +0100)


----------------------------------------------------------------
Yann E. MORIN (10):
      package/waf: new host package
      core: add waf-package infra
      docs/manual: document the waf-package infra
      developpers: add myself as pkg-waf devel
      package/glmark2: make it a waf-package
      package/gst1-imx: make it a waf-package
      package/jack2: make it a waf-package
      package/libimxvpuapi: make it a waf-package
      package/mpv: make it a waf-package
      package/norm: make it a waf-package

 DEVELOPERS                              |   1 +
 docs/manual/adding-packages-waf.txt     |  67 ++++++++++++++++++
 docs/manual/adding-packages.txt         |   2 +
 package/Makefile.in                     |   1 +
 package/glmark2/glmark2.mk              |  20 +-----
 package/gstreamer1/gst1-imx/gst1-imx.mk |  20 +-----
 package/jack2/jack2.mk                  |  34 +--------
 package/libimxvpuapi/libimxvpuapi.mk    |  23 +-----
 package/mpv/mpv.hash                    |   1 -
 package/mpv/mpv.mk                      |  30 +-------
 package/norm/norm.mk                    |  28 +-------
 package/pkg-waf.mk                      | 119 ++++++++++++++++++++++++++++++++
 package/waf/waf.hash                    |   3 +
 package/waf/waf.mk                      |  28 ++++++++
 14 files changed, 234 insertions(+), 143 deletions(-)
 create mode 100644 docs/manual/adding-packages-waf.txt
 create mode 100644 package/pkg-waf.mk
 create mode 100644 package/waf/waf.hash
 create mode 100644 package/waf/waf.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
