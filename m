From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:35:58 +0100
Subject: [Buildroot] [PATCH 0/5] Misc autobuilder fixes
Message-ID: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are some fixes for various autobuilder failures. Three affecting
Blackfin, one affecting ARC.

Thomas

Thomas Petazzoni (5):
  toolchain-external: fix C++ build issues with the Blackfin toolchain
  mpdecimal: fix build on pure static library configurations
  ushare: do not allow building in static lib situations
  radvd: switch to new patch naming convention, use Git formatted
    patches
  radvd: add a patch to fix build failure on architectures without
    sysctl()

 ...-support-for-enable-disable-shared-static.patch | 101 +++++++++++++++++++++
 package/mpdecimal/mpdecimal.mk                     |   1 +
 ...-check-requirement-we-don-t-do-unit-tests.patch |  29 ++++++
 ...-fstack-protector-the-toolchain-might-lac.patch |  27 ++++++
 ...0003-Improve-check-of-the-sysctl-function.patch |  49 ++++++++++
 package/radvd/radvd-01-drop-check.patch            |  18 ----
 package/radvd/radvd-02-drop-stack-protector.patch  |  15 ---
 package/radvd/radvd.mk                             |   2 +-
 package/ushare/Config.in                           |   8 +-
 toolchain/toolchain-external/toolchain-external.mk |   9 ++
 10 files changed, 223 insertions(+), 36 deletions(-)
 create mode 100644 package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
 create mode 100644 package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
 create mode 100644 package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
 create mode 100644 package/radvd/0003-Improve-check-of-the-sysctl-function.patch
 delete mode 100644 package/radvd/radvd-01-drop-check.patch
 delete mode 100644 package/radvd/radvd-02-drop-stack-protector.patch

-- 
2.1.0
