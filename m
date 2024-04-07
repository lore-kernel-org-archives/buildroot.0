Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929E9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD4A40841;
	Sun,  7 Apr 2024 15:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHr42DfDvIrD; Sun,  7 Apr 2024 15:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B8040876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B8040876;
	Sun,  7 Apr 2024 15:37:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D17B1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAB2F60A52
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3vGippNLhSf for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBF160A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBF160A54
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA0CA855F4; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 166b05b54585bd67ed7920152462f6fe7778f3c4
X-Git-Newrev: 740dffc6a81b5c99a15864885526d628d6b02efb
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.BA0CA855F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: add libxcrypt optional
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=740dffc6a81b5c99a15864885526d628d6b02efb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: auth.o: in function `cupsdAuthorize':
auth.c:(.text+0xdba): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/39b72d4e14895f901590d7e3404f69b4573d2cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups/Config.in | 1 +
 package/cups/cups.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 51cf10b073..ad852c0998 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# needs fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Common Unix Printing System
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index a5098b50e9..5d474d0fe5 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -33,6 +33,7 @@ CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
