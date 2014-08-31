From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 22:09:02 +0200
Subject: [Buildroot] [PATCH v3 0/8] OpenCV improvement
Message-ID: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[series formerly named "scientific packages"]

Hi all,

Here is a couple of improvement in OpenCV package and its reverse
dependencies.

Except the last patch (which fixes an autobuilder failure) , all the
others patches were originally issued within the "scientific packages"
series, but now only concerns OpenCV; hence the renaming of the series.

Cheers,


Samuel Martin (8):
  opencv: rework V4L/libv4l support
  opencv: add Qt5 support
  opencv: add python/numpy support
  opencv: define modules inter-dependencies
  opencv: add hidden symbol BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
  vlc: add opencv support
  gst1-plugins-bad: rework opencv plugin dependencies
  package/opencv: fix ts module missing dependency to highgui

 package/gstreamer1/gst1-plugins-bad/Config.in      |  10 +-
 package/opencv/Config.in                           | 146 ++++++++++++++++-----
 ...01-fix-cross-compilation-issue-with-Numpy.patch |  74 +++++++++++
 ...-ts-add-missing-opencv_highgui-dependency.patch |  26 ++++
 package/opencv/opencv.mk                           |  32 ++++-
 package/vlc/Config.in                              |   1 +
 package/vlc/vlc.mk                                 |   7 +
 7 files changed, 247 insertions(+), 49 deletions(-)
 create mode 100644 package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
 create mode 100644 package/opencv/opencv-0002-modules-ts-add-missing-opencv_highgui-dependency.patch

--
2.1.0
