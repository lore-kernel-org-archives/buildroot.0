From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:50 -0500
Subject: [Buildroot] [PATCH 0/7] General LTTng packages maintenance
Message-ID: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset updates the Buildroot packages related to the
LTTng project (see <http://lttng.org/>); mostly a bump to the
latest stable release version of the toolkit (2.6.0).

Some packages are renamed to keep them more consistent with
the official project names.

Philippe Proulx (7):
  liburcu: bump to version 0.8.6
  lttng-tools: bump to version 2.6.0
  lttng-libust: bump to version 2.6.0
  lttng-modules: bump to version 2.6.0
  lttng-babeltrace: update Config.in's help
  lttng-libust: rename package to lttng-ust
  lttng-babeltrace: rename package to babeltrace

 package/Config.in                                  |  4 +--
 .../0001-no-posix-fallocate-in-uclibc.patch        |  0
 package/{lttng-babeltrace => babeltrace}/Config.in | 21 +++++++------
 .../babeltrace.hash}                               |  0
 package/babeltrace/babeltrace.mk                   | 16 ++++++++++
 package/liburcu/liburcu.hash                       |  2 ++
 package/liburcu/liburcu.mk                         |  2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       | 16 ----------
 package/lttng-libust/lttng-libust.hash             |  6 ----
 package/lttng-libust/lttng-libust.mk               | 24 ---------------
 package/lttng-modules/Config.in                    | 34 ++++++++++++++++------
 package/lttng-modules/lttng-modules.hash           |  8 ++---
 package/lttng-modules/lttng-modules.mk             |  2 +-
 package/lttng-tools/Config.in                      |  6 ++--
 package/lttng-tools/lttng-tools.hash               |  2 +-
 package/lttng-tools/lttng-tools.mk                 | 10 +++----
 package/{lttng-libust => lttng-ust}/Config.in      | 10 +++----
 package/lttng-ust/lttng-ust.hash                   |  2 ++
 package/lttng-ust/lttng-ust.mk                     | 16 ++++++++++
 19 files changed, 93 insertions(+), 88 deletions(-)
 rename package/{lttng-babeltrace => babeltrace}/0001-no-posix-fallocate-in-uclibc.patch (100%)
 rename package/{lttng-babeltrace => babeltrace}/Config.in (57%)
 rename package/{lttng-babeltrace/lttng-babeltrace.hash => babeltrace/babeltrace.hash} (100%)
 create mode 100644 package/babeltrace/babeltrace.mk
 create mode 100644 package/liburcu/liburcu.hash
 delete mode 100644 package/lttng-babeltrace/lttng-babeltrace.mk
 delete mode 100644 package/lttng-libust/lttng-libust.hash
 delete mode 100644 package/lttng-libust/lttng-libust.mk
 rename package/{lttng-libust => lttng-ust}/Config.in (78%)
 create mode 100644 package/lttng-ust/lttng-ust.hash
 create mode 100644 package/lttng-ust/lttng-ust.mk

--
2.2.1
