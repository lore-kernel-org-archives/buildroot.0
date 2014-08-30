From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Aug 2014 01:49:17 +0200
Subject: [Buildroot] [PATCH 0/4] New GFX drivers (branch yem/gfx)
Message-ID: <cover.1409442539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support for two new graphics drivers:
  - Intel's i915-based GPUs, using mesa3d
  - NVidia's GPUs, using a new package, nvidia-driver

It also introduces the OpenGL Registry, to provide GL headers for
those OpenGL/EGL/GLES implementations that do not provide their own
headers (like NVidia's binary blob.)

The series was tested using XBMC as a test-bed:
  - i915: build and runtime tested; i915 lacks proper video decoding
    capabilites, so it is a bit slow when playing h264 videos; otherwise
    the GUI runs smoothly;
  - NVidia: build tested only, runtime tests in progress (stupid HTPC
    refuses to boot off USB when an internal HDD is present)...

Regards,
Yann E. MORIN.


The following changes since commit 172e62be9845fa8c5f92b524cef1c92ef6444c4c:

  package/mesa3d: fix comment about i965 DRI driver (2014-08-31 00:03:16 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/gfx

for you to fetch changes up to ac2a40b91831de746eb6f767c3db9b61e25fa0dc:

  package/nvidia-driver: build the kernel module (2014-08-31 01:37:08 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/mesa3d: add option for the i915 DRI driver
      package/opengl-registry: new package
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

 package/Config.in                                  |    2 +
 package/mesa3d/Config.in                           |    8 +
 package/mesa3d/mesa3d.mk                           |    1 +
 package/nvidia-driver/Config.in                    |   77 +
 package/nvidia-driver/nvidia-driver.mk             |  141 ++
 package/opengl-registry/Config.in                  |   18 +
 package/opengl-registry/gl.h                       | 2115 ++++++++++++++++++++
 .../opengl-registry-000-run-from-current-dir.patch |   17 +
 package/opengl-registry/opengl-registry.mk         |   72 +
 9 files changed, 2451 insertions(+)
 create mode 100644 package/nvidia-driver/Config.in
 create mode 100644 package/nvidia-driver/nvidia-driver.mk
 create mode 100644 package/opengl-registry/Config.in
 create mode 100644 package/opengl-registry/gl.h
 create mode 100644 package/opengl-registry/opengl-registry-000-run-from-current-dir.patch
 create mode 100644 package/opengl-registry/opengl-registry.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
