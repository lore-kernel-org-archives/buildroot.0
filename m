From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:33 -0300
Subject: [Buildroot] [PATCH 0/9] The wayland/weston/libgtk3 bump
Message-ID: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps wayland/weston to the latest 1.12 release and gtk3+
to it's latest 3.22.0 release.
The series can't be split since these wayland/weston/gtk+ versions are
protocol-version tied, i.e. gtk+ 3.22 won't work with any older
wayland release.

Gustavo Zacarias (9):
  wayland-protocols: bump to version 1.7
  wayland: bump to version 1.12.0
  weston: bump to version 1.12.0
  legacy: add weston rpi support
  adwaita-icon-theme: bump to version 3.22.0
  libgtk3: bump to version 3.22.0
  glibmm: bump to version 2.50.0
  libsigc: bump to version 2.10.0
  gtkmm3: bump to version 3.22.0

 Config.in.legacy                                   |  8 +++++
 package/adwaita-icon-theme/adwaita-icon-theme.hash |  4 +--
 package/adwaita-icon-theme/adwaita-icon-theme.mk   |  5 ++--
 package/glibmm/glibmm.hash                         |  4 +--
 package/glibmm/glibmm.mk                           |  4 +--
 package/gtkmm3/gtkmm3.hash                         |  4 +--
 package/gtkmm3/gtkmm3.mk                           |  4 +--
 package/libgtk3/libgtk3.hash                       |  4 +--
 package/libgtk3/libgtk3.mk                         |  4 +--
 package/libsigc/libsigc.hash                       |  4 +--
 package/libsigc/libsigc.mk                         |  2 +-
 package/wayland-protocols/wayland-protocols.hash   |  4 +--
 package/wayland-protocols/wayland-protocols.mk     |  2 +-
 ...0002-scanner-Use-uint32_t-instead-of-uint.patch | 31 --------------------
 package/wayland/wayland.hash                       |  4 +--
 package/wayland/wayland.mk                         |  2 +-
 ...ompositor-rdp-fix-no-break-space-U-A0-U8-.patch | 34 ----------------------
 package/weston/Config.in                           |  6 ----
 package/weston/weston.hash                         |  4 +--
 package/weston/weston.mk                           | 11 +------
 20 files changed, 37 insertions(+), 108 deletions(-)
 delete mode 100644 package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
 delete mode 100644 package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch

-- 
2.7.3
