From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Mar 2014 15:38:25 +0100
Subject: [Buildroot] [PATCH v2 0/6] Lttng packages bump
Message-ID: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is the 2nd round of the LTTng related packages bump.
The main change it the way the liburcu/ARM gcc-4.8.2 bug 58854 is handled.

Yours,
Samuel

Samuel Martin (6):
  liburcu: bump version to 0.8.3
  lttng-libust: bump version to 2.4.0
  lttng-modules: bump version to 2.4.0
  lttng-tools: bump version to 2.4.0
  lttng-babeltrace: bump version to 1.2.1
  liburcu: disable build with gcc-4.8.x on ARM

 package/liburcu/Config.in                          |  7 ++++
 ...01-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch | 40 ++++++++++++++++++++++
 package/liburcu/liburcu.mk                         |  6 ++--
 package/lttng-babeltrace/lttng-babeltrace.mk       |  6 ++--
 package/lttng-libust/Config.in                     |  1 +
 package/lttng-libust/lttng-libust.mk               |  4 +--
 package/lttng-modules/lttng-modules.mk             |  2 +-
 package/lttng-tools/Config.in                      |  1 +
 package/lttng-tools/lttng-tools.mk                 |  7 ++--
 toolchain/toolchain-common.in                      |  3 ++
 toolchain/toolchain-external/Config.in             |  4 +++
 11 files changed, 68 insertions(+), 13 deletions(-)
 create mode 100644 package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch

--
1.9.0
