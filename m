Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF16F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A1660675;
	Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTwzGpYkUH32; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D7E6078F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295237;
	bh=lK+QlaWEmFOix9l++STucG3q6+Zre7PnAlGUL1QoEFE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MkV1XwxpPVlb1mvatVg/3rI5jhDmmsoOlsOWrfYUIZMYrn9rFM+99mootQGhmehB9
	 ifguXoIW2qVs4F3tzIKlWinb/U+pWg/P5qwSgnerspfFuXOhOFbawiZ5vSvGeMunVu
	 gW1kqrKHx+GFjEQaFsRr6EBcuxbDpIHZOP/ZdBgHBkF6LEnfQoOeAEnqMTImPiBJFi
	 VUbr39UVQ1fk1b215guIxtjdxm6RKAlW9xg8bjjHWGgHsh5cQxM3Qr1JY6w/UYkjD3
	 +FzOzkXmPw6H9VrhA46Cv0yEjokbx+qVTFKXlJIgVX4oX0sgBvIYY0ot2Fsdc8qCRR
	 lDgAZPC2277GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D7E6078F;
	Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A22353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6153406BB
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_z_1PNL9s49 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD45405AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDD45405AA
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E478084BCC; Mon, 23 Mar 2026 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b7c4b154354354035533fe0adc0f66b65dddd060
X-Git-Newrev: ba2393e088d3a13c507bdaa38c0df89bf4b67b16
X-Patchwork-Hint: ignore
Message-Id: <20260323194713.E478084BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nfs-utils:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba2393e088d3a13c507bdaa38c0df89bf4b67b16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
