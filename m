From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 14 Jul 2013 00:10:29 -0500
Subject: [Buildroot] [RFC 0/3] ARM Mali Graphics Drivers
Message-ID: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is an RFC for the addition of the ARM Mali graphics driver for Allwinner
based systems.

WARNING: This patch series has not been runtime tested.

TODO:
 - Fix build bug on test program.
 - Runtime testing.

Spenser Gilliland (3):
  a10disp: new package
  sunxi-mali: new package
  opengl: add sunxi-mali as possible egl/gles provider

 package/Config.in                          |  3 ++
 package/a10disp/Config.in                  | 11 +++++
 package/a10disp/a10disp.mk                 | 21 ++++++++
 package/opengl/libegl/libegl.mk            |  4 ++
 package/opengl/libgles/libgles.mk          |  4 ++
 package/sunxi-mali-prop/Config.in          |  2 +
 package/sunxi-mali-prop/sunxi-mali-prop.mk | 10 ++++
 package/sunxi-mali/Config.in               | 65 ++++++++++++++++++++++++
 package/sunxi-mali/S80mali                 | 56 +++++++++++++++++++++
 package/sunxi-mali/egl.pc                  | 12 +++++
 package/sunxi-mali/glesv2.pc               | 12 +++++
 package/sunxi-mali/sunxi-mali.mk           | 79 ++++++++++++++++++++++++++++++
 12 files changed, 279 insertions(+)
 create mode 100644 package/a10disp/Config.in
 create mode 100644 package/a10disp/a10disp.mk
 create mode 100644 package/sunxi-mali-prop/Config.in
 create mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.mk
 create mode 100644 package/sunxi-mali/Config.in
 create mode 100644 package/sunxi-mali/S80mali
 create mode 100644 package/sunxi-mali/egl.pc
 create mode 100644 package/sunxi-mali/glesv2.pc
 create mode 100644 package/sunxi-mali/sunxi-mali.mk

-- 
1.8.1.2
