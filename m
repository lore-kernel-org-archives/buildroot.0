From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 16 Jan 2013 06:10:15 +0200
Subject: [Buildroot] [PATCH] proxychains-ng: copy proxychains.conf to target
	dir
Message-ID: <1358309415-12945-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

proxychains installation does not copy proxychains.conf to 
$(TARGET_DIR)/etc anymore so we have to do it manually now.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/proxychains-ng/proxychains-ng.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 9cf24bf..70d35b6 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -7,4 +7,10 @@ PROXYCHAINS_NG_VERSION = 4.4
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
+define PROXYCHAINS_NG_POST_INSTALL_TARGET
+	$(INSTALL) -m 755 $(@D)/src/proxychains.conf $(TARGET_DIR)/etc
+endef
+
+PROXYCHAINS_NG_POST_INSTALL_TARGET_HOOKS += PROXYCHAINS_NG_POST_INSTALL_TARGET
+
 $(eval $(autotools-package))
-- 
1.7.7.6
