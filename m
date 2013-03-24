From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 16:42:41 +0100
Subject: [Buildroot] [PATCH] libnl: add missing dependency on host-flex
Message-ID: <1364139761-22345-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/9c496031fef011b86113e342a8ca4a36ae360bb1/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/libnl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 7620cf7..2a9f5a9 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -9,7 +9,7 @@ LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
-LIBNL_DEPENDENCIES = host-bison
+LIBNL_DEPENDENCIES = host-bison host-flex
 LIBNL_MAKE = $(MAKE1)
 LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
-- 
1.7.9.5
