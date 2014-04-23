From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:19 +0200
Subject: [Buildroot] [PATCH 00/14] CMake infrastructure refactoring
Message-ID: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a series reviving a couple of patches (pending for a long while in
patchwork) about the CMake infrastructure (patch 4/14 and 5/14) and some new
ones cleaning up this infrastructure, so some packages as well.

Yours,
Samuel

Samuel Martin (14):
  pkg-cmake.mk: replace "echo -en" with printf
  pkg-cmake.mk: remove unneeded quotes in the generated
    toolchainfile.cmake
  pkg-cmake.mk: rework toolchainfile.cmake
  pkg-cmake.mk: do not hardcode absolute path in toolchainfile.cmake
  pkg-cmake.mk: enable ccache for cmake packages
  pkg-cmake.mk: cosmetic changes in the generated toolchainfile.cmake
    file
  pkg-cmake.mk: set additional variables in toolchainfile.cmake
  rpi-userland: cleanup *_CONF_OPT
  pkg-cmake.mk: globally disable BUILD_TESTING flag
  pkg-cmake.mk: globally drive the CMAKE_BUILD_TYPE flag using
    BR2_ENABLE_DEBUG
  openpowerlink: do not override CMAKE_BUILD_TYPE
  opencv: do not override CMAKE_BUILD_TYPE
  flann: do not override CMAKE_BUILD_TYPE
  qhull: do not override CMAKE_BUILD_TYPE

 package/flann/flann.mk                 |  1 -
 package/opencv/opencv.mk               |  1 -
 package/openpowerlink/openpowerlink.mk |  6 ---
 package/pkg-cmake.mk                   | 80 ++++++++++++++++++++++++++++------
 package/qhull/qhull.mk                 |  1 -
 package/rpi-userland/rpi-userland.mk   |  2 +-
 6 files changed, 67 insertions(+), 24 deletions(-)

--
1.9.2
