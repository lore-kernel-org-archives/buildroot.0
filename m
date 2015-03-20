From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:08 -0400
Subject: [Buildroot] [PATCH v2 17/25] bcache-tools: move udev rules to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-18-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/bcache-tools/bcache-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
index 666a02f..7f11528 100644
--- a/package/bcache-tools/bcache-tools.mk
+++ b/package/bcache-tools/bcache-tools.mk
@@ -17,10 +17,10 @@ define BCACHE_TOOLS_BUILD_CMDS
 endef
 
 # The bcache-tools Makefile expects the man8 directory to exist
-# expects the /lib/udev/rules.d directory to exist.
+# expects the /usr/lib/udev/rules.d directory to exist.
 define BCACHE_TOOLS_CREATE_MISSING_DIRS
 	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/lib/udev/rules.d
 endef
 
 BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_CREATE_MISSING_DIRS
-- 
2.1.0
