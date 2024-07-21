Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C1FC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD9C605F8;
	Sun, 21 Jul 2024 16:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKuu2wjfRcYw; Sun, 21 Jul 2024 16:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B03860638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B03860638;
	Sun, 21 Jul 2024 16:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3B21BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598D96068A
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odSG7VrmMmi4 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8197E60638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8197E60638
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ABA686F12; Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:21:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8b788e19448bf06603f37666a54abec3f6af6e8
X-Git-Newrev: e6b912132ffb910fa2e04540f355b0073266db3b
X-Patchwork-Hint: ignore
Message-Id: <20240721162141.7ABA686F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: needs C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6b912132ffb910fa2e04540f355b0073266db3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysprof needs C++ since bump to version 46.0 in commit
0d57555407f2a0708515e7c377f57a6466c78b1b and
https://gitlab.gnome.org/GNOME/sysprof/-/commit/a4b5ea6160135ae4ee2916b6a93b281302d5ddc8

Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
 - http://autobuild.buildroot.org/results/6ab455b9287220d4353154ba3b54df4ce57748df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysprof/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 1d1b2fa264..be4f7653b0 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,12 +19,12 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, gcc >= 7"
+comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, C++, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
