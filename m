From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:43 +0200
Subject: [Buildroot] [PATCH 09/53] gdb: Remove /usr part from installation
	path of gdbserver
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7036b4cb0f..9a97cb77a7 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -181,7 +181,7 @@ GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
 # does.
 define GDB_SDK_INSTALL_GDBSERVER
 	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
-		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
+		$(HOST_DIR)/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
 endef
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-- 
2.11.0
