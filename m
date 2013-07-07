From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:43:45 +0200
Subject: [Buildroot] [PATCH 3/3] sstrip: remove unneed explicit ccache
	dependency
In-Reply-To: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
References: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1373222625-9013-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ccache dependency was here to enforce the build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/sstrip/sstrip.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index be8c563..c79a501 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -8,11 +8,6 @@ SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
 HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
-# This is a kludge to get host-ccache built before us or it fails
-ifeq ($(BR2_CCACHE),y)
-HOST_SSTRIP_DEPENDENCIES = host-ccache
-endif
-
 define SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
 	$(TARGET_CC) $(TARGET_CFLAGS) -include endian.h -include byteswap.h \
-- 
1.8.3.2
