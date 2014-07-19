From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sat, 19 Jul 2014 20:33:22 +0300
Subject: [Buildroot] [PATCH 0/6] qt5: dependency fixes
Message-ID: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes some dependency problems, adds a choice to select
OpenGL API and makes building of quick module optional. It should now be
possible to build Qt5 with desktop opengl.

Fatih A??c? (6):
  qt5multimedia: make qt5declarative dependency optional
  qt5base: allow selection of OpenGL API
  qt5declarative: add an option for quick module
  qt5: install qmls if quick module is selected
  qt5graphicaleffects: depend on quick module
  qt5quickcontrols: depend on quick module

 package/qt5/Config.in                          |  5 +++
 package/qt5/qt5base/Config.in                  | 46 ++++++++++++++++++++++++--
 package/qt5/qt5base/qt5base.mk                 | 18 +++++++---
 package/qt5/qt5connectivity/qt5connectivity.mk |  2 +-
 package/qt5/qt5declarative/Config.in           | 17 ++++++----
 package/qt5/qt5declarative/qt5declarative.mk   | 12 +++++--
 package/qt5/qt5enginio/qt5enginio.mk           |  2 +-
 package/qt5/qt5graphicaleffects/Config.in      | 11 +++---
 package/qt5/qt5multimedia/Config.in            | 10 ++----
 package/qt5/qt5multimedia/qt5multimedia.mk     |  6 +++-
 package/qt5/qt5quickcontrols/Config.in         | 12 +++----
 package/qt5/qt5sensors/qt5sensors.mk           |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk             |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk     |  2 +-
 14 files changed, 105 insertions(+), 42 deletions(-)

-- 
2.0.1
