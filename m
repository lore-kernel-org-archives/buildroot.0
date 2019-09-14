From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 14 Sep 2019 13:41:43 -0300
Subject: [Buildroot] [PATCH] package/util-linux: create
 $(TARGET_DIR)/etc/pam.d if necessary
Message-ID: <20190914164143.4644-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Useful for test purposes when we want to install util-linux with a
custom TARGET_DIR, e.g.

    $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 99ec39467f..cd69838046 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -236,7 +236,7 @@ endif
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+	$(INSTALL) -D -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
-- 
2.18.1
