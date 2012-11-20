From: Richard Braun <rbraun@sceen.net>
Date: Tue, 20 Nov 2012 17:17:23 +0100
Subject: [Buildroot] [PATCH] toolchain-external: fix installation of
	libthread_db
Message-ID: <1353428243-18866-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whatever the gdbserver source, as long as it's installed on the target,
assume it requires libthread_db.

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a6025db..8ce0a84 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -61,7 +61,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIB_EXTERNAL_LIBS+=libpthread.so
-ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
 LIB_EXTERNAL_LIBS+=libthread_db.so
 endif # gdbserver
 endif # ! no threads
-- 
1.7.2.5
