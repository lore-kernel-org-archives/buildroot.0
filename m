From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 13 Sep 2016 21:45:32 +0200
Subject: [Buildroot] [PATCH V2 0/2] Introducing Xvisor
Message-ID: <1473795934-27033-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series introduces Xvisor, an open-source type-1 hypervisor.

As it uses a kconfig clone named openconf, a patch to the kconfig-package
infrastructure is also provided, in order to support it.

v1->v2:

 - change $(2)_KCONFIG_DOTCONFIG to be relative to package source directory.
 - clarify comments about creation of .config directory hierarchy.
 - clean-up xvisor Config.in.

Eric Le Bihan (2):
  pkg-kconfig: support alternative .config location
  xvisor: new package

 package/Config.in                                  |  1 +
 package/pkg-kconfig.mk                             | 14 +++--
 .../0001-Makefile-Fix-oldconfig-make-target.patch  | 30 +++++++++
 .../xvisor/0002-openconf-do-not-check-stdin.patch  | 58 +++++++++++++++++
 package/xvisor/Config.in                           | 58 +++++++++++++++++
 package/xvisor/xvisor.hash                         |  2 +
 package/xvisor/xvisor.mk                           | 72 ++++++++++++++++++++++
 7 files changed, 229 insertions(+), 6 deletions(-)
 create mode 100644 package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
 create mode 100644 package/xvisor/0002-openconf-do-not-check-stdin.patch
 create mode 100644 package/xvisor/Config.in
 create mode 100644 package/xvisor/xvisor.hash
 create mode 100644 package/xvisor/xvisor.mk

--
2.4.11
