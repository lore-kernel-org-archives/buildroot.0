From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:29:54 +0100
Subject: [Buildroot] [PATCH 2/2] connman: install start script only if it
	doesn't already exists
In-Reply-To: <1421753394-32029-1-git-send-email-richard.genoud@gmail.com>
References: <1421753394-32029-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1421753394-32029-2-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That way, we can use a different start script in a custom skeleton.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/connman/connman.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4d9b03ef1508..108ad848e92c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -28,7 +28,8 @@ CONNMAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_CONNMAN_WISPR),gnutls)
 
 define CONNMAN_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
+	[ -f $(TARGET_DIR)/etc/init.d/S45connman ] || \
+		$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
 
 
-- 
2.0.0
