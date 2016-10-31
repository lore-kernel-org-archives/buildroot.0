From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 03:46:15 -0400
Subject: [Buildroot] [PATCH v3 0/9] Update LTTng packages to 2.8.x and
	Babeltrace to 1.4.0
Message-ID: <20161031074624.7576-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See individual patches for changes.

Philippe Proulx (9):
  lttng-libust: bump to version 2.8.1
  lttng-libust: enable Python agent when Python is available
  lttng-tools: bump to version 2.8.2
  lttng-tools: remove dependency on host-lttng-babeltrace
  lttng-modules: bump to version 2.8.3
  lttng-babeltrace: bump to version 1.4.0
  lttng-babeltrace: add host Babeltrace as host utility
  lttng-babeltrace: add debug info support
  lttng-babeltrace: rename to babeltrace

 Config.in.legacy                                   |   8 +
 package/Config.in                                  |   2 +-
 package/Config.in.host                             |   1 +
 ...c-remove-elfutils-version-test-for-Buildr.patch |  30 ++
 ...b-Makefile.am-remove-unneeded-static-flag.patch |  36 ++
 package/{lttng-babeltrace => babeltrace}/Config.in |  35 +-
 package/babeltrace/Config.in.host                  |  18 +
 package/babeltrace/babeltrace.hash                 |   6 +
 package/babeltrace/babeltrace.mk                   |  29 ++
 .../0001-no-posix-fallocate-in-uclibc.patch        |  37 --
 ...ix-uuid-support-detection-on-static-build.patch |  63 ---
 package/lttng-babeltrace/lttng-babeltrace.hash     |   7 -
 package/lttng-babeltrace/lttng-babeltrace.mk       |  21 -
 ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch |  34 ++
 package/lttng-libust/lttng-libust.hash             |  10 +-
 package/lttng-libust/lttng-libust.mk               |  11 +-
 package/lttng-modules/lttng-modules.hash           |   6 +-
 package/lttng-modules/lttng-modules.mk             |   3 +-
 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
 ...Fix-snapshot-del-output-with-name-on-musl.patch |  32 ++
 .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
 ...Fix-strerror_r-behavior-is-glibc-specific.patch |  30 ++
 ...et-thread-stack-size-to-ulimit-soft-value.patch | 431 +++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |   6 +-
 package/lttng-tools/lttng-tools.mk                 |  17 +-
 25 files changed, 708 insertions(+), 249 deletions(-)
 create mode 100644 package/babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
 create mode 100644 package/babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
 rename package/{lttng-babeltrace => babeltrace}/Config.in (50%)
 create mode 100644 package/babeltrace/Config.in.host
 create mode 100644 package/babeltrace/babeltrace.hash
 create mode 100644 package/babeltrace/babeltrace.mk
 delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
 delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
 delete mode 100644 package/lttng-babeltrace/lttng-babeltrace.hash
 delete mode 100644 package/lttng-babeltrace/lttng-babeltrace.mk
 create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
 delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
 create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
 delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
 create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
 create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

--
2.9.3
