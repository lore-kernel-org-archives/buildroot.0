From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Feb 2021 15:12:49 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce BR2_ENABLE_RUNTIME_DEBUG
Message-ID: <20210210141256.6438-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

This patch series started with as main goal to fix the performance degradation
found when testing gRPC in combination with BR2_ENABLE_DEBUG.

Its implementation strives to settle a discussion that has happened several
times, regarding the CMAKE_BUILD_TYPE that Buildroot should set, by not forcing
anything upon the user but allowing the choice.

Additionally, it cleans up some related changes done in specific packages.

After this series, there are still packages that set CMAKE_BUILD_TYPE
explicitly, but the associated comments indicate that they are needed to avoid
build failures, so they are not touched.

Best regards,
Thomas


Thomas De Schampheleire (7):
  core: introduce BR2_ENABLE_RUNTIME_DEBUG
  core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set
  package/pkg-cmake.mk: determine CMAKE_BUILD_TYPE depending on
    BR2_ENABLE_RUNTIME_DEBUG
  package/libjson: drop explicit '-DNDEBUG'
  package/flare-engine: remove explicit setting of CMAKE_BUILD_TYPE
  package/supertux: remove explicit setting of CMAKE_BUILD_TYPE
  package/sysrepo: remove explicit setting of CMAKE_BUILD_TYPE

 Config.in                             | 13 +++++++++++++
 docs/manual/adding-packages-cmake.txt |  2 +-
 package/Makefile.in                   |  3 +++
 package/flare-engine/flare-engine.mk  |  5 -----
 package/libjson/libjson.mk            |  2 +-
 package/pkg-cmake.mk                  |  2 +-
 package/supertux/supertux.mk          |  2 --
 package/sysrepo/sysrepo.mk            |  2 --
 8 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.26.2
