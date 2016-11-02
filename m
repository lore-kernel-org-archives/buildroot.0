From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  2 Nov 2016 02:55:04 -0400
Subject: [Buildroot] [PATCH v4 0/4] Update LTTng packages to 2.8.x and
	Babeltrace to 1.4.0
Message-ID: <20161102065508.3162-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See if this is okay and I will rename lttng-babeltrace to babeltrace
again and submit this last patch.

Philippe Proulx (4):
  lttng-tools: bump to version 2.8.2
  lttng-babeltrace: bump to version 1.4.0
  lttng-babeltrace: add host Babeltrace as host utility
  lttng-babeltrace: add debug info support

 package/Config.in.host                             |   1 +
 .../0001-no-posix-fallocate-in-uclibc.patch        |  37 --
 ...b-Makefile.am-remove-unneeded-static-flag.patch |  36 ++
 ...ix-uuid-support-detection-on-static-build.patch |  63 ---
 ...-m4-ax_lib_elfutils.m4-add-cache-variable.patch |  74 ++++
 package/lttng-babeltrace/Config.in                 |  29 +-
 package/lttng-babeltrace/Config.in.host            |  14 +
 package/lttng-babeltrace/lttng-babeltrace.hash     |  11 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  16 +-
 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
 ...Fix-snapshot-del-output-with-name-on-musl.patch |  32 ++
 .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
 ...Fix-strerror_r-behavior-is-glibc-specific.patch |  30 ++
 ...et-thread-stack-size-to-ulimit-soft-value.patch | 431 +++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |   6 +-
 package/lttng-tools/lttng-tools.mk                 |  10 +-
 16 files changed, 667 insertions(+), 207 deletions(-)
 delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
 create mode 100644 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
 delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
 create mode 100644 package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
 create mode 100644 package/lttng-babeltrace/Config.in.host
 delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
 create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
 delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
 create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
 create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

-- 
2.9.3
