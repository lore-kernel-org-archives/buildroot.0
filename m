From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 02 Aug 2013 09:33:56 +0200
Subject: [Buildroot] [PATCH 4 of 4] sstrip: remove unneed explicit ccache
	dependency
In-Reply-To: <patchbomb.1375428832@BEANTN0L019720>
References: <patchbomb.1375428832@BEANTN0L019720>
Message-ID: <488616f386aa80c0f07e.1375428836@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ccache dependency was here to enforce the build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
package/sstrip/sstrip.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -8,11 +8,6 @@ SSTRIP_SITE = svn://dev.openwrt.org/open
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
