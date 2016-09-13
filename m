From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 13 Sep 2016 13:45:04 -0700
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from make
In-Reply-To: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TARGET_CONFIGURE_OPTS variable resulted in a double definition
error:
<command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]

Remove the options to avoid the error.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/xen/xen.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index e2c797f..8400a77 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -22,8 +22,7 @@ XEN_CONF_OPTS = --disable-ocamltools
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
-	$(TARGET_CONFIGURE_OPTS)
+	CROSS_COMPILE=$(TARGET_CROSS)
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen
-- 
2.7.4
