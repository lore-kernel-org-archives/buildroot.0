From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] sstrip: remove unneed explicit ccache
	dependency
Message-ID: <20130831213337.03FD49B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de5a08f5b5a8afc0d5ef68307a8fb5cbce810d16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ccache dependency was here to enforce the build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sstrip/sstrip.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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
