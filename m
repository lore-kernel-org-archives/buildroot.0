From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: use global version
	string in /etc/br-version
Message-ID: <20101103230450.1F5C98A5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cb15bf8da50f7b2f2cb46fe8ec2424c537a8195d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d6a7628..dda78fe 100644
--- a/Makefile
+++ b/Makefile
@@ -413,8 +413,7 @@ endif
 	else \
 		/sbin/ldconfig -r $(TARGET_DIR); \
 	fi
-	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) > \
-		$(TARGET_DIR)/etc/br-version
+	echo $(BR2_VERSION_FULL) > $(TARGET_DIR)/etc/br-version
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
-- 
1.7.1
