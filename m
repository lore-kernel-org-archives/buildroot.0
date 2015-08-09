From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Aug 2015 18:14:53 +0200
Subject: [Buildroot] [PATCH 0/4 v2] OpenCV: re-introduce opencv-2.4 package
	(branch yem/sma/opencv3-opencv24)
Message-ID: <cover.1439136753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As noticed in [1], users' applications may depend on OpenCV-2.4 APIs,
which are incompatible with OpenCV-3.

This short series first renames the opencv package to opencv3, then
re-introduces the opencv one for OpenCV-2.4 as discussed in [2], and
lastly handle the reverse dependencies in the last 2 patches.

[1] http://lists.busybox.net/pipermail/buildroot/2015-August/135270.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-August/137133.html

Changes v1 -> v2: (Yann)
  - only remove legacy symbols once opnecv24 has been re-introduced
  - fix a missed rename in vlc, patch 1
  - make opencv3 depends on !opencv, not the othe way around
  - fix and comment dependencies in gst1-plugins-bad


Regards,
Yann E. MORIN.


The following changes since commit 4a5f878946c37deb8c1785fb8363cd1d322f7436:

  toolchain/external: better check for gcc-5 (2015-08-09 16:58:55 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/sma/opencv3-opencv24

for you to fetch changes up to 927987bbdcc79cc1a299cf2a1ba052a6ae82b702:

  package/vlc: update opencv support (2015-08-09 18:08:19 +0200)

----------------------------------------------------------------
Samuel Martin (4):
      package: rename opencv -> opencv3
      package/opencv: re-introduce opencv for opencv-2.4
      Revert "package/gstreamer1/gst1-plugins-bad: disable opencv plugin with opencv-3"
      package/vlc: update opencv support

 Config.in.legacy                                   |  32 --
 package/Config.in                                  |   1 +
 package/gstreamer1/gst1-plugins-bad/Config.in      |  19 +-
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 +++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 +++
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 +++++++++
 package/opencv/Config.in                           | 278 +++++-----------
 package/opencv/opencv.mk                           | 151 ++-------
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |   0
 ...002-fix-support-for-pthreads-parallel_for.patch |   0
 package/opencv3/Config.in                          | 344 +++++++++++++++++++
 package/opencv3/opencv3.mk                         | 363 +++++++++++++++++++++
 package/vlc/Config.in                              |  14 +-
 package/vlc/vlc.mk                                 |   6 +-
 14 files changed, 1084 insertions(+), 369 deletions(-)
 create mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 create mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 rename package/{opencv => opencv3}/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch (100%)
 rename package/{opencv => opencv3}/0002-fix-support-for-pthreads-parallel_for.patch (100%)
 create mode 100644 package/opencv3/Config.in
 create mode 100644 package/opencv3/opencv3.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
