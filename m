From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:26 +0200
Subject: [Buildroot] [PATCH 00/12] Google Code: Change site
Message-ID: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

For thoses of you that don't know, Google Code will be read-only by
August and close its door at the end of the year. The sources will
remain online for a full year and then it's gone.

Some projects have already moved on, this series bump/change the site of
theses projects.

A few are still on Google Code, they seems pretty abandonned, so a
decision will be needed regarding theses. Switch to Alioth ? Look for a
fork ?

Maxime Hadjinlian (12):
  zxing_cpp: New package
  yaml-cpp: Bump version and change site
  libass: Bump version and change site
  explorercanvas: Bump version and change site
  libfreefare: Bump version and change site
  libiscsi: Bump version
  libllcp: Bump version and change site
  libnfc: Bump version and change site
  python-pycrc16: Change site
  python-dpkt: Bump version and change site
  python-pypcap: Bump version and change site
  qextserialport: Bump version and change site

 Config.in.legacy                                   |  8 +++
 package/Config.in                                  |  2 +-
 package/explorercanvas/explorercanvas.hash         |  2 -
 package/explorercanvas/explorercanvas.mk           | 12 +---
 package/libass/libass.hash                         |  4 +-
 package/libass/libass.mk                           |  6 +-
 package/libfreefare/libfreefare.hash               |  2 +
 package/libfreefare/libfreefare.mk                 |  7 +-
 ...01-Fix-warnings-related-to-subdir-objects.patch | 46 ------------
 ...tool-AM_PROG_AR-warning-during-autoreconf.patch | 42 -----------
 ...0003-Fix-CUnit-test-for-cross-compilation.patch | 56 ---------------
 ...4-examples-fix-uint64_t-formatting-issues.patch | 49 -------------
 ...005-ld_iscsi-fix-largefile-related-issues.patch | 83 ----------------------
 ...nly-build-the-test-tool-and-ld-iscsi-iff-.patch | 55 --------------
 package/libiscsi/libiscsi.hash                     |  3 +
 package/libiscsi/libiscsi.mk                       |  7 +-
 package/libllcp/libllcp.mk                         |  5 +-
 package/libnfc/libnfc.hash                         |  3 +
 package/libnfc/libnfc.mk                           |  6 +-
 package/python-crc16/python-crc16.mk               |  3 +-
 package/python-dpkt/python-dpkt.mk                 |  5 +-
 package/python-pypcap/python-pypcap.mk             |  5 +-
 package/qextserialport/qextserialport.mk           |  7 +-
 package/yaml-cpp/yaml-cpp.hash                     |  5 --
 package/yaml-cpp/yaml-cpp.mk                       |  4 +-
 package/{zxing => zxing-cpp}/Config.in             | 10 +--
 package/zxing-cpp/zxing-cpp.mk                     | 33 +++++++++
 package/zxing/0001-makefile.patch                  | 30 --------
 package/zxing/zxing.mk                             | 40 -----------
 29 files changed, 86 insertions(+), 454 deletions(-)
 delete mode 100644 package/explorercanvas/explorercanvas.hash
 create mode 100644 package/libfreefare/libfreefare.hash
 delete mode 100644 package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
 delete mode 100644 package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
 delete mode 100644 package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
 delete mode 100644 package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
 delete mode 100644 package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
 delete mode 100644 package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch
 create mode 100644 package/libiscsi/libiscsi.hash
 create mode 100644 package/libnfc/libnfc.hash
 delete mode 100644 package/yaml-cpp/yaml-cpp.hash
 rename package/{zxing => zxing-cpp}/Config.in (52%)
 create mode 100644 package/zxing-cpp/zxing-cpp.mk
 delete mode 100644 package/zxing/0001-makefile.patch
 delete mode 100644 package/zxing/zxing.mk

--
2.1.4
