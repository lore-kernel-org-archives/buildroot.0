From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Aug 2016 15:30:05 -0700
Subject: [Buildroot] [PATCH 1/2] xen: Ensure host Python2 is used
Message-ID: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To avoid Xen build issues ensure that host Python 2 is used.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
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
-- 
2.7.4
