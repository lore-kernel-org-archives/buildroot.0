From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:07 +0200
Subject: [Buildroot] [PATCH 00/10] Bump skarnet packages to 2019.09 release
Message-ID: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps the skarnet.org packages to 2019.09 release [1] and
introduces mdevd, a udev replacement for s6-based systems.

[1] http://www.mail-archive.com/skaware at list.skarnet.org/msg01342.html

Eric Le Bihan (10):
  package/skalibs: bump version to 2.9.0.0
  package/execline: bump version to 2.5.2.0
  package/s6-portable-utils: bump version to 2.2.2.0
  package/s6-linux-utils: bump version to 2.5.1.0
  package/s6-dns: bump version to 2.3.1.0
  package/s6-networking: bump version to 2.3.1.0
  package/s6: bump version to 2.9.0.0
  package/s6-rc: bump version to 0.5.1.0
  package/s6-linux-init: bump version to 1.0.3.0
  package/mdevd: bump version to 0.1.1.0

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/execline/execline.hash                |   2 +-
 package/execline/execline.mk                  |   2 +-
 package/mdevd/Config.in                       |   9 ++
 package/mdevd/mdevd.hash                      |   3 +
 package/mdevd/mdevd.mk                        |  39 ++++++
 package/s6-dns/s6-dns.hash                    |   2 +-
 package/s6-dns/s6-dns.mk                      |   2 +-
 package/s6-linux-init/s6-linux-init.hash      |   2 +-
 package/s6-linux-init/s6-linux-init.mk        |   2 +-
 package/s6-linux-utils/s6-linux-utils.hash    |   2 +-
 package/s6-linux-utils/s6-linux-utils.mk      |   2 +-
 package/s6-networking/s6-networking.hash      |   2 +-
 package/s6-networking/s6-networking.mk        |   2 +-
 .../s6-portable-utils/s6-portable-utils.hash  |   2 +-
 .../s6-portable-utils/s6-portable-utils.mk    |   2 +-
 package/s6-rc/s6-rc.hash                      |   2 +-
 package/s6-rc/s6-rc.mk                        |   2 +-
 package/s6/s6.hash                            |   2 +-
 package/s6/s6.mk                              |   2 +-
 ...er-use-dummy-file-when-testing-libs.patch} |  10 +-
 ...0001-No-runtime-tests-for-endianness.patch |  96 ---------------
 ...0002-No-runtime-tests-for-type-sizes.patch | 115 ------------------
 package/skalibs/skalibs.hash                  |   2 +-
 package/skalibs/skalibs.mk                    |   3 +-
 26 files changed, 77 insertions(+), 234 deletions(-)
 create mode 100644 package/mdevd/Config.in
 create mode 100644 package/mdevd/mdevd.hash
 create mode 100644 package/mdevd/mdevd.mk
 rename package/skalibs/{0003-Make-linker-use-dummy-file-when-testing-libs.patch => 0001-Make-linker-use-dummy-file-when-testing-libs.patch} (89%)
 delete mode 100644 package/skalibs/0001-No-runtime-tests-for-endianness.patch
 delete mode 100644 package/skalibs/0002-No-runtime-tests-for-type-sizes.patch

--
2.21.0
