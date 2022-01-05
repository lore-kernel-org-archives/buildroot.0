Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38557C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58956FBC6;
	Wed,  5 Jan 2022 21:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrjEvabDkDD0; Wed,  5 Jan 2022 21:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438426FBC3;
	Wed,  5 Jan 2022 21:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1911BF9CB
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 183B6409D2
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPEoym20aLbE for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A71C409B7
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0D863832C5; Wed,  5 Jan 2022 20:54:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:58:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd9c604c96480819c053811432b7c36073ad785e
X-Git-Newrev: 2fb55340ef0781243b18a6f2519c02b5c1d7bf28
X-Patchwork-Hint: ignore
Message-Id: <20220105205428.0D863832C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsemanage: add gcc >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb55340ef0781243b18a6f2519c02b5c1d7bf28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsemanage/Config.in     | 6 ++++--
 package/policycoreutils/Config.in | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 3c7050ee51..5103df3f15 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_BZIP2
@@ -17,6 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a toolchain w/ threads, dynamic library"
+comment "libsemanage needs a toolchain w/ threads, dynamic library, gcc >= 5"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 81900b4e41..3201c8fede 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,12 +1,14 @@
-comment "policycoreutils needs a toolchain w/ threads, dynamic library"
+comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
-	depends on !BR2_STATIC_LIBS #libsemanage
+	depends on !BR2_STATIC_LIBS # libsemanage
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
