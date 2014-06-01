From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:22 +0200
Subject: [Buildroot] [PATCH v4 00/11] CMake infrastructure refactoring
Message-ID: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is another series about the CMake infrastructure.

No big change in here, except that now the toolchainfile.cmake file
is templated instead of being generated.

Yours,
Samuel

Samuel Martin (11):
  pkg-cmake.mk: refactor the toolchainfile.cmake generation
  pkg-cmake.mk: do not hardcode absolute path in toolchainfile.cmake
  pkg-cmake.mk: enable ccache for cmake packages
  rpi-userland: cleanup *_CONF_OPT
  xbmc: fix missing libraries from rpi-userland
  pkg-cmake.mk: globally disable BUILD_TESTING flag
  pkg-cmake.mk: globally drive the CMAKE_BUILD_TYPE flag using
    BR2_ENABLE_DEBUG
  openpowerlink: do not override CMAKE_BUILD_TYPE
  opencv: do not override CMAKE_BUILD_TYPE
  flann: do not override CMAKE_BUILD_TYPE
  qhull: do not override CMAKE_BUILD_TYPE

 package/flann/flann.mk                 |  1 -
 package/opencv/opencv.mk               |  1 -
 package/openpowerlink/openpowerlink.mk |  6 ----
 package/pkg-cmake.mk                   | 31 ++++++++++---------
 package/qhull/qhull.mk                 |  1 -
 package/rpi-userland/rpi-userland.mk   |  2 +-
 package/xbmc/xbmc.mk                   |  3 +-
 support/misc/toolchainfile.cmake.in    | 56 ++++++++++++++++++++++++++++++++++
 8 files changed, 76 insertions(+), 25 deletions(-)
 create mode 100644 support/misc/toolchainfile.cmake.in

--
1.9.2
