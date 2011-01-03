From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Jan 2011 00:33:14 +0100
Subject: [Buildroot] [git commit master 1/1] gdb: fixup symlink handling now
	tolchain gets installed into HOST_DIR
Message-ID: <20110103233331.6E7348F331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34acba1b3ef4ea874a1793f0f36a6b49abbb37ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index af08d1e..739ebbe 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -204,10 +204,8 @@ $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
 
 $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
-	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/gdb
 	ln -snf $(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
+		$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
 
 gdbhost: $(TARGET_CROSS)gdb
 
-- 
1.7.2.2
