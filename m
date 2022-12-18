Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC59C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7894EDCD;
	Mon, 20 Feb 2023 22:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7894EDCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxhO4JmcnA7u; Mon, 20 Feb 2023 22:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434CB4EC0D;
	Mon, 20 Feb 2023 22:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434CB4EC0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF74A1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F52416E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F52416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duhddVUoVm_Z for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A220416DD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A220416DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 361A586496; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:53:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63cd5db50914536910b67a0a06e05c22ddcc5a22
X-Git-Newrev: d4c41ac00c7d144f8aed1644a1b80eca8470d01d
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.361A586496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mtd: add lsmtd option
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4c41ac00c7d144f8aed1644a1b80eca8470d01d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

lsmtd is a new utility added in v2.1.0[1].

[1] http://git.infradead.org/mtd-utils.git/commit/c26ce774a7209012c0505ee841d54898c6665e20

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/Config.in | 3 +++
 package/mtd/mtd.mk    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index c45dd1e2b7..3ba48da645 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -71,6 +71,9 @@ config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
 	select BR2_PACKAGE_MTD_JFFS_UTILS
 
+config BR2_PACKAGE_MTD_LSMTD
+	bool "lsmtd"
+
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	select BR2_PACKAGE_MTD_JFFS_UTILS
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6e266a8760..db2b104586 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -94,6 +94,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
 MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_LSMTD)		+= lsmtd
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTDPART)		+= mtdpart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
