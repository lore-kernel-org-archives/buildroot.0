From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 14 Jun 2010 22:36:04 +1000
Subject: [Buildroot] [PATCH] Fix potentially conflicting build flags
Message-ID: <1276518964-6695-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change the default target optimisation value so
it does not conflict with gcc optimization level

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 toolchain/Config.in.2 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 595ab87..71bded2 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -159,9 +159,10 @@ config BR2_INSTALL_LIBSTDCPP
 
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
-	default "-Os -pipe"
+	default "-pipe"
 	help
 	  Optimizations to use when building for the target host.
+	  NOTE: gcc optimization level is defined in build options.
 
 if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/elf2flt/Config.in"
-- 
1.7.0.4
