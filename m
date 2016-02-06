From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Feb 2016 16:37:20 -0800
Subject: [Buildroot] [PATCH 0/2] Add Xen target support
Message-ID: <1454719042-6185-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is based on an original patch by Maxime Ripard which never seemed to be
accepted. The XEN_TARGET is hard coded in this patch as I don't know how else
to set the target. Otherwise it works.

Test on AArch64 targets only.

Alistair Francis (2):
  Update libaio to 0.3.110
  Add Xen 4.6

 package/Config.in                |   1 +
 package/libaio/0001-arches.patch | 671 ---------------------------------------
 package/libaio/Config.in         |   2 +-
 package/libaio/libaio.hash       |   4 +-
 package/libaio/libaio.mk         |   2 +-
 package/xen/Config.in            |  31 ++
 package/xen/xen.hash             |   2 +
 package/xen/xen.mk               |  49 +++
 8 files changed, 87 insertions(+), 675 deletions(-)
 delete mode 100644 package/libaio/0001-arches.patch
 create mode 100644 package/xen/Config.in
 create mode 100644 package/xen/xen.hash
 create mode 100644 package/xen/xen.mk

-- 
2.5.0
