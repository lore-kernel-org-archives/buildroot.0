From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Apr 2013 22:26:01 +0200
Subject: [Buildroot] [PATCH v2 0/4] Wayland packaging
Message-ID: <1367267165-6873-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here comes a second version of the Wayland packages. The only change
since the first version is that the xkeyboard-config package now
appears under "X libraries and helper libraries", as suggested by
Arnout.

Best regards,

Thomas

Thomas Petazzoni (4):
  xkeyboard-config: make available outside of X.org, reduce
    dependencies
  libxkbcommon: new package
  wayland: new package
  weston: new package

 package/Config.in                                  |    4 ++
 package/libxkbcommon/Config.in                     |    8 ++++
 package/libxkbcommon/libxkbcommon.mk               |   16 +++++++
 package/wayland/Config.in                          |   10 +++++
 package/wayland/wayland.mk                         |   30 +++++++++++++
 package/weston/Config.in                           |   29 ++++++++++++
 ...pendent-code-only-when-the-DRM-compositor.patch |   47 ++++++++++++++++++++
 package/weston/weston.mk                           |   32 +++++++++++++
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xkeyboard-config/Config.in           |    7 +--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    7 ++-
 11 files changed, 186 insertions(+), 5 deletions(-)
 create mode 100644 package/libxkbcommon/Config.in
 create mode 100644 package/libxkbcommon/libxkbcommon.mk
 create mode 100644 package/wayland/Config.in
 create mode 100644 package/wayland/wayland.mk
 create mode 100644 package/weston/Config.in
 create mode 100644 package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
 create mode 100644 package/weston/weston.mk

-- 
1.7.9.5
