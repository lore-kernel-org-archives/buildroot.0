From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Jun 2019 18:42:54 +0200
Subject: [Buildroot] [PATCH 0/3] Update Busybox to 1.31 and use mdev daemon
 mode
Message-ID: <20190619164257.183607-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest Busybox release introduces the daemon mode
for mdev, which can be used as a replacement for the
uevent+mdev setup, or the old kernel hotplug mechanism.

This new mode prevent race conditions in mdev invocations,
but on the other hand it requires CONFIG_NET to be enabled
in the kernel.

In this patchset, Busybox is bumped to the latest version,
the default configuration is updated to support the mdev
daemon mode, and the mdev init script is updated accordingly

Titouan Christophe (3):
  package/busybox: bump version to 1.31.0
  package/busybox: convert S10mdev to the canonical init script format
  package/busybox: run mdev in daemon mode

 ...-scripted_main-as-externally-visible.patch | 53 -------------------
 package/busybox/S10mdev                       | 42 ++++++++++-----
 package/busybox/busybox.config                |  1 +
 package/busybox/busybox.hash                  |  4 +-
 package/busybox/busybox.mk                    |  2 +-
 5 files changed, 34 insertions(+), 68 deletions(-)
 delete mode 100644 package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch

-- 
2.21.0
