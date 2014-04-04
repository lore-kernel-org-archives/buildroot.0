From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Apr 2014 07:18:06 +0200
Subject: [Buildroot] [PATCH v5 0/8] Add new libraries for XBMC Gotham
Message-ID: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
v5: - rebased
    - updated libva (Thomas)
    - include only git-ready patches (X11 intel driver will follow in a seperate patch)
v4: - rebased
    - removed flac version bump (Gustavo)
    - removed libfs version bump https://github.com/OpenELEC/OpenELEC.tv/commit/b55859

Regards, Bernd

Bernd Kuhls (8):
  libdrm: Explain dependency on xorg in Kconfig
  mesa3d: Explain dependency for i965 DRI driver on xorg in Kconfig
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support

 package/mesa3d/Config.in                              |    4 ----
 package/opengl/Config.in                              |    1 -
 package/opengl/libgl/Config.in                        |    6 ------
 package/opengl/libgl/libgl.mk                         |   16 ----------------
 package/vlc/vlc.mk                                    |    4 ++--
 package/x11r7/xdriver_xf86-video-ati/Config.in        |    5 +----
 package/x11r7/xdriver_xf86-video-glint/Config.in      |    5 +----
 package/x11r7/xdriver_xf86-video-intel/Config.in      |    7 ++-----
 package/x11r7/xdriver_xf86-video-mach64/Config.in     |    3 ---
 package/x11r7/xdriver_xf86-video-mga/Config.in        |    5 +----
 package/x11r7/xdriver_xf86-video-openchrome/Config.in |    5 +----
 package/x11r7/xdriver_xf86-video-r128/Config.in       |    5 +----
 package/x11r7/xdriver_xf86-video-savage/Config.in     |    5 +----
 package/x11r7/xdriver_xf86-video-sis/Config.in        |    5 +----
 package/x11r7/xdriver_xf86-video-tdfx/Config.in       |    5 +----
 package/x11r7/xdriver_xf86-video-vmware/Config.in     |    5 +----
 package/x11r7/xserver_xorg-server/Config.in           |    1 +
 17 files changed, 14 insertions(+), 73 deletions(-)
 delete mode 100644 package/opengl/libgl/Config.in
 delete mode 100644 package/opengl/libgl/libgl.mk

-- 
1.7.10.4
