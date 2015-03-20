From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:09 -0400
Subject: [Buildroot] [PATCH v2 18/25] triggerhappy: move udev rules to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-19-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/triggerhappy/triggerhappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index d3dfc6a..bff6a7a 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -18,7 +18,7 @@ endef
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define TRIGGERHAPPY_INSTALL_UDEV_RULE
 	$(INSTALL) -D -m 0644 $(@D)/udev/triggerhappy-udev.rules \
-		$(TARGET_DIR)/lib/udev/rules.d/triggerhappy.rules
+		$(TARGET_DIR)/usr/lib/udev/rules.d/triggerhappy.rules
 endef
 endif
 
-- 
2.1.0
