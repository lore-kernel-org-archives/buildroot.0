From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  1 Mar 2020 12:17:43 -0300
Subject: [Buildroot] [PATCH/next v2 0/4] openrc: bump to version 0.42.1
Message-ID: <20200301151747.25723-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

1. Drop the custom getty service, which has issues with openrc 0.42.1.
   Use the already existing agetty service, with two small patches.

2. Bump openrc to version 0.42.1. It requires a patch to prevent
   starting spurions agetty instances for tty[1-6].

3. Add selinux support.

4. Add openrc tests.

Adam Duskett (3):
  package/openrc: bump to version 0.42.1
  package/openrc: add libselinux support
  support/testing: add openrc tests

Carlos Santos (1):
  package/openrc: drop custom getty service

 .gitlab-ci.yml                                |  2 +
 ...ty-replace-sbin-agetty-by-sbin-getty.patch | 33 ++++++++++++
 ...getty-start-agetty-after-all-sevices.patch | 29 +++++++++++
 ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 34 +++++++++++++
 package/openrc/getty                          | 24 ---------
 package/openrc/openrc.hash                    |  2 +-
 package/openrc/openrc.mk                      | 18 ++++---
 support/testing/tests/init/test_openrc.py     | 51 +++++++++++++++++++
 8 files changed, 161 insertions(+), 32 deletions(-)
 create mode 100644 package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch
 create mode 100644 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch
 create mode 100644 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
 delete mode 100755 package/openrc/getty
 create mode 100644 support/testing/tests/init/test_openrc.py

-- 
2.18.2
