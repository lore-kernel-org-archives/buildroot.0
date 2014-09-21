From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 23:22:53 +0200
Subject: [Buildroot] [PATCH 0/3 v2] Introduce NVidia's binary driver (branch
	yem/gfx)
Message-ID: <cover.1411334346.git.yann.morin.1998@free.fr>
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

The series was build-tested using XBMC as a test-bed (I managed a
single runtime test, as my HTPC is a bit reluctant at booting from a
USB key when the internal HDD is present, so I can't easily retest.)


Changes v1 -> v2:
  - bump opengl-registry
  - drop i915, applied  (Peter)


Regards,
Yann E. MORIN.


The following changes since commit ae69eadaa7b98fb73cbc5dcf8454e54a5189dd9b:

  pkg-infra: put optional step_user def and assignment in one block (2014-09-21 22:57:30 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/gfx

for you to fetch changes up to 1aff79ec2bb8dc545496e965aa1fae0756be29ce:

  package/nvidia-driver: build the kernel module (2014-09-21 23:13:03 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/opengl-registry: new package
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

 package/Config.in                                  |    2 +
 package/nvidia-driver/Config.in                    |   77 +
 package/nvidia-driver/nvidia-driver.mk             |  141 ++
 package/opengl-registry/Config.in                  |   18 +
 package/opengl-registry/gl.h                       | 2115 ++++++++++++++++++++
 .../opengl-registry-000-run-from-current-dir.patch |   17 +
 package/opengl-registry/opengl-registry.mk         |   76 +
 7 files changed, 2446 insertions(+)
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
