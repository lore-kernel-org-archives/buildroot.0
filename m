From: Bradford Barr <bradford@density.io>
Date: Thu, 28 Sep 2017 19:50:41 -0400
Subject: [Buildroot] [PATCH v2 0/2] TBB and OpenCV3
Message-ID: <20170928235043.31891-1-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

Updated patches for tbb and tbb support in opencv3. The tbb build system isn't
very friendly to cross compiling. The `arch=$(BR2_ARCH)' is mostly used by the
build system to generate a build directory.

I pulled in the 0001-cross-compile.patch from yocto and added a signed-off by.
I hope that's right. 

Running test-pkg against tbb helped me figure out that pretty much everything
that uses glibc will compile cleanly.

The tbb package only supplies dynamic libraries, no static libraries. It also
does not create symlinks for the its libraries, those had to be generated
manually.

The `0001-tbb-debug.patch' for opencv3 has been submitted upstream. and can be
found here[1].

I hope I didn't miss anything this time around.

[1]: https://github.com/opencv/opencv/pull/9743

bradford barr (2):
  tbb: new package
  opencv3: add support for tbb

 package/Config.in                    |  1 +
 package/opencv3/0001-tbb-debug.patch | 27 +++++++++++++++++++
 package/opencv3/Config.in            |  6 +++++
 package/opencv3/opencv3.mk           | 12 +++++++--
 package/tbb/0001-cross-compile.patch | 41 +++++++++++++++++++++++++++++
 package/tbb/Config.in                | 16 ++++++++++++
 package/tbb/tbb.hash                 |  2 ++
 package/tbb/tbb.mk                   | 50 ++++++++++++++++++++++++++++++++++++
 8 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 package/opencv3/0001-tbb-debug.patch
 create mode 100644 package/tbb/0001-cross-compile.patch
 create mode 100644 package/tbb/Config.in
 create mode 100644 package/tbb/tbb.hash
 create mode 100644 package/tbb/tbb.mk

-- 
2.9.3
