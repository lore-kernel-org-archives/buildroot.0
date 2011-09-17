From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:50 +0200
Subject: [Buildroot] =?utf-8?q?=5Bpull_request=5D_Pull_request_for_branch_?=
	=?utf-8?q?xenomai-rtai?=
Message-ID: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch set that adds the Xenomai and RTAI real-time
extensions of the Linux kernel. The Xenomai patches come from Thomas
de Schampheleire, who himself took them from Beno?t Mauduit. Those
patches have been improved further, taking into account comments from
Arnout, and adding some more features (ability to remove test
programs, RT-CAN programs, Analogy programs, and select which skins
should be installed).

The RTAI real-time extension is also added. It is not well supported
on architectures others than x86/x86-64, but can be useful on those
architectures. However, its integration required a small change in the
package infrastructure, described in detail in its commit log.

Regards,

Thomas

The following changes since commit 16d6e9b3420e78a89960b8b68202ea46a618810d:

  Makefile.autotools.in: fix autoreconf libtool patching after libtool move (2011-09-17 14:16:42 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git xenomai-rtai

Thomas De Schampheleire (2):
      linux: Add Linux Kernel extensions menu
      Add xenomai real-time Framework to buildroot

Thomas Petazzoni (6):
      xenomai: add support to keep or remove testsuite programs
      xenomai: add support to keep or remove RT-CAN utilities
      xenomai: add support to keep or remove Analogy utilities and libs
      xenomai: add support to keep or remove skins
      package: change ordering of steps
      Add support for the RTAI real-time extension

 linux/Config.ext.in                                |   31 ++++
 linux/Config.in                                    |    4 +
 linux/linux-ext-rtai.mk                            |   47 ++++++
 linux/linux-ext-xenomai.mk                         |   30 ++++
 linux/linux.mk                                     |    2 +
 package/Config.in                                  |    5 +
 package/Makefile.package.in                        |    6 +-
 package/rtai/Config.in                             |    2 +
 package/rtai/rtai.mk                               |   16 ++
 package/xenomai/Config.in                          |  159 ++++++++++++++++++++
 .../xenomai/xenomai-do-not-install-devices.patch   |   11 ++
 package/xenomai/xenomai.mk                         |  159 ++++++++++++++++++++
 target/generic/device_table_dev.txt                |    5 +
 13 files changed, 474 insertions(+), 3 deletions(-)
 create mode 100644 linux/Config.ext.in
 create mode 100644 linux/linux-ext-rtai.mk
 create mode 100644 linux/linux-ext-xenomai.mk
 create mode 100644 package/rtai/Config.in
 create mode 100644 package/rtai/rtai.mk
 create mode 100644 package/xenomai/Config.in
 create mode 100644 package/xenomai/xenomai-do-not-install-devices.patch
 create mode 100644 package/xenomai/xenomai.mk

Thanks,
-- 
Thomas Petazzoni
