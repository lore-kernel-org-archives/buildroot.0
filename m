From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:41 +0200
Subject: [Buildroot] [PATCH v6 00/16] OpenCV bump
Message-ID: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

Here is yet another iteration for the bump of OpenCV package, and
related features/packages.

Patches 1 cleans up the current opencv.mk file.
Patch 2 does the actual bump.
Patch 3 disables gst1-plugins-opencv.
Patch 4 fixes a long-standing issue in the OpenCV integration.
Patch 5 to 7 polish opencv menu.
Patches 8 to 15 add/improve 3rd-party supports.
Patches 16 fix reverse dependency (vlc).

Note that, if merged, patch 7/16 can/will break defconfigs having opencv
selected.

This series has been run in a local autobuilder, triggering more build
failures. A patch adding an exception for this series will be issued
soon...


Changes v5 -> v6:
- fix more build failures;
- rework opencv menu for gstreamer and GUI toolkit;
- and of course, all comments done in the previous round.

(Per-commit changelog append in each patch.)


Regards,


Samuel Martin (16):
  package/opencv: alphabetically sorted each _CONF_OPTS group
  package/opencv: bump to version 3.0
  package/gstreamer1/gst1-plugins-bad: disable opencv plugin with
    opencv-3
  package/opencv: define modules inter-dependencies
  package/opencv: reword modules' prompt and help text
  package/opencv: reduce modules on by default
  package/opencv: disable all modules by default
  package/opencv: add python support
  package/opencv: add a choice for selecting gstreamer support
  package/opencv: add gstreamer-1.x support
  package/opencv: add openmp support
  package/opencv: add a choice for selecting the gui toolkit
  package/opencv: add qt5 support
  package/opencv: add gtk3 support
  package/opencv: add opengl support
  package/vlc: add opencv support

 Config.in.legacy                                   |  32 +++
 package/gstreamer1/gst1-plugins-bad/Config.in      |  14 +-
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |  62 +++++
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 ----
 ...002-fix-support-for-pthreads-parallel_for.patch | 212 +++++++++++++++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 ---
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 -----------
 package/opencv/Config.in                           | 293 +++++++++++++++------
 package/opencv/opencv.mk                           | 181 ++++++++++---
 ...opencv_wrapper-use-opencv2-style-includes.patch |  36 +++
 ...cv_example-add-missing-include-statements.patch |  29 ++
 package/vlc/Config.in                              |   2 +
 package/vlc/vlc.mk                                 |   8 +-
 13 files changed, 746 insertions(+), 368 deletions(-)
 create mode 100644 package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
 delete mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0002-fix-support-for-pthreads-parallel_for.patch
 delete mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 delete mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 create mode 100644 package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
 create mode 100644 package/vlc/0009-opencv_example-add-missing-include-statements.patch

--
2.4.4
