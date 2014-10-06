From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:17 +0200
Subject: [Buildroot] [PATCH v4 0/9] OpenCV improvement
Message-ID: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a couple of improvement in OpenCV package and its reverse
dependencies.

Cheers,

Samuel Martin (9):
  package/opencv: update opencv options after last version bump
  package/opencv: add Qt5 support
  package/opencv: add python/numpy support
  package/opencv: add Gstreamer-1 support
  package/opencv: define modules inter-dependencies
  package/opencv: add hidden symbol
    BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
  package/opencv: fix opencv.pc file generation
  package/vlc: add opencv support
  package/gstreamer1/gst1-plugins-bad: rework opencv plugin dependencies

 package/gstreamer1/gst1-plugins-bad/Config.in      |  10 +-
 package/opencv/Config.in                           | 164 +++++++++++++++++----
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 ++++++++++++++++++++
 ...0002-cmake-fix-gstreamer-check-conditions.patch |  78 ++++++++++
 package/opencv/opencv.mk                           |  39 ++++-
 package/vlc/Config.in                              |   1 +
 package/vlc/vlc.mk                                 |   7 +
 7 files changed, 410 insertions(+), 45 deletions(-)
 create mode 100644 package/opencv/opencv-0001-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 create mode 100644 package/opencv/opencv-0002-cmake-fix-gstreamer-check-conditions.patch

--
2.1.2
