From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:41:53 +0200
Subject: [Buildroot] [git commit] Makefile: use pattern for manual-% in
	noconfig_targets
Message-ID: <20170615100005.6F2E581DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b50b692e4c22cfe3d7b4b35614285e90875baa38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This simplifies the variable a little

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 089989c..1e22858 100644
--- a/Makefile
+++ b/Makefile
@@ -129,8 +129,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-html manual-split-html \
-	manual-pdf manual-text manual-epub
+	print-version olddefconfig distclean manual manual-%
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
