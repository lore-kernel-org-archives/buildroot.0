Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E967C5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8247C41C41;
	Thu,  5 Jun 2025 20:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9YHuNwRt9vf; Thu,  5 Jun 2025 20:04:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C674741C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C674741C6B;
	Thu,  5 Jun 2025 20:04:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9071D1A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B9B4004A
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0AnkeTwT3TW for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999E34006F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 999E34006F
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 803D3879A3; Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Jun 2025 21:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5080f0af166d2fff26f0c661b0cc7da0b3eaddd8
X-Git-Newrev: 1539e932b659d7a16ab02551ebfdc01aefcebcc1
X-Patchwork-Hint: ignore
Message-Id: <20250605200430.803D3879A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix comment for iris
 gallium driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1539e932b659d7a16ab02551ebfdc01aefcebcc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 600e75b606 "remove depends on architecture for Iris/
Vulkan" forgot to remove the dependency for the comment of the iris
driver.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 99cb0b955c..9454beedf4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -138,7 +138,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	  Mesa driver for iris-based Intel GPUs.
 
 comment "iris driver needs llvm"
-	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D_LLVM
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
