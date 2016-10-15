From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 11:44:29 +0200
Subject: [Buildroot] [PATCH v3 0/8] Misc. CMake fixes
Message-ID: <20161015094437.6989-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series reworking the way the Buildroot's CMake
infrastructure handles compiler/linker flags.

Patch 1 fixes the optimization and debug flags passed/set by CMake.

Patches 2 to 6 clean up CMake-based package regarding {C,CXX,LD}FLAGS.

Patch 7 reworks the way the compiler/linker flags are set in
toolchainfile.cmake.

Regards,
Sam


Max Filippov (1):
  package/opencv3: fix CMAKE_CXX_FLAGS

Samuel Martin (7):
  package/pkg-cmake.mk: fix build type and optimization flags
  package/assimp: wrap long lines
  package/gflags: includes TARGET_CXXFLAGS to the overloaded CXXFLAGS
  package/gnuradio: includes TARGET_CFLAGS to the overloaded CFLAGS
  package/libcec: includes TARGET_{C,CXX}FLAGS to the overloaded
    {C,CXX}FLAGS
  package/rpi-userland: includes TARGET_CFLAGS to the overloaded CFLAGS
  toochainfile.cmake: rework the way Buildroot sets flags

 CHANGES                              |  6 ++++++
 package/assimp/assimp.mk             |  3 ++-
 package/gflags/gflags.mk             |  3 ++-
 package/gnuradio/gnuradio.mk         |  2 +-
 package/libcec/libcec.mk             |  5 +++--
 package/opencv3/opencv3.mk           |  2 +-
 package/pkg-cmake.mk                 | 12 +++++++++++-
 package/rpi-userland/rpi-userland.mk |  3 ++-
 support/misc/toolchainfile.cmake.in  | 14 ++++++++++----
 9 files changed, 38 insertions(+), 12 deletions(-)

--
2.10.0
