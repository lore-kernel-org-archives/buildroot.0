From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:32 +0200
Subject: [Buildroot] [PATCH v2 00/24] Scientific libraries
Message-ID: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Here is the 2nd round of the Scientific libraries series, which contains a
couple of new scientific packages, among these python Numpy, a bump of OpenCV
and some fixes/refactoring in OpenCV reverse dependencies.

Unlike the 1st post of this series, this new round is largely dominated by
OpenCV change sets, which have been heavily chainsawed to make easier the review
process. ;)


Yours,
Samuel

Samuel Martin (24):
  qt: add an option to install the test module
  opencv: fix qt selection when highgui is enable
  armadillo: new package
  clapack: new package
  python-numpy: new package
  python-numpy: add optional blas/lapack support
  opencv: bump to version 2.4.8
  opencv: add license details
  opencv: sort and reorder CMake configuration flags
  opencv: sort and reorder HW support options
  opencv: sort and reorder SW support options
  opencv: add superres module knob
  opencv: disable apps module
  opencv: disable opencl support/module
  opencv: disable OpenMP support
  opencv: enable SSE4.1 SSE4.2 support when available
  opencv: rework V4L/libv4l support
  opencv: add jasper support
  opencv: add Qt5 support
  opencv: add python/numpy support
  opencv: define modules inter-dependencies
  opencv: add hidden symbol BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
  vlc: add opencv support
  gst1-plugins-bad: rework opencv plugin dependencies

 package/Config.in                                  |   3 +
 package/armadillo/Config.in                        |  12 ++
 package/armadillo/armadillo.mk                     |  15 ++
 package/clapack/Config.in                          |  18 ++
 ...ce-libf2c-to-be-built-as-a-static-library.patch |  32 ++++
 ...ake-test-build-sensitive-to-BUILD_TESTING.patch |  80 +++++++++
 ...t-try-to-run-arithchk-when-cross-compilin.patch |  70 ++++++++
 ...blas-add-library-and-header-install-rules.patch |  23 +++
 ...pack-add-library-and-header-install-rules.patch |  24 +++
 package/clapack/clapack.mk                         |  23 +++
 package/gstreamer1/gst1-plugins-bad/Config.in      |  10 +-
 package/opencv/Config.in                           | 161 ++++++++++++++----
 ...01-fix-cross-compilation-issue-with-Numpy.patch |  71 ++++++++
 package/opencv/opencv.mk                           | 189 +++++++++++++++------
 package/python-numpy/Config.in                     |   8 +
 package/python-numpy/python-numpy.mk               |  48 ++++++
 package/qt/Config.in                               |   5 +
 package/qt/qt.mk                                   |   3 +
 package/vlc/Config.in                              |   1 +
 package/vlc/vlc.mk                                 |   7 +
 20 files changed, 712 insertions(+), 91 deletions(-)
 create mode 100644 package/armadillo/Config.in
 create mode 100644 package/armadillo/armadillo.mk
 create mode 100644 package/clapack/Config.in
 create mode 100644 package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
 create mode 100644 package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
 create mode 100644 package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
 create mode 100644 package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch
 create mode 100644 package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch
 create mode 100644 package/clapack/clapack.mk
 create mode 100644 package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
 create mode 100644 package/python-numpy/Config.in
 create mode 100644 package/python-numpy/python-numpy.mk

--
1.9.2
