Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A6BF013FA
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34C341062;
	Mon, 16 Mar 2026 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BZVWSmgjhkt; Mon, 16 Mar 2026 21:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F51940821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773696435;
	bh=ThH2CIYeP7X4ZNkfnp3LbWqL3oTkghBPp1NyOjsF/14=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YyMRHLWOVa7awblLlwHCL54/U1rHCqRh3G8ECpTxXn/y9wGZQmDxSkHxnNxzF757n
	 afqngzz97MKTRkfXUires49mtRW1k9ltVX4AuWO3/3vy/yt2uZb9W7OS1fDNuy7ypi
	 eBykYUD7Q3njm1DH8itGv/irf5gZ1sHVkziInEw4JfQX2tVO44LT573KjOG715LgYy
	 cgZ4PEtGKLnmC+1KaMadbeMG43n7QyzzxuOCJLiNLZ75reLrwyy9FGbuxvjNyISe2U
	 RRGkuiIhiZvIvGikN0dr4a62CUFfYpr2su51+y8X7vY+JZjifzYl9EQ2ogxAPR6BXn
	 LiR/PtezH7ZgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F51940821;
	Mon, 16 Mar 2026 21:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2F9D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7436123A
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X2skVRjbgG1 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26919606CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26919606CC
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:27:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64CEC821EF; Mon, 16 Mar 2026 21:27:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 22:17:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84bc50c82d020b09e55ac866a929c86247b73455
X-Git-Newrev: 49c1e1181f16ae1dd9ec3eac931a50961b02e893
X-Patchwork-Hint: ignore
Message-Id: <20260316212711.64CEC821EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49c1e1181f16ae1dd9ec3eac931a50961b02e893
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announce:
https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: remove "security" in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index bf7c4b61b6..1e3f63d419 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
-sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/sha256sums.asc
+sha256  59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae  nfs-utils-2.8.7.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 7ac0b549cf..3d391c1804 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.6
+NFS_UTILS_VERSION = 2.8.7
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
