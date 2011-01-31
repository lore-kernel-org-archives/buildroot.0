From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Jan 2011 20:45:14 +0100
Subject: [Buildroot] [git commit master 1/1] fbset: ensure it builds after
	busybox if both are enabled
Message-ID: <20110131194528.05F0D8E5EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2e77770e615819b8ec969e4e39160d4185f89d0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbset/fbset.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 8926f4c..b5b5ab8 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -3,10 +3,16 @@
 # fbset
 #
 #############################################################
+
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 
+# Make sure full fbset wins over busybox fbset
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+FBSET_DEPENDENCIES += busybox
+endif
+
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
-- 
1.7.3.4
