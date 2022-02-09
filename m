Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C66BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DADA5404FF;
	Wed,  9 Feb 2022 21:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUixNpM6EmE8; Wed,  9 Feb 2022 21:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8F36403A7;
	Wed,  9 Feb 2022 21:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21B2C1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E302040194
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wpULcHpsfDl for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E5914148A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 553CE8323C; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d7b5748bd5ef76d1229f7ac0149bf2934a60a86
X-Git-Newrev: 36f31032087332806342fcc6eb97a94b80201f49
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.553CE8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg-utils: drop reference to
 python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=36f31032087332806342fcc6eb97a94b80201f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg-utils/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
index 3c5a3ee347..2973055baf 100644
--- a/package/opkg-utils/Config.in
+++ b/package/opkg-utils/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPKG_UTILS
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
 	depends on !BR2_STATIC_LIBS # python3
-	depends on !BR2_PACKAGE_PYTHON # python3
 	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_BINUTILS_TARGET if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runtime
@@ -27,8 +26,3 @@ comment "opkg-utils needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-comment "opkg-utils needs python3"
-	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PYTHON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
