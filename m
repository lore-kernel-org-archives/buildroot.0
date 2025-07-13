Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E2C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 13:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE19060B07;
	Sun, 13 Jul 2025 13:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWcnT_qoxRSV; Sun, 13 Jul 2025 13:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D760760AC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D760760AC7;
	Sun, 13 Jul 2025 13:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44516106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 367DF60AC7
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xgn9_QM5mG5 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 13:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BB660A96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80BB660A96
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:49:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B8A086491; Sun, 13 Jul 2025 13:49:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 15:46:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d79bbd48eb523ee1c3daa82728519fe7878611e4
X-Git-Newrev: df7e428cf5512e1cd7da31f694d92ebb53f8344f
X-Patchwork-Hint: ignore
Message-Id: <20250713134918.7B8A086491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs: erofs: reword "all-fragments" Kconfig
 text
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

commit: https://git.buildroot.net/buildroot/commit/?id=df7e428cf5512e1cd7da31f694d92ebb53f8344f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, both BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS and
BR2_TARGET_ROOTFS_EROFS_FRAGMENTS have the same Kconfig prompt, making
them hard to distinguish.

Reword the one for -Eall-fragments to be distinct.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 fs/erofs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index 00f27faeeb..93c069f2c0 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -109,7 +109,7 @@ config BR2_TARGET_ROOTFS_EROFS_FRAGMENTS
 	  Introduced in Linux 6.1.
 
 config BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS
-	bool "enable fragments packing"
+	bool "enable all-fragments packing"
 	help
 	  Forcely record the whole files into a special inode for better
 	  compression. Introduced in Linux 6.1.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
