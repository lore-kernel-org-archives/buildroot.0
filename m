From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 18:07:49 +0200
Subject: [Buildroot] [PATCH 0/4] Wayland/weston packages
Message-ID: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of four patches that add support for Weston, the
reference implementation of the Wayland protocol. So far, only the
fbdev backend is supported, but it's in my plans to add support for
the RPi compositor, and maybe the DRM one.

Note that the first patch does something a little bit ugly: it moves
xkeyboard-config outside of the if BR2_PACKAGE_XORG7 ... endif clause,
because we also need it for Wayland/Weston. The consequence is that it
now appears "alone" right after the "X.org system" submenu in
menuconfig, which is not entirely nice. Suggestions welcome.

Best regards,

Thomas

Thomas Petazzoni (4):
  xkeyboard-config: make available outside of X.org, reduce
    dependencies
  libxkbcommon: new package
  wayland: new package
  weston: new package

 package/Config.in                                  |    3 ++
 package/libxkbcommon/Config.in                     |    8 ++++
 package/libxkbcommon/libxkbcommon.mk               |   16 +++++++
 package/wayland/Config.in                          |   10 +++++
 package/wayland/wayland.mk                         |   30 +++++++++++++
 package/weston/Config.in                           |   29 ++++++++++++
 ...pendent-code-only-when-the-DRM-compositor.patch |   47 ++++++++++++++++++++
 package/weston/weston.mk                           |   32 +++++++++++++
 package/x11r7/Config.in                            |    3 +-
 package/x11r7/xkeyboard-config/Config.in           |    7 +--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    7 ++-
 11 files changed, 187 insertions(+), 5 deletions(-)
 create mode 100644 package/libxkbcommon/Config.in
 create mode 100644 package/libxkbcommon/libxkbcommon.mk
 create mode 100644 package/wayland/Config.in
 create mode 100644 package/wayland/wayland.mk
 create mode 100644 package/weston/Config.in
 create mode 100644 package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
 create mode 100644 package/weston/weston.mk

-- 
1.7.9.5
