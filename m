From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 19 Jan 2011 22:10:22 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
Message-ID: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit c2abc61d028b9e9cc602108ce1ad03942092bed2:

  tcpdump: add patch for nommu systems (2011-01-19 22:52:30 +0100)

are available in the git repository at:
  git://sources.blackfin.uclinux.org/git/users/vapier/buildroot.git vapier

Mike Frysinger (4):
      libpcap: update static handling
      debugging: do not require no stripping
      initial support for Blackfin processors
      gdb: add support for Blackfin gdbserver

 Config.in                                      |    4 +-
 Makefile                                       |    1 +
 boot/u-boot/Config.in                          |    4 +
 boot/u-boot/u-boot.mk                          |    2 +
 linux/Config.in                                |    2 +-
 linux/linux.mk                                 |    5 +
 package/libpcap/libpcap.mk                     |    6 +-
 target/Config.in.arch                          |   19 ++-
 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch |  238 ++++++++++++++++++++++++
 toolchain/gdb/Config.in                        |    7 +-
 toolchain/toolchain-common.in                  |    2 +-
 11 files changed, 277 insertions(+), 13 deletions(-)
 create mode 100644 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch
