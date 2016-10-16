From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Oct 2016 13:12:36 +0200
Subject: [Buildroot] [PATCH v6 0/9] Misc. CMake fixes
Message-ID: <20161016111245.1847-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series reworking the way the Buildroot's CMake
infrastructure handles compiler/linker flags.

Patch 1 to 3 fix the optimization and debug flags passed/set by CMake
through the toolchainfile.cmake file.

Patches 4 to 8 clean up CMake-based package regarding {C,CXX,LD}FLAGS.

Patch 9 reworks the way the compiler/linker flags are set in
toolchainfile.cmake.

Regards,
Sam


Max Filippov (1):
  package/opencv3: fix CMAKE_CXX_FLAGS

Samuel Martin (8):
  Revert "package/cmake: with BR2_ENABLE_DEBUG use RelWithDebInfo"
  package/pkg-cmake.mk: move CMAKE_BUILD_TYPE definition into
    toolchainfile.cmake
  toolchainfile.cmake: set per-config appended {C,CXX}FLAGS
  package/gflags: include TARGET_CXXFLAGS to the overloaded CXXFLAGS
  package/gnuradio: include TARGET_CFLAGS to the overloaded CFLAGS
  package/libcec: include TARGET_{C,CXX}FLAGS to the overloaded
    {C,CXX}FLAGS
  package/rpi-userland: include TARGET_CFLAGS to the overloaded CFLAGS
  toochainfile.cmake: rework the way Buildroot sets flags

 CHANGES                              |  9 +++++++++
 package/gflags/gflags.mk             |  3 ++-
 package/gnuradio/gnuradio.mk         |  2 +-
 package/libcec/libcec.mk             |  5 +++--
 package/opencv3/opencv3.mk           |  2 +-
 package/pkg-cmake.mk                 |  2 +-
 package/rpi-userland/rpi-userland.mk |  3 ++-
 support/misc/toolchainfile.cmake.in  | 31 +++++++++++++++++++++++++++----
 8 files changed, 46 insertions(+), 11 deletions(-)

--
2.10.0
