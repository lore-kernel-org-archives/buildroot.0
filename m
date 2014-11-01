From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  1 Nov 2014 10:21:28 +0100
Subject: [Buildroot] [PATCH 0/6] Bump libgtk3 (and friends) for Gtk+ 3.14
Message-ID: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series provides Gtk+ 3.14, by bumping libgtk3 and its dependencies.

It also introduces the Adwaita icon theme.

Best regards
ELB

Eric Le Bihan (6):
  libglib2: bump to version 2.42.0
  cairo: bump to 1.12.12
  pango: bump to 1.36.7
  gdk-pixbuf: bump to 2.30.8
  libgtk3: bump to 3.14.4
  adwaita-icon-theme: new package

 package/Config.in                                  |   1 +
 package/adwaita-icon-theme/Config.in               |   4 +
 package/adwaita-icon-theme/adwaita-icon-theme.mk   |  14 ++
 package/cairo/cairo.mk                             |   2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |   4 +-
 package/libglib2/libglib2-0002-no-gtk-doc.patch    |  25 --
 ...2-0003-implement-GMutex-natively-on-Linux.patch | 279 ---------------------
 package/libglib2/libglib2.mk                       |   3 +-
 ...libgtk3-0005-do-not-build-extract-strings.patch |  47 ++++
 package/libgtk3/libgtk3.mk                         |  13 +-
 package/pango/pango.mk                             |   2 +-
 11 files changed, 81 insertions(+), 313 deletions(-)
 create mode 100644 package/adwaita-icon-theme/Config.in
 create mode 100644 package/adwaita-icon-theme/adwaita-icon-theme.mk
 delete mode 100644 package/libglib2/libglib2-0002-no-gtk-doc.patch
 delete mode 100644 package/libglib2/libglib2-0003-implement-GMutex-natively-on-Linux.patch
 create mode 100644 package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch

--
1.9.3
