From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 08:34:59 +0100
Subject: [Buildroot] [PATCH] mrouted: add missing dependency on host-bison
Message-ID: <1364196899-10372-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/10d875724388034369e7673a6c08ecad3863ba06/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mrouted/mrouted.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 90f2f59..56aa7e1 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -7,6 +7,7 @@
 MROUTED_VERSION = 3.9.6
 MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
 MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
+MROUTED_DEPENDENCIES = host-bison
 
 define MROUTED_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.7.9.5
