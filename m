From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:26 +0200
Subject: [Buildroot] [PATCH v5 00/13] OpenCV bump
Message-ID: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is another round for the bump of OpenCV package, and related
features/packages.

Patches 1 and 2 clean-up the current opencv.mk file.
Patch 3 does the actual bump
Patch 4 fixes a long-standing issue in the OpenCV integration.
Patch 5 improves the OpenCV menu.
Patches 6 to 11 add/improve 3rd-party supports.
Patches 12 and 13 fix reverse dependencies (vlc and gst1-plugins-bad).

Regards,

Samuel


Samuel Martin (13):
  package/opencv: cleanup spaces at ends of line
  package/opencv: alphabetically sorted each _CONF_OPTS group
  package/opencv: bump to version 3.0
  package/opencv: define modules inter-dependencies
  package/opencv: reword modules' prompt and help text
  package/opencv: add qt5 support
  package/opencv: add python support
  package/opencv: add gstreamer-1.x support
  package/opencv: add opengl support
  package/opencv: add openmp support
  package/opencv: add gtk3 support
  package/vlc: add opencv support
  package/gstreamer1/gst1-plugins-bad: disable opencv plugin with
    opencv-3

 Config.in.legacy                                   |  16 ++
 package/gstreamer1/gst1-plugins-bad/Config.in      |   1 +
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 ----
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 ----
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 -------------
 package/opencv/Config.in                           | 235 ++++++++++++++------
 package/opencv/opencv.mk                           | 247 ++++++++++++++-------
 ...opencv_wrapper-use-opencv2-style-includes.patch |  34 +++
 ...cv_example-add-missing-include-statements.patch |  27 +++
 package/vlc/Config.in                              |   2 +
 package/vlc/vlc.mk                                 |   8 +-
 11 files changed, 425 insertions(+), 390 deletions(-)
 delete mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 delete mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 delete mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 create mode 100644 package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
 create mode 100644 package/vlc/0009-opencv_example-add-missing-include-statements.patch

--
2.4.2
