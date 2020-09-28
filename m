From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:18 +0200
Subject: [Buildroot] [PATCH 0/7] SELinux tests
Message-ID: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series adds SELinux tests to Buildroot. The tests are divided into
two categories:

- Runtime tests to check SELinux functionalities at runtime on a system
  generated with Buildroot. Those tests are defined in:
  support/testing/tests/boot/test_selinux.py

- Core tests to ensure in-Buildroot SELinux facilities are working as
  expected. Those tests are defined in:
  support/testing/tests/core/test_selinux.py

This isn't a v2, but the two runtime tests were also sent in a previous
series. Since this series I removed the specific SELinux defconfig as it
would have been there only for demoing a software functionality. And if
users want information on what to select to have an SELinux ready image,
there is now a documentation section about SELinux.

Thanks!
Antoine

Antoine Tenart (7):
  support/testing: add an SELinuxSystemdExt4 test
  support/testing: add an SELinuxSystemdSquashfs test
  support/testing: add a test for BR2_REFPOLICY_EXTRA_MODULES
  support/testing: add a test for BR2_REFPOLICY_EXTRA_MODULES_DIRS
  support/testing: add a test for BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
  support/testing: add tests for the packages SELinux functionalities
  DEVELOPERS: update my watchlist

 DEVELOPERS                                    |  7 ++
 support/testing/tests/boot/test_selinux.py    | 71 ++++++++++++++++
 .../boot/test_selinux/linux-squashfs.fragment |  1 +
 support/testing/tests/core/test_selinux.py    | 82 +++++++++++++++++++
 .../core/test_selinux/br2_external/Config.in  |  1 +
 .../test_selinux/br2_external/external.desc   |  1 +
 .../test_selinux/br2_external/external.mk     |  1 +
 .../package/selinux-test/Config.in            |  6 ++
 .../package/selinux-test/selinux-test.mk      |  9 ++
 .../package/selinux-test/selinux/buildroot.fc |  0
 .../package/selinux-test/selinux/buildroot.if |  1 +
 .../package/selinux-test/selinux/buildroot.te |  3 +
 .../test_selinux/extra_modules/buildroot.fc   |  0
 .../test_selinux/extra_modules/buildroot.if   |  1 +
 .../test_selinux/extra_modules/buildroot.te   |  3 +
 15 files changed, 187 insertions(+)
 create mode 100644 support/testing/tests/boot/test_selinux.py
 create mode 100644 support/testing/tests/boot/test_selinux/linux-squashfs.fragment
 create mode 100644 support/testing/tests/core/test_selinux.py
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/Config.in
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/external.desc
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/external.mk
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.fc
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.fc
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.if
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.te

-- 
2.26.2
