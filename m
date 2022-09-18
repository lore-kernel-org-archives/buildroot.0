Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A684ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A1740A38;
	Sun, 18 Sep 2022 19:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38A1740A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZF95OoHV0Wr; Sun, 18 Sep 2022 19:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 580EB40154;
	Sun, 18 Sep 2022 19:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580EB40154
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31D291BF3F6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DCA560B2C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DCA560B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrD3ou2MWxfy for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 19:37:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FEA560ADA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 19:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEA560ADA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3877E85342; Sun, 18 Sep 2022 19:37:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 21:30:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 123cb730461a6af6cd30566326624f7422d4bad2
X-Git-Newrev: 7e89d78cf0adae86906f89f627d3cd23dd34d4af
X-Patchwork-Hint: ignore
Message-Id: <20220918193735.3877E85342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/cpio: fix slight typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e89d78cf0adae86906f89f627d3cd23dd34d4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Typo introduced in d8f0ec7a468c (fs/cpio: new option to use dracut
tool).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/cpio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 94a826f9e4..bec2d9dca2 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -14,7 +14,7 @@ choice
 config BR2_TARGET_ROOTFS_CPIO_FULL
 	bool "cpio the whole root filesystem"
 	help
-	  Build a cpio archive containing the whole the root filesystem.
+	  Build a cpio archive containing the whole root filesystem.
 
 config BR2_TARGET_ROOTFS_CPIO_DRACUT
 	bool "Invoke dracut to make a partial initramfs"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
