From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:15:29 +0200
Subject: [Buildroot] [git commit] xen: Ensure host Python2 is used
Message-ID: <20160814141541.A70AD8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c7b093d80f4b709494d3976e43d547893605ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To avoid Xen build issues ensure that host Python 2 is used.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xen/xen.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 759667a..e2abf25 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,6 +8,7 @@ XEN_VERSION = 4.6.0
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
+XEN_DEPENDENCIES = host-python
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -17,6 +18,8 @@ XEN_ARCH = arm32
 endif
 
 XEN_CONF_OPTS = --disable-ocamltools
+
+XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
