Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36810C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 11:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D1860E92;
	Thu,  2 May 2024 11:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNINx99JJt5h; Thu,  2 May 2024 11:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB2B60E9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB2B60E9A;
	Thu,  2 May 2024 11:22:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B931E1BF2A9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C9141518
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsSu_4VNL-8h for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC2E4150F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BC2E4150F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 11:22:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94AD38661A; Thu,  2 May 2024 11:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 13:19:46 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 762717fdcfc56664f5b4ff183d2faf90006f4337
X-Git-Newrev: eb80cd6563320cde6a9f7dd2b820c80d1360d728
X-Patchwork-Hint: ignore
Message-Id: <20240502112239.94AD38661A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/google-breakpad:
 needs C++17
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb80cd6563320cde6a9f7dd2b820c80d1360d728
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure raised since commit
32c1fbad554d4c2bfbe56a652333195c8ae67904:

configure: error: *** A compiler with support for C++17 language features is required.

Fixes: 32c1fbad554d4c2bfbe56a652333195c8ae67904
 - http://autobuild.buildroot.org/results/451bae7151a74cbcb5d199b8516e9c255a0953fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: also update BR2_GOOGLE_BREAKPAD_ENABLE]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 109362c90418d9595e3bab0c9ab6d1c8a24f01db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                         | 2 +-
 package/google-breakpad/Config.in | 6 +++---
 package/sentry-native/Config.in   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in b/Config.in
index 113adf0755..e4f58f3f66 100644
--- a/Config.in
+++ b/Config.in
@@ -586,7 +586,7 @@ config BR2_ENABLE_LTO
 config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 5c7f4bb7ba..4e2d98eb04 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -45,10 +45,10 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
 
 endif
 
-comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+comment "google-breakpad requires a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/sentry-native/Config.in b/package/sentry-native/Config.in
index 7a3cbd36ad..88db2779f1 100644
--- a/package/sentry-native/Config.in
+++ b/package/sentry-native/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SENTRY_NATIVE
 	bool "sentry-native"
 	depends on BR2_INSTALL_LIBSTDCPP # google-breakpad
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # google-breakpad
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # google-breakpad
 	depends on BR2_USE_WCHAR # google-breakpad
 	depends on BR2_TOOLCHAIN_HAS_THREADS # google-breakpad
 	# google-breakpad is restricted to glibc or uClibc, but
@@ -19,10 +19,10 @@ config BR2_PACKAGE_SENTRY_NATIVE
 
 	  https://github.com/getsentry/sentry-native
 
-comment "sentry-native needs a glibc toolchain with w/ wchar, thread, C++, gcc >= 4.8"
+comment "sentry-native needs a glibc toolchain with w/ wchar, threads, C++, gcc >= 7"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
