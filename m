From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 30 Dec 2015 15:08:31 +0100
Subject: [Buildroot] [PATCH 1/2] libfuse: use LIBFUSE_VERSION variable in URL
Message-ID: <1451484512-28872-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libfuse/libfuse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 32d70d3..9928d62 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,7 @@
 
 LIBFUSE_VERSION = 2.9.4
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4
+LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_$(subst .,_,$(LIBFUSE_VERSION))
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
-- 
1.9.1
