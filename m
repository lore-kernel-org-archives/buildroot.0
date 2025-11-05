Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8171CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E228840EF;
	Wed,  5 Nov 2025 22:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mleJLQ__zvjk; Wed,  5 Nov 2025 22:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AB08411C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84AB08411C;
	Wed,  5 Nov 2025 22:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39EC0B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994A64122D
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYd6KIRs3VZ0 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AD4411E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AD4411E7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1FD283DA0; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4da66e8130c6d2af9c15534a29df74ca7bbfe629
X-Git-Newrev: 0eb873bda0c019269cefe04d8c06abea2b371b37
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.D1FD283DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: rename check-merged-usr.sh
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0eb873bda0c019269cefe04d8c06abea2b371b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're going to need it to check merged-bin, so the naming would be
misleading as it would no longer be just about merged-usr.

Also drop the extension, it's useless.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Makefile                                              | 2 +-
 package/skeleton-custom/skeleton-custom.mk            | 2 +-
 support/scripts/{check-merged-usr.sh => check-merged} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 77ca3b4702..935893be17 100644
--- a/Makefile
+++ b/Makefile
@@ -783,7 +783,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type overlay \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 endif # merged /usr
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index c194108307..82e1506156 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -27,7 +27,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type skeleton \
 		$(SKELETON_CUSTOM_PATH)
 endef
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged
similarity index 100%
rename from support/scripts/check-merged-usr.sh
rename to support/scripts/check-merged
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
