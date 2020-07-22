From: Dick Olsson <hi@senzilla.io>
Date: Wed, 22 Jul 2020 07:10:52 +0000
Subject: [Buildroot] [PATCH v2 0/4] boot/optee-os: Depend on host-python3
Message-ID: <20200722071030.16128-1-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series makes OP-TEE OS properly build with Python 3 by using host-python3
as a configurable interpreter enabled by a recent upstream patch[1].

Along with this, python-pycryptodomex was bumped to the latest version and a
accompanying new package python3-pycryptodomex was added as a dependency.

These changes also enable some nice cleanup in qemu_arm_vexpress_tz_defconfig
which previously had to work around these Python 3 issues in the defconfig.

I documented[2] briefly some of the testing I've done with the upstream patch.

[1]: https://github.com/OP-TEE/optee_os/pull/3984
[2]: https://github.com/OP-TEE/optee_os/pull/3984#issuecomment-662271300

Dick Olsson (4):
  package/python-pycryptodomex: bump to version 3.9.8
  package/python3-pycryptodomex: new package
  boot/optee-os: Depend on host-python3
  configs/qemu_arm_vexpress_tz_defconfig: bump ATF version, cleanup
    config

 ...e-ta-Configurable-Python-interpreter.patch | 249 ++++++++++++++++++
 boot/optee-os/optee-os.mk                     |   5 +-
 configs/qemu_arm_vexpress_tz_defconfig        |   7 +-
 .../python-pycryptodomex.hash                 |   4 +-
 .../python-pycryptodomex.mk                   |   5 +-
 package/python3-pycryptodomex/Config.in       |   6 +
 .../python3-pycryptodomex.hash                |   4 +
 .../python3-pycryptodomex.mk                  |  21 ++
 8 files changed, 288 insertions(+), 13 deletions(-)
 create mode 100644 boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch
 create mode 100644 package/python3-pycryptodomex/Config.in
 create mode 100644 package/python3-pycryptodomex/python3-pycryptodomex.hash
 create mode 100644 package/python3-pycryptodomex/python3-pycryptodomex.mk

-- 
2.20.1
