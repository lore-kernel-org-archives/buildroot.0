From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 16 Jan 2013 13:54:21 +0200
Subject: [Buildroot] [PATCH 2/2] proxychains-ng: copy proxychains.conf to
	target dir
Message-ID: <1358337261-13260-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/proxychains-ng/proxychains-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 70d35b6..2d6e036 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -8,7 +8,7 @@ PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
 define PROXYCHAINS_NG_POST_INSTALL_TARGET
-	$(INSTALL) -m 755 $(@D)/src/proxychains.conf $(TARGET_DIR)/etc
+	$(INSTALL) -m 644 -D $(@D)/src/proxychains.conf $(TARGET_DIR)/etc/proxychains.conf
 endef
 
 PROXYCHAINS_NG_POST_INSTALL_TARGET_HOOKS += PROXYCHAINS_NG_POST_INSTALL_TARGET
-- 
1.7.7.6
