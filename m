From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jun 2010 10:50:15 +0200
Subject: [Buildroot] [git commit master 1/1] Fix potentially conflicting
	build flags
Message-ID: <20100615124552.A81A180E3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36391de0dbf8ed623e9897941a286fa19cb17b05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the default target optimisation value so
it does not conflict with gcc optimization level

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.1
