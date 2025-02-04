Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF0CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D4160008;
	Fri, 28 Feb 2025 17:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90FpOdciSDIE; Fri, 28 Feb 2025 17:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071BA70B6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071BA70B6B;
	Fri, 28 Feb 2025 17:13:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C0F368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0D242478
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WhYPXte7y20 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BF241A10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BF241A10
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 404BE85FAE; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 17:53:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9cd3464afa13fd0190fb3e94fd850cc8063cf297
X-Git-Newrev: 0951e3fc24492267675f2bb81f65cd0ff5bb758e
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.404BE85FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ramsmp: drop package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6955759090861915379=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6955759090861915379==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0951e3fc24492267675f2bb81f65cd0ff5bb758e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The download location is gone and even though the package is available
on a Github repository [0], it has not been updated for 7 years now.
Drop the package.

[0] https://github.com/cruvolo/ramspeed-smp

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy           |  7 +++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/ramsmp/Config.in   |  9 ---------
 package/ramsmp/Makefile    | 14 --------------
 package/ramsmp/ramsmp.hash |  3 ---
 package/ramsmp/ramsmp.mk   | 22 ----------------------
 7 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 674299470f..2e5bd3153f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -317,6 +317,13 @@ config BR2_PACKAGE_QUAGGA
 	  The quagga package was removed as it is not maintained
 	  anymore and the upstream repo is gone.
 
+config BR2_PACKAGE_RAMSMP
+	bool "ramsmp has been removed"
+	select BR2_LEGACY
+	help
+	  The ramsmp package was removed as it is not maintained
+	  anymore and the upstream repo is gone.
+
 comment "Legacy options removed in 2024.11"
 
 config BR2_PACKAGE_BSDIFF
diff --git a/DEVELOPERS b/DEVELOPERS
index 0c9f2126a4..731f2a5d17 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2057,7 +2057,6 @@ F:	package/openvmtools/
 N:	Kelvin Cheung <keguang.zhang@gmail.com>
 F:	package/cpuload/
 F:	package/bwm-ng/
-F:	package/ramsmp/
 
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
diff --git a/package/Config.in b/package/Config.in
index b76d37e4a0..bc77878b08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -144,7 +144,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
-	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
 	source "package/rwmem/Config.in"
diff --git a/package/ramsmp/Config.in b/package/ramsmp/Config.in
deleted file mode 100644
index 411e7de911..0000000000
--- a/package/ramsmp/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_RAMSMP
-	bool "ramspeed/smp"
-	depends on BR2_USE_MMU # fork()
-	help
-	  RAMspeed/SMP is a free open source command line utility to
-	  measure cache and memory performance of multiprocessor
-	  machines.
-
-	  http://alasir.com/software/ramspeed/
diff --git a/package/ramsmp/Makefile b/package/ramsmp/Makefile
deleted file mode 100644
index 5cd76e09d9..0000000000
--- a/package/ramsmp/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-
-all: generic
-
-generic: ramsmp.c fltmem.c fltmark.c intmem.c intmark.c
-	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o ramsmp
-
-i386: ramsmp.c i386/*.s i386/cpuinfo/*.s
-	$(CC) $(CFLAGS) -DI386_ASM $(LDFLAGS) $^ -o ramsmp
-
-x86_64: ramsmp.c amd64/*.s
-	$(CC) $(CFLAGS) -DAMD64_ASM $(LDFLAGS) $^ -o ramsmp
-
-clean:
-	rm -f *.o ramsmp
diff --git a/package/ramsmp/ramsmp.hash b/package/ramsmp/ramsmp.hash
deleted file mode 100644
index c5e29a3900..0000000000
--- a/package/ramsmp/ramsmp.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  39fb15493fb3c293575746d56f6ab9faaa1d876d8b1f0d8e5a4042d2ace95839  ramsmp-3.5.0.tar.gz
-sha256  2c308cffbab01762f8f6b11725725a227080746ef865f2756c9c9e1591dddaad  LICENCE
diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
deleted file mode 100644
index 6098376da5..0000000000
--- a/package/ramsmp/ramsmp.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# ramsmp
-#
-################################################################################
-
-RAMSMP_VERSION = 3.5.0
-RAMSMP_SITE = http://www.alasir.com/software/ramspeed
-RAMSMP_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
-RAMSMP_LICENSE = Alasir License
-RAMSMP_LICENSE_FILES = LICENCE
-
-define RAMSMP_BUILD_CMDS
-	cp -f package/ramsmp/Makefile $(@D)
-	$(TARGET_CONFIGURE_OPTS) make -C $(@D) $(RAMSMP_ARCH)
-endef
-
-define RAMSMP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/ramsmp $(TARGET_DIR)/usr/bin/ramsmp
-endef
-
-$(eval $(generic-package))

--===============6955759090861915379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6955759090861915379==--
