Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E2C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390B1404F0;
	Sun, 18 Dec 2022 13:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390B1404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViB-N5CIGgKd; Sun, 18 Dec 2022 13:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7674840169;
	Sun, 18 Dec 2022 13:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7674840169
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F25FF1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D832960687
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D832960687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MZgiZC-KxkR for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1C5605D6
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1C5605D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFFE986896; Sun, 18 Dec 2022 13:53:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:53:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63cd5db50914536910b67a0a06e05c22ddcc5a22
X-Git-Newrev: d4c41ac00c7d144f8aed1644a1b80eca8470d01d
X-Patchwork-Hint: ignore
Message-Id: <20221218135357.EFFE986896@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: add lsmtd option
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
