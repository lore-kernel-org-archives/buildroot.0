Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D00CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA4940E5A;
	Wed,  5 Feb 2025 12:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdHYtIQL6lYM; Wed,  5 Feb 2025 12:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1177C41553
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1177C41553;
	Wed,  5 Feb 2025 12:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1297E12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B4C80DE4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mox5f3W4q_aw for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 579CB83563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579CB83563
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 579CB83563
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:11:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EF47442D7;
 Wed,  5 Feb 2025 12:11:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tfeFB-000ARN-2t;
 Wed, 05 Feb 2025 13:11:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 13:11:00 +0100
Message-Id: <20250205121100.40121-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeeijeeuudeuhfevudfgheekgfefvedvheeugeehheehfffhlefgheffteetieetnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhlrghtvghntgihthhophdrohhrghenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/latencytop: drop package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://autobuild.buildroot.net/results/5b7921d1b2d347995b0088ac58b29e2f01dec39a/

The tarball is no longer available for download and the git repo on
infradead.org is also gone, there are no reverse dependencies or DEVELOPERS
entry for it and the package has not been updated since it was added in 2012
by commit cd2f78b1c5af ("New Package: latencytop"), so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                    |  1 -
 Config.in.legacy                       |  6 ++++++
 package/Config.in                      |  1 -
 package/latencytop/0001-makefile.patch | 28 --------------------------
 package/latencytop/Config.in           | 26 ------------------------
 package/latencytop/latencytop.hash     |  3 ---
 package/latencytop/latencytop.mk       | 23 ---------------------
 7 files changed, 6 insertions(+), 82 deletions(-)
 delete mode 100644 package/latencytop/0001-makefile.patch
 delete mode 100644 package/latencytop/Config.in
 delete mode 100644 package/latencytop/latencytop.hash
 delete mode 100644 package/latencytop/latencytop.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 6b45fb9e94..f66bc3d86b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -606,7 +606,6 @@ package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
 package/keyutils/0002-cifs.patch lib_patch.Sob lib_patch.Upstream
 package/kmod/0001-fix-O_CLOEXEC.patch lib_patch.Upstream
 package/kodi/S50kodi Shellcheck lib_sysv.Variables
-package/latencytop/0001-makefile.patch lib_patch.Upstream
 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch lib_patch.Upstream
 package/lcdproc/0001-LCDd.conf.patch lib_patch.Upstream
 package/lcdproc/0002-Add-missing-ioctl-header.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 3e3be95004..214d351e4a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_LATENCYTOP
+	bool "latencytop has been removed"
+	select BR2_LEGACY
+	help
+	  The latencytop package is no longer available for download.
+
 config BR2_PACKAGE_OBSIDIAN_CURSORS
 	bool "obsidian-cursors has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 4896e6db76..3ec6d0d879 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -116,7 +116,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/kmemd/Config.in"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
-	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
 	source "package/libtraceevent/Config.in"
 	source "package/libtracefs/Config.in"
diff --git a/package/latencytop/0001-makefile.patch b/package/latencytop/0001-makefile.patch
deleted file mode 100644
index fa8c51cfd0..0000000000
--- a/package/latencytop/0001-makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Usee $(CC) to enable cross compiling and link to the right ncurses library.
-
-Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
-
---- latencytop-0.5/Makefile.old	2012-04-18 11:59:39.748084334 +0100
-+++ latencytop-0.5/Makefile	2012-04-18 12:00:08.659112340 +0100
-@@ -4,7 +4,7 @@
- DESTDIR =
- SBINDIR = /usr/sbin
- XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
--LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw 
-+LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses 
- 
- OBJS= latencytop.o text_display.o translate.o fsync.o
- 
-@@ -26,10 +26,10 @@
- 
- # We write explicity this "implicit rule"
- %.o : %.c
--	gcc -c $(CFLAGS) $(XCFLAGS) $< -o $@
-+	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
- 
- latencytop:  $(OBJS) latencytop.h Makefile
--	gcc $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
-+	$(CC) $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
- 
- clean:
- 	rm -f *~ latencytop DEADJOE *.o
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
deleted file mode 100644
index b54ef052b4..0000000000
--- a/package/latencytop/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_LATENCYTOP
-	bool "latencytop"
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  There are many types and causes of latency. LatencyTOP
-	  focuses on the type of latency that causes skips in audio,
-	  stutters in your desktop experience or that overloads your
-	  server (while you have plenty of CPU power left).
-
-	  LatencyTOP focuses on the cases where the applications want
-	  to run and execute useful code, but there's some resource
-	  that's not currently available (and the kernel then blocks
-	  the process). This is done both on a system level and on a
-	  per process level, so that you can see what's happening to
-	  the system, and which process is suffering and/or causing
-	  the delays.
-
-	  http://www.latencytop.org
-
-comment "latencytop needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/latencytop/latencytop.hash b/package/latencytop/latencytop.hash
deleted file mode 100644
index 74b8a03a23..0000000000
--- a/package/latencytop/latencytop.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef  latencytop-0.5.tar.gz
-sha256  34d1db30ab21eaedb2c191b2787632a960090a0c63da9f5b481d84b23b98c438  latencytop.c
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
deleted file mode 100644
index 56afe86062..0000000000
--- a/package/latencytop/latencytop.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# latencytop
-#
-################################################################################
-
-LATENCYTOP_VERSION = 0.5
-LATENCYTOP_SITE = http://www.latencytop.org/download
-LATENCYTOP_DEPENDENCIES = libglib2 ncurses
-LATENCYTOP_LICENSE = GPL-2.0
-LATENCYTOP_LICENSE_FILES = latencytop.c
-
-# NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
-# version only
-define LATENCYTOP_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) HAS_GTK_GUI=
-endef
-
-define LATENCYTOP_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) HAS_GTK_GUI=
-endef
-
-$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
