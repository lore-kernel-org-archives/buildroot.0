Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2016FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0294051A;
	Sun,  7 Apr 2024 08:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lX1RzgUAIMWH; Sun,  7 Apr 2024 08:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C7040530
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77C7040530;
	Sun,  7 Apr 2024 08:52:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5FCB1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D87406B1
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYGuYfh1K0UY for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F7E40527
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3F7E40527
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ECFD84BCF; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:51:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef833f926b43713f23944898d1d4e64ee26f046d
X-Git-Newrev: b0865e2a76cc5d51dc874ceb448572081f001f92
X-Patchwork-Hint: ignore
Message-Id: <20240407085210.9ECFD84BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0865e2a76cc5d51dc874ceb448572081f001f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failures raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

configure: error: newgrp selected, but required crypt function not available

[...]

configure: error: sulogin selected, but required crypt function not available

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/961cd1221adf9ef8bfaff25b212351d10769c369
 - http://autobuild.buildroot.org/results/875a8d9ad76e844149d9a1c0c1983696e7313eff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/Config.in                          | 2 ++
 package/util-linux/util-linux-libs/util-linux-libs.mk | 1 +
 package/util-linux/util-linux.mk                      | 1 +
 3 files changed, 4 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 73fa11380e..1f5dacec2f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -280,6 +280,7 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 
 config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 	bool "newgrp"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Log in to a new group
 
@@ -402,6 +403,7 @@ comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library,
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Single-user login
 
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index e1fe1ec191..0337e7e13a 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,7 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_LIBS_CONF_OPTS += \
 	--disable-rpath \
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a9e5b0bf68..f2821978c5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,7 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
 	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
