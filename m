Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F50CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2B66F545;
	Fri, 13 Oct 2023 14:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2B66F545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34a2O9I0Z-Td; Fri, 13 Oct 2023 14:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877FE6F5B1;
	Fri, 13 Oct 2023 14:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877FE6F5B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 168211BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4CD741DBA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CD741DBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7jw3vuVqn8u for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B21BE41BC5
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21BE41BC5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FA7A846D2; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:35:33 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2055dc5ae57298aa6aa4e81b985affa5577c7e01
X-Git-Newrev: 18a767beca20833760f7cc7ebf179b20ea85e9e6
X-Patchwork-Hint: ignore
Message-Id: <20231013144605.9FA7A846D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/webkitgtk:
 require GCC 9 for the 2.40.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=18a767beca20833760f7cc7ebf179b20ea85e9e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Raise the minimal GCC version to 9.3, which is required since webkitgtk-2.40.0 [1].
Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
we do check on >= GCC 9, because we can't check on >= GCC 9.3.

[1] https://github.com/WebKit/WebKit/commit/f9c142d9b5b8c48fe310bc6d3620e634901b2930

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de38484ec31437e3f2f0d7c0fa46f2f30d0a8fbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 23c0bf41db..d47d6a8c1b 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 8, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
