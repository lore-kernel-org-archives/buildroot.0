From: Stephan Henningsen <stephan@asklandd.dk>
Date: Mon,  4 Nov 2019 20:26:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: remove dist example config
Message-ID: <20191104192621.21570-1-stephan@asklandd.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Henningsen <stephan+buildroot@asklandd.dk>

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
---
 package/sudo/sudo.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index cf8b63b1db..ab58f308ec 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -64,4 +64,10 @@ define SUDO_PERMISSIONS
 	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
 
+define SUDO_REMOVE_DIST_EXAMPLES
+	$(RM) $(TARGET_DIR)/etc/sudoers.dist
+	rmdir $(TARGET_DIR)/etc/sudoers.d
+endef
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
+
 $(eval $(autotools-package))
-- 
2.17.1
