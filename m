From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 22:59:53 +0100
Subject: [Buildroot] [PATCH 00/11] Scientific libraries
Message-ID: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Here is a series containing the bump of OpenCV and some new scientific
packages, among these python Numpy.

The OpenCV bump comes with a couple of refactoring and fixes (in
OpenCV itself and some of its reverse-dependencies).

This series targets (and has been rebased on) the branch next, but
prior to its integration, it also requires:
- cherry-picking the following commit in then branch next:
  commit e78d357551f3191fee7b6bcc18dfd8514819cab
    opencv: always enable opencv_core module when opencv is enabled
- and applying the following patches:
  http://patchwork.ozlabs.org/patch/312315/
  http://patchwork.ozlabs.org/patch/312316/


Yours,
Samuel


Samuel Martin (11):
  opencv: bump to version 2.4.8
  opencv: rework V4L/libv4l support
  opencv: add jasper support
  opencv: add Qt5 support
  clapack: new package
  armadillo: new package
  python-numpy: new package
  python-numpy: add install-staging command
  opencv: add python/numpy support
  opencv: define modules inter-dependencies
  vlc: add opencv support

 package/Config.in                                  |   3 +
 package/armadillo/Config.in                        |   9 ++
 package/armadillo/armadillo.mk                     |  15 ++
 package/clapack/Config.in                          |  18 +++
 ...ce-libf2c-to-be-built-as-a-static-library.patch |  32 +++++
 ...ake-test-build-sensitive-to-BUILD_TESTING.patch |  80 +++++++++++
 ...t-try-to-run-arithchk-when-cross-compilin.patch |  70 ++++++++++
 ...blas-add-library-and-header-install-rules.patch |  23 ++++
 ...pack-add-library-and-header-install-rules.patch |  24 ++++
 package/clapack/clapack.mk                         |  20 +++
 package/opencv/Config.in                           | 146 ++++++++++++++++----
 ...t-run-python-for-numpy-detection-when-cro.patch |  77 +++++++++++
 package/opencv/opencv.mk                           | 152 ++++++++++++++++-----
 package/python-numpy/Config.in                     |  14 ++
 package/python-numpy/python-numpy.mk               |  48 +++++++
 package/vlc/vlc.mk                                 |   7 +
 16 files changed, 671 insertions(+), 67 deletions(-)
 create mode 100644 package/armadillo/Config.in
 create mode 100644 package/armadillo/armadillo.mk
 create mode 100644 package/clapack/Config.in
 create mode 100644 package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
 create mode 100644 package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
 create mode 100644 package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
 create mode 100644 package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch
 create mode 100644 package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch
 create mode 100644 package/clapack/clapack.mk
 create mode 100644 package/opencv/opencv-0001-cmake-do-not-run-python-for-numpy-detection-when-cro.patch
 create mode 100644 package/python-numpy/Config.in
 create mode 100644 package/python-numpy/python-numpy.mk

--
1.8.5.4
