From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/lttng-uclibc-fixes
Message-ID: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 2ba094de31bbc9f986b6d5bce7932d5bb7443829:

  crosstool-ng: bump version (2012-02-03 15:24:39 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/lttng-uclibc-fixes

Thomas Petazzoni (7):
      liburcu: add patch to fix build with uClibc
      lttng-tools: fix build on uClibc due to sync_file_range()
      lttng-babeltrace: make sure WCHAR and LARGEFILE are enabled
      lttng-libust: add the dependency on util-linux
      lttng-tools: make the dependency on lttng-libust optional
      lttng-libust: add patch to fix build issue when C++ support is not available
      lttng-babeltrace: fix build on uClibc due to missing posix_fallocate()

 .../liburcu/liburcu-0.6.7-missing-gnu-source.patch |   13 +++
 package/lttng-babeltrace/Config.in                 |    8 ++
 ...beltrace-0.8-no-posix-fallocate-in-uclibc.patch |   25 ++++++
 package/lttng-libust/Config.in                     |    8 ++
 ...2-dont-build-cxx-tests-when-not-available.patch |   50 +++++++++++
 package/lttng-libust/lttng-libust.mk               |    4 +-
 package/lttng-tools/Config.in                      |    4 +-
 ...ls-2.0-pre15-no-sync-file-range-in-uclibc.patch |   87 ++++++++++++++++++++
 package/lttng-tools/lttng-tools.mk                 |   11 ++-
 9 files changed, 207 insertions(+), 3 deletions(-)
 create mode 100644 package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
 create mode 100644 package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
 create mode 100644 package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
 create mode 100644 package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch

Thanks,
-- 
Thomas Petazzoni
