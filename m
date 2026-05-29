Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCA1CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0B3614CC;
	Fri, 29 May 2026 08:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUrOstWrOUjK; Fri, 29 May 2026 08:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6B261497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044470;
	bh=KKEDOnRfl1OBY/J+TDQfNw+aEPGJANVC0OR5nhlVK9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNJ4xkQAP/fkgOHmMQxD62vhvQW1P6OMr+Ls4lpfRt0vZ6etGzP7c7M0wG4q0J9Mp
	 qRtyWiqfS/DrPLOTY0CT1qBA1BTAtGKL85awPKo7rxGhbtHJETthBvlwanv++O8swe
	 ZrscILHEGTYXt3fXLhqKwegzgt7sExiKjOHTn/5e+NhfHMkxLKL9KdzvxzVlnNAtub
	 rvCjrFqS4MiqtC6GjjFX0cQcBhzEzzKZ2sDoCrVuGLNkYlOLxstYIsfG/p7AEIQxM9
	 naD5LW5RKo7bohoRYxiJzqAyIAGuyNg3P/uw1jTTjr0cZa3xBPiPqvi1H/Hl2uR9Wm
	 9AbtOd7BhLBDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6B261497;
	Fri, 29 May 2026 08:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA08828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B91A0406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLTacR1XEH_a for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6F1040369
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F1040369
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72008873AD; Fri, 29 May 2026 08:47:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:41:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd0751a86ca3860992e00164ee3fb4cd41664eb1
X-Git-Newrev: bd0fcfbe8f7f20fefa72af2460005c60050acf2a
X-Patchwork-Hint: ignore
Message-Id: <20260529084734.72008873AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/skopeo: remove lvm2
 !BR2_STATIC_LIBS entry
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd0fcfbe8f7f20fefa72af2460005c60050acf2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/skopeo/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index b0229873d4..91d10d1357 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_SKOPEO
 	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
 	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
@@ -17,10 +16,9 @@ config BR2_PACKAGE_SKOPEO
 
 	  https://github.com/containers/skopeo
 
-comment "skopeo needs a toolchain w/ NPTL, sahred libs"
+comment "skopeo needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
