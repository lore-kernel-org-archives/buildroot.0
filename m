From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 14:22:01 +0100
Subject: [Buildroot] [PATCH 0/6] Add toolchain knob for NPTL
Message-ID: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We have a growing number of packages that need pthread functions only
available when the NPTL implementation is used. But at the same time,
we have several architectures (AVR32, ARC, Blackfin and Xtensa) that
don't support NPTL.

This set of commits adds a new hidden toolchain config knob named
BR2_TOOLCHAIN_HAS_THREADS_NPTL, and uses it in four packages: three
were already having special conditions to more-or-less detect the
availability of NPTL, and one package (qt5) which fixes an autobuilder
failure.

Thomas

Thomas Petazzoni (6):
  toolchain: introduce a toolchain knob for NPTL
  docs/manual: indicate how to handle BR2_TOOLCHAIN_HAS_THREADS_NPTL
  rt-tests: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
  sconeserver: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
  tvheadend: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
  qt5: needs NPTL threads

 docs/manual/adding-packages-directory.txt |  8 +++++++-
 package/qt5/Config.in                     |  6 +++---
 package/rt-tests/Config.in                | 12 +++---------
 package/sconeserver/Config.in             | 12 +++---------
 package/tvheadend/Config.in               | 12 +++---------
 package/uclibc/Config.in                  |  1 +
 toolchain/Config.in                       |  2 ++
 toolchain/helpers.mk                      |  1 +
 toolchain/toolchain-common.in             |  3 +++
 toolchain/toolchain-external/Config.in    | 11 +++++++++++
 10 files changed, 37 insertions(+), 31 deletions(-)

-- 
1.8.3.2
