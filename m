Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B96CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53251407BC;
	Sun,  7 Apr 2024 15:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSDWrsn9aQai; Sun,  7 Apr 2024 15:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC97E407DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC97E407DE;
	Sun,  7 Apr 2024 15:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA5AA1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B63CF608F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVwPz4AZbOZW for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC278608DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC278608DE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A61EB81266; Sun,  7 Apr 2024 15:31:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:14:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50d3a1f73a6c054b02a9ba535a696fbd5bd5714e
X-Git-Newrev: 109362c90418d9595e3bab0c9ab6d1c8a24f01db
X-Patchwork-Hint: ignore
Message-Id: <20240407153141.A61EB81266@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: needs C++17
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=109362c90418d9595e3bab0c9ab6d1c8a24f01db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
32c1fbad554d4c2bfbe56a652333195c8ae67904:

configure: error: *** A compiler with support for C++17 language features is required.

Fixes: 32c1fbad554d4c2bfbe56a652333195c8ae67904
 - http://autobuild.buildroot.org/results/451bae7151a74cbcb5d199b8516e9c255a0953fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: also update BR2_GOOGLE_BREAKPAD_ENABLE]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
