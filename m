From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 23:03:19 +0200
Subject: [Buildroot] [PATCH 00/27] Microblaze clean up
Message-ID: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series works around various Gcc bugs and re-enables Microblaze
packages depending on these work-arounds. It also fixes some little build
bugs considered as Gcc bugs and some package has been re-enabled because
its build failure was due to very very old toolchains.

Note that this patchset is not splitted into smaller patchset because of
packages dependencies and it would have been more difficult to understand
the sequence of all the patches.

Giulio Benetti (27):
  package/keyutils: re-enable package on microblaze
  package/ecryptfs-utils: re-enable package on microblaze
  package/libnss: use correct CFLAGS and LDFLAGS
  package/libnss: re-enable package on microblaze
  package/ecryptfs-utils: remove libnss gcc bug dependency
  package/stress-ng: re-enable package on microblaze
  package/bullet: re-enable package when gcc bug 85180 is present
  package/boost: allow building on microblaze
  package/boost: work around gcc bug 85180 for boost-fiber option
  package/snort: work around gcc bug 85180
  package/prboom: avoid using hardcoded optimization flags
  package/prboom: work around gcc bug 85180
  package/kmsxx: work around gcc bug 85180
  package/gpsd: use common BR2_TOOLCHAIN_HAS_GCC_BUG_68485
  package/flann: re-enable package on microblaze
  package/libspatialindex: use common BR2_TOOLCHAIN_HAS_BUG_68485
  package/lua-cqueues: fix build failure due to Gcc Bug 68485
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_63261
  package/fxload: re-enable package on microblaze
  package/dmalloc: re-enable package on microblaze
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_90620
  package/haproxy: re-enable package on microblaze
  package/tvheadend: fix PIE build failures
  package/tvheadend: re-enable package on microblaze
  package/qt5/qt5webengine: re-enable building if BUG_85682=y on Qt5
    Latest
  package/sqlite: work around build timeout
  package/flashbench: remove old toolchain microblaze & sh2a workaround

 package/boost/Config.in                       |  6 ++--
 package/boost/boost.mk                        |  4 +++
 package/bullet/Config.in                      |  4 ---
 package/bullet/bullet.mk                      |  4 +++
 package/dmalloc/Config.in                     |  4 ---
 package/dmalloc/dmalloc.mk                    |  4 +++
 package/ecryptfs-utils/Config.in              |  6 ----
 package/flann/Config.in                       |  4 ---
 package/flann/flann.mk                        |  4 +++
 package/flashbench/flashbench.mk              |  9 +----
 package/fxload/Config.in                      |  4 ---
 package/fxload/fxload.mk                      |  9 ++++-
 package/gpsd/gpsd.mk                          |  5 +--
 package/haproxy/Config.in                     |  2 --
 package/haproxy/haproxy.mk                    |  9 ++++-
 package/keyutils/Config.in                    |  2 --
 package/kmsxx/kmsxx.mk                        |  8 +++++
 package/libnss/Config.in                      |  4 ---
 package/libnss/libnss.mk                      | 16 +++++++--
 package/libspatialindex/libspatialindex.mk    |  4 +--
 package/lua-cqueues/lua-cqueues.mk            |  9 ++++-
 package/prboom/prboom.mk                      | 15 ++++++++
 package/qt5/qt5webengine/Config.in            |  6 ----
 package/snort/snort.mk                        |  4 +++
 package/sqlite/sqlite.mk                      |  6 ++++
 package/stress-ng/Config.in                   |  3 +-
 ...pie-linking-according-to-disable-pie.patch | 34 +++++++++++++++++++
 package/tvheadend/Config.in                   |  2 --
 package/tvheadend/tvheadend.mk                |  4 +++
 toolchain/Config.in                           | 15 ++++++++
 30 files changed, 147 insertions(+), 63 deletions(-)
 create mode 100644 package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch

-- 
2.17.1
