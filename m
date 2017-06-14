From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:30 +0200
Subject: [Buildroot] [PATCH 3/8] Makefile: use pattern for manual-% in
	noconfig_targets
In-Reply-To: <20170614221135.17470-1-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <20170614221135.17470-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This simplifies the variable a little

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 089989c624..1e22858082 100644
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
-- 
2.11.0
