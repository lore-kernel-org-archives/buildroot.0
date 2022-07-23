Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB35C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 722F4416A6;
	Sat, 23 Jul 2022 20:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722F4416A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-Pm5DWXq-ug; Sat, 23 Jul 2022 20:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F58C4019C;
	Sat, 23 Jul 2022 20:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F58C4019C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEED61BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C4542426
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C4542426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQnyKuUp7ukO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB6242178
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB6242178
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 323D28531C; Sat, 23 Jul 2022 20:26:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:40:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ce86404419c0a356a5bd9e726e681b23d53c866
X-Git-Newrev: 7483e34de59792c7de3e9450260d247cf99278d6
X-Patchwork-Hint: ignore
Message-Id: <20220723202647.323D28531C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/ext2: add option for zstd compression
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

commit: https://git.buildroot.net/buildroot/commit/?id=7483e34de59792c7de3e9450260d247cf99278d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 333ead95fe..705446df57 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ
 	help
 	  Do compress the ext2 filesystem with xz.
 
+config BR2_TARGET_ROOTFS_EXT2_ZSTD
+	bool "zstd"
+	help
+	  Do compress the ext2 filesystem with zstd.
+
 endchoice
 
 endif # BR2_TARGET_ROOTFS_EXT2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
