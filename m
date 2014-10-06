From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:26:10 +0200
Subject: [Buildroot] [pull request v3] Introduce NVidia's binary driver
Message-ID: <cover.1412633983.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support for NVidia's binary blob, the driver to its
family of GPUs.

It also introduces the OpenGL Registry, to provide GL headers for
those OpenGL/EGL/GLES implementations that do not provide their own
headers (like NVidia's binary blob.)

As a dependency to OpenGL Registry, it also introduces python-lxml, a
binding to libxml2 and libxslt, used to generate the FL headers.

The series was build-tested using XBMC as a test-bed (I managed a
single runtime test, as my HTPC is a bit reluctant at booting from a
USB key when the internal HDD is present, so I can't easily retest.)


Changes v2 -> v3:  (Thpmas P.)
  - opengl-registry is a prompt-less package
  - explain the tricky variables and code about installing the
    NVidia libraries
  - drop support for ARM, not testable here
  - some cleanups
  - bump opengl-registry

Changes v1 -> v2:
  - bump opengl-registry
  - drop i915, applied  (Peter)


Regards,
Yann E. MORIN.


The following changes since commit 7349af1bc4ed941d59c0c9971007479881379d3f:

  openvmtools: remove unnecessary C flag (2014-10-06 21:16:09 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gfx

for you to fetch changes up to e9c3f11f3f7e77e0b871bb9349cdc731db8341f8:

  package/nvidia-driver: build the kernel module (2014-10-06 22:57:19 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/python-lxml: new package
      package/opengl-registry: new package
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

 package/Config.in                                  |    2 +
 package/nvidia-driver/Config.in                    |   66 +
 package/nvidia-driver/nvidia-driver.mk             |  157 ++
 package/opengl-registry/Config.in                  |   23 +
 package/opengl-registry/gl.h                       | 2115 ++++++++++++++++++++
 .../opengl-registry-000-run-from-current-dir.patch |   17 +
 package/opengl-registry/opengl-registry.mk         |   79 +
 package/python-lxml/python-lxml.mk                 |   25 +
 8 files changed, 2484 insertions(+)
 create mode 100644 package/nvidia-driver/Config.in
 create mode 100644 package/nvidia-driver/nvidia-driver.mk
 create mode 100644 package/opengl-registry/Config.in
 create mode 100644 package/opengl-registry/gl.h
 create mode 100644 package/opengl-registry/opengl-registry-000-run-from-current-dir.patch
 create mode 100644 package/opengl-registry/opengl-registry.mk
 create mode 100644 package/python-lxml/python-lxml.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
