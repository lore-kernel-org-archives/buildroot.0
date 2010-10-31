From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:13 +0100
Subject: [Buildroot] [PATCH 5/8] Makefile: use global version string in
	/etc/br-version
In-Reply-To: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1288542916-21883-6-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
