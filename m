From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun, 30 Oct 2016 15:56:44 -0400
Subject: [Buildroot] [PATCH v2 0/5] Update LTTng packages to 2.8.x and
	Babeltrace to 1.4.0
Message-ID: <20161030195649.6415-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See individual patches for changes.

Tell me if it's okay to put patches found on the mailing list and from
the package source of other distributions as is, only with the file
names changed.

Philippe Proulx (5):
  lttng-libust: bump to version 2.8.1
  lttng-tools: bump to version 2.8.2
  lttng-tools: remove dependency on host-lttng-babeltrace
  lttng-modules: bump to version 2.8.3
  lttng-babeltrace: bump to version 1.4.0

 ...c-remove-elfutils-version-test-for-Buildr.patch |  30 ++
 .../0001-no-posix-fallocate-in-uclibc.patch        |  37 --
 ...ix-uuid-support-detection-on-static-build.patch |  63 ---
 ...b-Makefile.am-remove-unneeded-static-flag.patch |  36 ++
 package/lttng-babeltrace/Config.in                 |  13 +-
 package/lttng-babeltrace/lttng-babeltrace.hash     |  11 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  17 +-
 ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch |  31 ++
 package/lttng-libust/lttng-libust.hash             |  12 +-
 package/lttng-libust/lttng-libust.mk               |  10 +-
 package/lttng-modules/lttng-modules.hash           |   8 +-
 package/lttng-modules/lttng-modules.mk             |  27 +-
 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
 ...Fix-snapshot-del-output-with-name-on-musl.patch |  28 ++
 .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
 ...Fix-strerror_r-behavior-is-glibc-specific.patch |  26 ++
 ...et-thread-stack-size-to-ulimit-soft-value.patch | 427 +++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |   8 +-
 package/lttng-tools/lttng-tools.mk                 |  17 +-
 19 files changed, 654 insertions(+), 231 deletions(-)
 create mode 100644 package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
 delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
 delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
 create mode 100644 package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
 create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
 delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
 create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
 delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
 create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
 create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

--
2.9.3
