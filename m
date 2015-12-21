From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 21 Dec 2015 19:05:19 -0200
Subject: [Buildroot] [PATCH] trace-cmd: bump to version 2.6
Message-ID: <1450731919-28110-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove no longer needed patch (fixed upstream).

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/trace-cmd/0001-Fix-ptrace-detection.patch | 36 -----------------------
 package/trace-cmd/trace-cmd.mk                    |  2 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 package/trace-cmd/0001-Fix-ptrace-detection.patch

diff --git a/package/trace-cmd/0001-Fix-ptrace-detection.patch b/package/trace-cmd/0001-Fix-ptrace-detection.patch
deleted file mode 100644
index b17d7df0d266..000000000000
--- a/package/trace-cmd/0001-Fix-ptrace-detection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0070081ffe65a4fbe442044ddfcc818593c98e33 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 30 Oct 2013 22:35:34 +0100
-Subject: [PATCH] Fix ptrace detection
-
-Ptrace support detection is ignored when CFLAGS is set in command
-arguments. Use override in Makefile to add -DWARN_NO_PTRACE and
--DNO_PTRACE in CFLAGS if ptrace is not available.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 83329ca..01b4f45 100644
---- a/Makefile
-+++ b/Makefile
-@@ -223,12 +223,12 @@ LDFLAGS ?=
- ifndef NO_PTRACE
- ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
- 	NO_PTRACE = 1
--	CFLAGS += -DWARN_NO_PTRACE
-+	override CFLAGS += -DWARN_NO_PTRACE
- endif
- endif
- 
- ifdef NO_PTRACE
--CFLAGS += -DNO_PTRACE
-+override CFLAGS += -DNO_PTRACE
- endif
- 
- # Append required CFLAGS
--- 
-1.8.1.2
-
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 55958b08dca1..839e7ee3e806 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.3.2
+TRACE_CMD_VERSION = trace-cmd-v2.6
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-- 
1.9.1
