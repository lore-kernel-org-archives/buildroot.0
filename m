From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 15:29:27 +0100
Subject: [Buildroot] [PATCH] core: add a 'make version' rule
Message-ID: <1445956167-11122-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We often ask people for the version they are using when they ask for
help (either on the list or on IRC). Some of them do not even know which
version they are using.

Add a make rule to dump the full version string.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 853d185..3cf0c0c 100644
--- a/Makefile
+++ b/Makefile
@@ -88,10 +88,14 @@ DATE := $(shell date +%Y%m%d)
 # Need to export it, so it can be got from environment in children (eg. mconf)
 export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
+.PHONY: version
+version:
+	@echo $(BR2_VERSION_FULL)
+
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig
+	print-version olddefconfig version
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
-- 
1.9.1
