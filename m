From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 04:22:45 +0200
Subject: [Buildroot] [PATCH 0/2] Download patches for Busybox
Message-ID: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As recently discussed on the list, here are two patches that let the
busybox package download its patches, instead of storing them in
Buildroot's source tree.

Thomas

Thomas Petazzoni (2):
  package: use only the patch file name when applying patches
  busybox: download patches instead of storing them in the source tree

 package/busybox/1.19.4/busybox-1.19.4-udhcp.patch  |  164 -----
 .../busybox/1.20.2/busybox-1.20.2-kernel_ver.patch |   25 -
 package/busybox/1.20.2/busybox-1.20.2-ntpd.patch   |   11 -
 .../1.20.2/busybox-1.20.2-pkg-config-selinux.patch |   67 --
 .../1.20.2/busybox-1.20.2-sys-resource.patch       |  123 ----
 package/busybox/1.21.0/busybox-1.21.0-mdev.patch   |  643 --------------------
 .../busybox/1.21.0/busybox-1.21.0-platform.patch   |   24 -
 package/busybox/1.21.0/busybox-1.21.0-xz.patch     |   84 ---
 package/busybox/busybox.mk                         |   12 +
 package/pkg-generic.mk                             |    2 +-
 10 files changed, 13 insertions(+), 1142 deletions(-)
 delete mode 100644 package/busybox/1.19.4/busybox-1.19.4-udhcp.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-kernel_ver.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-ntpd.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-pkg-config-selinux.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-sys-resource.patch
 delete mode 100644 package/busybox/1.21.0/busybox-1.21.0-mdev.patch
 delete mode 100644 package/busybox/1.21.0/busybox-1.21.0-platform.patch
 delete mode 100644 package/busybox/1.21.0/busybox-1.21.0-xz.patch

-- 
1.7.9.5
