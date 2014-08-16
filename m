From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 16:39:50 +0200
Subject: [Buildroot] [PATCH 0/2] Solving bug #7142, getent installation
Message-ID: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of two patches aim at solving bug #7142 by providing a way
for packages to express the fact that they need the 'getent' program
to be installed on the target. Unfortunately, getent is not a
stand-alone program: it is typically provided as part of glibc/eglibc
sources, except for uclibc and musl, of course.

Read the commit log of the first patch for the gory details.

Thanks,

Thomas

Thomas Petazzoni (2):
  toolchain: add mechanism to install the getent program
  ecryptfs-utils: ensure getent is installed on the target

 package/ecryptfs-utils/Config.in                   |  2 +
 package/getent/getent                              | 45 ++++++++++++++++++++++
 package/getent/getent.mk                           | 22 +++++++++++
 package/glibc/glibc.mk                             |  7 ++++
 package/musl/musl.mk                               |  5 +++
 package/uclibc/uclibc.mk                           |  7 ++++
 toolchain/toolchain-common.in                      |  6 +++
 toolchain/toolchain-external/toolchain-external.mk | 14 +++++++
 8 files changed, 108 insertions(+)
 create mode 100644 package/getent/getent
 create mode 100644 package/getent/getent.mk

-- 
2.0.0
