From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Sep 2009 17:40:24 +0200
Subject: [Buildroot] [git commit master] Makefile: reinstate /etc/br-version
Message-ID: <20090930154439.15085777AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=912ea81ad4a2f1b6a87c9cebfefdbbf1f60f526a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got lost in the recent cleanup, but is handy to know BR version.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a7f0b88..7fe30a7 100644
--- a/Makefile
+++ b/Makefile
@@ -404,6 +404,10 @@ endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 
+	mkdir -p $(TARGET_DIR)/etc
+	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) > \
+		$(TARGET_DIR)/etc/br-version
+
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
 endif
-- 
1.6.3.3
