From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Aug 2015 14:50:38 +0200
Subject: [Buildroot] [PATCH 0/4] OpenCV: re-introduce opencv-2.4 package
Message-ID: <1439124642-26266-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noticed in [1], users' applications may depend on OpenCV-2.4 APIs, but
incompatible with OpenCV-3.

This short series first renames the opencv package to opencv3, then
re-introduces the opencv one for OpenCV-2.4 as discussed in [2], and lastly
handle the reverse dependencies in the last 2 patches.

[1] http://lists.busybox.net/pipermail/buildroot/2015-August/135270.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-August/137133.html

Regards,

Samuel

Samuel Martin (4):
  package: rename opencv -> opencv3
  package/opencv: re-introduce opencv for opencv-2.4
  Revert "package/gstreamer1/gst1-plugins-bad: disable opencv plugin
    with opencv-3"
  package/vlc: update opencv support

 Config.in.legacy                                   |  32 ---
 package/Config.in                                  |   1 +
 package/gstreamer1/gst1-plugins-bad/Config.in      |  15 +-
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 ++++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 +++
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 ++++++++++++
 package/opencv/Config.in                           | 277 ++++++---------------
 package/opencv/opencv.mk                           | 151 ++---------
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |   0
 ...002-fix-support-for-pthreads-parallel_for.patch |   0
 package/{opencv => opencv3}/Config.in              | 150 +++++------
 package/{opencv/opencv.mk => opencv3/opencv3.mk}   | 230 ++++++++---------
 package/vlc/Config.in                              |  14 +-
 package/vlc/vlc.mk                                 |   6 +-
 14 files changed, 565 insertions(+), 556 deletions(-)
 create mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 create mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 rename package/{opencv => opencv3}/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch (100%)
 rename package/{opencv => opencv3}/0002-fix-support-for-pthreads-parallel_for.patch (100%)
 copy package/{opencv => opencv3}/Config.in (70%)
 copy package/{opencv/opencv.mk => opencv3/opencv3.mk} (55%)

--
2.5.0
