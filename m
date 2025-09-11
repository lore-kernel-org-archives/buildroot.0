Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0AACAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40CFB40A0F;
	Thu, 11 Sep 2025 19:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuQmOE6vzvKR; Thu, 11 Sep 2025 19:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71EA1423F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71EA1423F5;
	Thu, 11 Sep 2025 19:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FD03443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A70141EF4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTpu7fu4aYqN for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327D541EDA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327D541EDA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FCAC842A2; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:07 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 52371dcda92967e3d9a85e06adea655c1b21a118
X-Git-Newrev: 55d41766a39bfe0f8e43283042ad02e84b2c4f59
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.2FCAC842A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] board/versal: increase
 vfat partition to 64M
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

commit: https://git.buildroot.net/buildroot/commit/?id=55d41766a39bfe0f8e43283042ad02e84b2c4f59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
default Linux kernel Image file for versal products is increasing from 23.4M
to 26.9M. This is leaving limited free space in the vfat partition meaning
users may unknowingly exceed the 32M size by just adding Linux kernel configs.

To avoid potential problems, this patch doubles the size of the vfat partition
to 64M, which should be plenty of space for any configuration.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dfed1003d9684d59dd1a48052003fa6212566d63)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/versal/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal/genimage.cfg b/board/versal/genimage.cfg
index d994d3a2bf..8870777f19 100644
--- a/board/versal/genimage.cfg
+++ b/board/versal/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 32M
+	size = 64M
 }
 
 image sdcard.img {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
