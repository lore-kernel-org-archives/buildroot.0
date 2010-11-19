From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 13:37:59 +0100
Subject: [Buildroot] [git commit master 1/1] gdb: add source targets for
	gdbserver/gdbhost
Message-ID: <20101119123839.6922B8D3B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0826a822b9519fbd5aebf9f7d12d88832b3ddb22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So it gets handled by make source / external-deps

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 54c3905..af08d1e 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -162,6 +162,8 @@ endif
 
 gdbserver: $(TARGET_DIR)/usr/bin/gdbserver
 
+gdbserver-source: $(DL_DIR)/$(GDB_SOURCE)
+
 gdbserver-clean:
 	-$(MAKE) -C $(GDB_SERVER_DIR) clean
 
@@ -209,6 +211,8 @@ $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 
 gdbhost: $(TARGET_CROSS)gdb
 
+gdbhost-source: $(DL_DIR)/$(GDB_SOURCE)
+
 gdbhost-clean:
 	-$(MAKE) -C $(GDB_HOST_DIR) clean
 
-- 
1.7.2.2
