From: Andreas Naumann <anaumann@ultratronik.de>
Date: Sat, 11 Feb 2017 12:05:28 +0100
Subject: [Buildroot] [PATCH v2 0/3] poppler: Add option for Qt5 support
Message-ID: <1486811131-6172-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This explicitly adds poppler support for qt5. Since we depend on qt5 we dont
need to depend on individual toolchain requirements for Qt5.
However for supporting Qt >= 5.7 we need to use the -std=c++11 compiler option.

Should fix:
http://autobuild.buildroot.net/results/359/35916f2a34ec45ced3e30a25a680cbaa3a0aba6f/

Difference to v1 is an extra patch for renaming the qt5 version option and
apply the -std=c++11 in case of .._LATEST instead of not .._5_6.

Andreas Naumann (2):
  qt5: Rename version variable to include _PACKAGE_
  poppler: qt5 support needs c++11 (since Qt5.7)

Jens Kleintje (1):
  poppler: Add option for Qt5 support

 package/libv4l/libv4l.mk                               |  2 +-
 package/poppler/Config.in                              |  9 +++++++++
 package/poppler/poppler.mk                             | 11 +++++++++++
 package/qt5/Config.in                                  |  4 ++--
 package/qt5/qt5.mk                                     |  2 +-
 package/qt5/qt5base/qt5base.mk                         | 10 +++++-----
 package/qt5/qt5connectivity/qt5connectivity.mk         |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk           |  2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk         |  2 +-
 package/qt5/qt5location/qt5location.mk                 |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk             |  2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk                   |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk             |  2 +-
 package/qt5/qt5svg/qt5svg.mk                           |  2 +-
 package/qt5/qt5tools/qt5tools.mk                       |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk             |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk             |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk               |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |  2 +-
 21 files changed, 44 insertions(+), 24 deletions(-)

-- 
1.9.1
