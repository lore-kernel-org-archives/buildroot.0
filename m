Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB9EC2A075
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187AC40689;
	Sun,  4 Jan 2026 13:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG4uK4HGV2a7; Sun,  4 Jan 2026 13:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CD7406DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532009;
	bh=wYYfBzVKZvEDtE4u5361Q2KP/WIg3O7tLlhGN+CYiqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AZdbAMmAcDEF56wec5b8vQVnlSwflws809hshTfSWR9c0J1nmvGrlkY8GhQWiWyBC
	 juaCcWJi/5remS3pCtoe0MBAAsiMr5RKSrFBB6HXNn4hYOxSXrgWV/FL2Bstnw95q1
	 hea8FVp26BCUrf9PNpg+vW6qSqgRSR3RHBJmcJtBFLieyt7x2uwNyhVNij+PpkXa7R
	 RR8T27Yk5/W5RD2Jej2SBn3SGHSRqa31XOD0S4zq9MMmytE421qVa28WYt8nKdUm4q
	 ZrMWOA+S7IW6+oZkfaFieuZmRGU4fvHu/FGDVaCgtJpwTqyD2U3PsBUJXAPDINMLB5
	 6p5X+1d9AjDnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CD7406DA;
	Sun,  4 Jan 2026 13:06:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 035942DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FB60405B0
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_rv7jE_3Kmo for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B1A4039E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B1A4039E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81A2388244; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4adbbbbec3711bdeb868b80888d0b75d8529cbf1
X-Git-Newrev: 7571ee4a3697106b8938a83116a6e305dffbc3aa
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.81A2388244@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: fix
 dependencies of BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7571ee4a3697106b8938a83116a6e305dffbc3aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this option was introduced in commit
a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules:
new package"), its dependencies have been incorrect. It selects
BR2_PACKAGE_PYTHON3 without replicating all its dependencies, so we
fix that.

Also, it did have the !BR2_STATIC_LIBS dependency propagated, but not
mentioned in the Config.in comment, so we fix that as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-update-modules/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 1158bb42b2..88e0805976 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -173,6 +173,8 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 	bool "rootfs version check"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_PYTHON3 # runtime
@@ -195,8 +197,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rootfs-version-check
 
-comment "rootfs version check needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rootfs version check needs a toolchain w/ threads, dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	bool "rpm"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
