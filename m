Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A8CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85994614AD;
	Mon, 17 Nov 2025 20:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qKUkTeGvQ7e; Mon, 17 Nov 2025 20:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9275A614B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9275A614B0;
	Mon, 17 Nov 2025 20:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C881BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C22B83DC3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5mFykxITGn4 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EAC783DAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EAC783DAD
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE9181E81; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 17:07:12 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: ae9d0cb8b3f32904821a9f9f6da45e55ed10427c
X-Git-Newrev: f269ba9f7f0d524e078460df91807ab1d000de0f
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.4CE9181E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/ramspeed: remove
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f269ba9f7f0d524e078460df91807ab1d000de0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The download location is gone and even though the package is available
on a Github repository [0], it has not been updated for 7 years now.
Drop the package.

[0] https://github.com/cruvolo/ramspeed

See buildroot commit 0951e3fc24492267675f2bb81f65cd0ff5bb758e for the
removal of the ramsmp package which is the SMP version of ramspeed.

Fixes:
https://autobuild.buildroot.net/results/d40/d404da1c3a7cd8628d2b2e9e519d629626d28593/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 07ab60acd97a53ef212a0a04e166f44d56d79ff1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy               |  9 +++++++++
 package/Config.in              |  1 -
 package/ramspeed/Config.in     | 11 -----------
 package/ramspeed/Makefile      | 14 --------------
 package/ramspeed/ramspeed.hash |  3 ---
 package/ramspeed/ramspeed.mk   | 22 ----------------------
 6 files changed, 9 insertions(+), 51 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f51177a1ed..0ee79950c3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.08.2"
+
+config BR2_PACKAGE_RAMSPEED
+	bool "ramspeed has been removed"
+	select BR2_LEGACY
+	help
+	  The ramspeed package was removed as it is not maintained
+	  anymore and the upstream repo is gone.
+
 comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_NETSTAT_NAT
diff --git a/package/Config.in b/package/Config.in
index af858ebf11..69428680c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -142,7 +142,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
-	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
 	source "package/rwmem/Config.in"
 	source "package/sentry-native/Config.in"
diff --git a/package/ramspeed/Config.in b/package/ramspeed/Config.in
deleted file mode 100644
index bd0438ffe1..0000000000
--- a/package/ramspeed/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-comment "ramspeed needs a toolchain not affected by GCC bug 43744"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
-
-config BR2_PACKAGE_RAMSPEED
-	bool "ramspeed"
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
-	help
-	  RAMspeed is a free open source command line utility
-	  to measure cache and memory performance.
-
-	  http://alasir.com/software/ramspeed/
diff --git a/package/ramspeed/Makefile b/package/ramspeed/Makefile
deleted file mode 100644
index f4a4de6a1e..0000000000
--- a/package/ramspeed/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-
-all: generic
-
-generic: ramspeed.c fltmem.c fltmark.c intmem.c intmark.c
-	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o ramspeed
-
-i386: ramspeed.c i386/*.s i386/cpuinfo/*.s
-	$(CC) $(CFLAGS) -DI386_ASM $(LDFLAGS) $^ -o ramspeed
-
-x86_64: ramspeed.c amd64/*.s
-	$(CC) $(CFLAGS) -DAMD64_ASM $(LDFLAGS) $^ -o ramspeed
-
-clean:
-	rm -f *.o ramspeed
diff --git a/package/ramspeed/ramspeed.hash b/package/ramspeed/ramspeed.hash
deleted file mode 100644
index 5a6bfe3eb2..0000000000
--- a/package/ramspeed/ramspeed.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  f84e2e42b2b6b221ef9b586f6ae63d863db4ff21858e0ce7c84622a7c9522950  ramspeed-2.6.0.tar.gz
-sha256  2c308cffbab01762f8f6b11725725a227080746ef865f2756c9c9e1591dddaad  LICENCE
diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
deleted file mode 100644
index 7dc4faae7c..0000000000
--- a/package/ramspeed/ramspeed.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# ramspeed
-#
-################################################################################
-
-RAMSPEED_VERSION = 2.6.0
-RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
-RAMSPEED_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
-RAMSPEED_LICENSE = Alasir License
-RAMSPEED_LICENSE_FILES = LICENCE
-
-define RAMSPEED_BUILD_CMDS
-	cp -f package/ramspeed/Makefile $(@D)
-	$(TARGET_CONFIGURE_OPTS) make -C $(@D) $(RAMSPEED_ARCH)
-endef
-
-define RAMSPEED_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/ramspeed $(TARGET_DIR)/usr/bin/ramspeed
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
