Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F558CD1296
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53962608BA;
	Sun,  7 Apr 2024 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS-BEuMtXf0m; Sun,  7 Apr 2024 12:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE39608D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE39608D9;
	Sun,  7 Apr 2024 12:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86D731BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A38402BC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwNGgadf4hai for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B962402FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B962402FE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 332DB84C72; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 14:05:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12ea11d86efa62af8f4b19cd871adf4c90981f52
X-Git-Newrev: c7a1ee8f10728fcaab1ab85e93b584d4f3109354
X-Patchwork-Hint: ignore
Message-Id: <20240407121837.332DB84C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/android-tools: add libxcrypt
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7a1ee8f10728fcaab1ab85e93b584d4f3109354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/12.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/ab7c1ff0649bec21584654431e722efe2dc88c3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: coding style]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/android-tools/Config.in        | 1 +
 package/android-tools/android-tools.mk | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index bc76d545c1..a688182ed9 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -68,6 +68,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
 	depends on BR2_USE_MMU # uses fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3d5c76a322..20e26839f9 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -63,7 +63,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
 ANDROID_TOOLS_TARGETS += adbd
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+ANDROID_TOOLS_DEPENDENCIES += \
+	openssl \
+	zlib \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 endif
 
 # Build each tool in its own directory not to share object files
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
