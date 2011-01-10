From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 10 Jan 2011 09:28:38 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
Message-ID: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 54942318f93b12f8166f110905ec7df6e3279a74:

  pciutils: SHARED make opt goes for install too (2011-01-10 14:52:02 +0100)

are available in the git repository at:
  git://sources.blackfin.uclinux.org/git/users/vapier/buildroot.git vapier

Mike Frysinger (7):
      busybox: unify duplicated build steps
      busybox: let buildroot handle stripping
      toolchain: add a USE_MMU build option
      portmap: add nommu support
      portmap: respect target CFLAGS
      portmap: fix clean target to actually clean
      tcpdump: add patch for nommu systems

 package/busybox/busybox.mk                         |   30 ++---
 ...0-0001-README-fix-typo-in-tcp-wrapper-doc.patch |   26 ++++
 ...0002-NO_PIE-make-PIE-support-controllable.patch |   53 ++++++++
 ...K-control-usage-of-fork-for-nommu-systems.patch |  110 +++++++++++++++++
 ...ERROR-control-overriding-of-perror-symbol.patch |   46 +++++++
 package/portmap/portmap.mk                         |   12 ++-
 package/tcpdump/tcpdump-4.1.1-vfork.patch          |  128 ++++++++++++++++++++
 toolchain/helpers.mk                               |    2 +
 toolchain/toolchain-common.in                      |    7 +
 9 files changed, 396 insertions(+), 18 deletions(-)
 create mode 100644 package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
 create mode 100644 package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
 create mode 100644 package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 create mode 100644 package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
 create mode 100644 package/tcpdump/tcpdump-4.1.1-vfork.patch
