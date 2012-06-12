From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:36 -0500
Subject: [Buildroot] [PATCH 0/7] automatically determine job concurrency
Message-ID: <1339466983-19786-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series implements the option of "autodetecting" the number of
jobs to run concurrently (make -jN), using the number of reported CPUs
when BR2_JLEVEL is set to 0.

Nathan Lynch (7):
  introduce PARALLEL_JOBS build system variable
  boost: change uses of BR2_JLEVEL to PARALLEL_JOBS
  cmake: change use of BR2_JLEVEL to PARALLEL_JOBS
  midori: change use of BR2_JLEVEL to PARALLEL_JOBS
  qt: change use of BR2_JLEVEL to PARALLEL_JOBS
  toolchain/crosstool-ng: change use of BR2_JLEVEL to PARALLEL_JOBS
  automatically set PARALLEL_JOBS when BR2_JLEVEL is 0

 Config.in                                        |    8 +++++---
 package/Makefile.in                              |    8 +++++++-
 package/boost/boost.mk                           |    4 ++--
 package/cmake/cmake.mk                           |    2 +-
 package/midori/midori.mk                         |    2 +-
 package/qt/qt.mk                                 |    2 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 7 files changed, 18 insertions(+), 10 deletions(-)

-- 
1.7.6.5
