Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A32EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F02061B11;
	Sat, 23 Jul 2022 20:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F02061B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2nYueTWeSTX; Sat, 23 Jul 2022 20:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E5E6100F;
	Sat, 23 Jul 2022 20:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E5E6100F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF171BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E3A6100F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E3A6100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ie4Vd7GmgEjD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE9960F40
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE9960F40
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 399EF852DA; Sat, 23 Jul 2022 20:26:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:40:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7483e34de59792c7de3e9450260d247cf99278d6
X-Git-Newrev: a0460cb46e5a706032959074b46f807010d0684f
X-Patchwork-Hint: ignore
Message-Id: <20220723202647.399EF852DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/tar: add option for zstd compression
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0460cb46e5a706032959074b46f807010d0684f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/tar/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index a4e375c68b..e88a5bb91e 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -46,6 +46,11 @@ config BR2_TARGET_ROOTFS_TAR_XZ
 	help
 	  Do compress the tarball with xz.
 
+config BR2_TARGET_ROOTFS_TAR_ZSTD
+	bool "zstd"
+	help
+	  Do compress the tarball with zstd.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_TAR_OPTIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
