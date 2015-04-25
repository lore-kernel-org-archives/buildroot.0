From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 25 Apr 2015 03:23:14 +0200
Subject: [Buildroot] [PATCH] sh64: deprecate support for this dead
	architecture
Message-ID: <20150425012313.GA29771@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the mailinglist, this should be deprecated
before removal.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 Config.in.legacy |    6 ++++++
 arch/Config.in   |    1 +
 2 files changed, 7 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 70a9043..622e51c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_sh64
+	bool "SuperH64 architecture support has been removed"
+	select BR2_LEGACY
+	help
+	  There is no hardware or emulator available.
+
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	bool "RTAI patch file path has been removed"
 	help
diff --git a/arch/Config.in b/arch/Config.in
index 59bf84a..06aff2c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -163,6 +163,7 @@ config BR2_sh
 
 config BR2_sh64
 	bool "SuperH64"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
-- 
1.7.10.4
