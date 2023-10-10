Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BAFCD8CB4
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7B6461513;
	Tue, 10 Oct 2023 20:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B6461513
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYtJDigc3Rl3; Tue, 10 Oct 2023 20:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CBB6F5B1;
	Tue, 10 Oct 2023 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CBB6F5B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01B311BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDD0241DCE
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD0241DCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfJVl3LCULpA for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EB7941EA3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB7941EA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68100844AF; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 22:00:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96785cd8143d5905c7692b8b06864736c1178619
X-Git-Newrev: d9ac23c6d669f1d7d0ee6da8ccdae511a673235a
X-Patchwork-Hint: ignore
Message-Id: <20231010203622.68100844AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-init-systemd: fix
 var.mount options
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9ac23c6d669f1d7d0ee6da8ccdae511a673235a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mode should reflect the mount directory,
and 755 is the default - so drop the mount option.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skeleton-init-systemd/factory/var.mount | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton-init-systemd/factory/var.mount b/package/skeleton-init-systemd/factory/var.mount
index e97accef93..a681ab0c54 100644
--- a/package/skeleton-init-systemd/factory/var.mount
+++ b/package/skeleton-init-systemd/factory/var.mount
@@ -12,4 +12,4 @@ After=swap.target
 What=tmpfs
 Where=/var
 Type=tmpfs
-Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
+Options=nosuid,nodev,size=50%%,nr_inodes=1m
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
