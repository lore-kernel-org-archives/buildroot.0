Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD0BF483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A546608B9;
	Mon, 23 Mar 2026 19:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cChWN33Ud40W; Mon, 23 Mar 2026 19:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A7FF608BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295276;
	bh=Z6xWR1hxVLTZqvNL5NrYGlq5g4v/2c1n3DChulqP7qA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oeddT0YLcMtGTU+UcVpE/DfgPCbM8lqpRKyBbVeV14ooWEoZxgfYh3Y9R1O4Y1uX/
	 f5MbqlVNTAGdbL8PkR1+Bzetki8t0sMAXdx4BnjYuCUFi/p15vgesYOJgWUONOgjB2
	 IsbzEJgIgOgafiFqz03n+GnaHJcX6Ut3duVglCjsYBxzBXD+xGQslCIi6w0kYC6aSt
	 2LNLnY8cQtHVXgPGEABp8d2tD07QtnQ1rEESu39/rXhkxkhlzIyZaI9L7AmivI8quZ
	 LUa6WoqgSh/HHHwdupQUgm3YAQmEC9u0qzp90RKMCoaOa0Lhlg7JW0OjD/PfLyEVjF
	 iZorvbEdVIdDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7FF608BA;
	Mon, 23 Mar 2026 19:47:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC9E353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 023FB6086B
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_Nag_RUesu8 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3384960859
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3384960859
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64DA18382D; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:55:55 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1f053b6b851acea7d8d81119145ec238aea8ff58
X-Git-Newrev: 47e01beb12d36f6af420ffad93e6c36d97d7efce
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.64DA18382D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/nfs-utils:
 security bump version to 2.8.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47e01beb12d36f6af420ffad93e6c36d97d7efce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Release announce:
https://lore.kernel.org/linux-nfs/4d58bf28-a3e0-4496-bae8-05387da27054@redhat.com/

This update fixes:
https://www.cve.org/CVERecord?id=CVE-2025-12801

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7dfd2feb445c2cf83a2b52057fab96e72e42a071)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9aa9151ebb..bf7c4b61b6 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
-sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
+sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ba87ef813e..7ac0b549cf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.5
+NFS_UTILS_VERSION = 2.8.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
