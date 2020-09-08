From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue,  8 Sep 2020 17:51:38 +0200
Subject: [Buildroot] [PATCH 0/4] SELinux: defconfig and first tests
Message-ID: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series adds two runtime tests on SELinux enabled images. The main
idea is to start adding tests ensuring SELinux is correctly working on
Buildroot generated images. More tests could be added later on.

The series also adds a specific defconfig, to generate an SELinux
enabled image for x86_64 on Qemu (using Systemd). This image is used in
the tests added, and can be used for manually testing SELinux
functionnalities or as an example of an SELinux enabled system. In this
image SELinux is using the 'permissive' mode, as using the 'enforced'
one require extra changes and tweaks. The goal is to run in 'enforced'
mode when it'll be possible, later on.

Other tests should be made for testing Buildroot specific SELinux
capabilities (such as adding custom modules, selecting modules in the
refpolicy, etc...). Those tests are not part of the series as they're
not developed yet, but should come later on.

Thanks!
Antoine

Antoine Tenart (4):
  configs: add a Qemu x86_64 SELinux defconfig
  support/testing: add the SELinuxExt4 test
  support/testing: add an SELinuxSquashfs test
  DEVELOPERS: update my watchlist

 DEVELOPERS                                    |  5 ++
 configs/qemu_x86_64_selinux_defconfig         | 19 ++++++
 support/testing/tests/boot/test_selinux.py    | 63 +++++++++++++++++++
 .../boot/test_selinux/linux-squashfs.fragment |  1 +
 4 files changed, 88 insertions(+)
 create mode 100644 configs/qemu_x86_64_selinux_defconfig
 create mode 100644 support/testing/tests/boot/test_selinux.py
 create mode 100644 support/testing/tests/boot/test_selinux/linux-squashfs.fragment

-- 
2.26.2
