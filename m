From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  8 Mar 2015 10:47:19 +0100
Subject: [Buildroot] [PATCH 0/4] CMake package and infra improvements
Message-ID: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short CMake related series.

The first 2 patches improve the cmake package, and the last ones fix cmake infrastructure.

Regards,

Samuel
--

Davide Viti (1):
  package/cmake: make ctest a target package too

Samuel Martin (3):
  package/cmake: only build what is necessary
  toolchainfile.cmake: only search the sysroot for CMake module
  toolchainfile.cmake: set CXX variables wrt BR2_INSTALL_LIBSTDCPP value

 package/Config.in                                  |   1 +
 package/cmake/0001-rename_cmake_rootfile.patch     |  23 ++
 ...-allow-to-select-what-program-to-be-built.patch | 231 +++++++++++++++++++++
 package/cmake/Config.in                            |  14 ++
 package/cmake/cmake.mk                             |  36 ++++
 package/pkg-cmake.mk                               |   1 +
 support/misc/toolchainfile.cmake.in                |  34 ++-
 7 files changed, 334 insertions(+), 6 deletions(-)
 create mode 100644 package/cmake/0001-rename_cmake_rootfile.patch
 create mode 100644 package/cmake/0002-CMake-allow-to-select-what-program-to-be-built.patch
 create mode 100644 package/cmake/Config.in

--
2.3.2
