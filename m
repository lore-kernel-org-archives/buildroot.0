From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:01 +0200
Subject: [Buildroot] [pull request] Pull request for branch xorg
Message-ID: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f917e6b21b262b6fb7ff363f6c7b217bb653d97c:
  Peter Korsgaard (1):
        toolchain/gcc: bump 4.4.x version

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot xorg

Thomas Petazzoni (13):
      xorg: reorganize the selection of the X.org server type
      xorg: reindent configuration option details
      xorg: remove useless configuration comment
      xorg: simplify dependencies on X.org
      midori: remove configuration comment on X.org dependency
      dillo: use select for library dependencies
      matchbox: fix dependencies
      xorg server: beautify list of dependencies
      xorg server: remove dependencies
      xorg: remove reference to non-existing BR2_PACKAGE_XSERVER_none
      xorg: use BR2_PACKAGE_XORG instead of BR2_PACKAGE_XSERVER_none
      xorg: remove references to non-existing configuration options
      xorg: remove the XSERVER variable

 package/Config.in                                  |   33 ----------
 package/Makefile.in                                |   15 -----
 package/atk/atk.mk                                 |    2 +-
 package/blackbox/Config.in                         |    2 +-
 package/blackbox/blackbox.mk                       |    2 +-
 package/cairo/cairo.mk                             |    4 +-
 package/cups/cups.mk                               |    2 +-
 package/dillo/Config.in                            |   15 ++---
 package/dillo/dillo.mk                             |    2 +-
 package/directfb/Config.in                         |    2 +-
 package/docker/Config.in                           |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/fltk/Config.in                             |    2 +-
 package/fltk/fltk.mk                               |    2 +-
 package/games/ace_of_penguins/Config.in            |    2 +-
 package/games/ace_of_penguins/ace_of_penguins.mk   |    2 +-
 package/games/lxdoom/Config.in                     |    2 +-
 package/java/classpath/classpath.mk                |    4 +-
 package/java/jamvm/jamvm.mk                        |    4 +-
 package/libgtk12/Config.in                         |    2 +-
 package/libgtk12/libgtk12.mk                       |    2 +-
 package/libgtk2/Config.in                          |    2 +-
 package/libgtk2/libgtk2.mk                         |    4 +-
 package/matchbox/Config.in                         |    1 -
 package/metacity/Config.in                         |    2 +-
 package/metacity/metacity.mk                       |    2 +-
 package/midori/Config.in                           |    5 +-
 package/midori/midori.mk                           |    2 +-
 package/pango/pango.mk                             |   20 +++---
 package/rdesktop/Config.in                         |    2 +-
 package/rdesktop/rdesktop.mk                       |    2 +-
 package/rxvt/Config.in                             |    2 +-
 package/rxvt/rxvt.mk                               |    2 +-
 package/synergy/synergy.mk                         |    2 +-
 package/x11r7/Config.in                            |   52 +++++++++++-----
 package/x11r7/xserver_xorg-server/Config.in        |    4 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |   62 +++++++++++++++----
 package/xpdf/xpdf.mk                               |    4 +-
 package/xvkbd/Config.in                            |    1 +
 package/xvkbd/xvkbd.mk                             |    2 +-
 40 files changed, 138 insertions(+), 140 deletions(-)

Thanks,
-- 
Thomas Petazzoni
