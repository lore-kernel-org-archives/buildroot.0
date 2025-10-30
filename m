Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71152CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4480A4101E;
	Thu, 30 Oct 2025 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUUJ8I3yFAX5; Thu, 30 Oct 2025 08:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6703C41020
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6703C41020;
	Thu, 30 Oct 2025 08:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B182A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC796612E8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOL-rEIjqrEc for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E502611C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E502611C3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CFF1879FF; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:12:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e58d730da819c74bb00720cc14ea5c3e0442efa
X-Git-Newrev: 873d59e6fd9865e168cbbea18fbd74d07c274946
X-Patchwork-Hint: ignore
Message-Id: <20251030081453.0CFF1879FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove
 'board/engicam' entry
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=873d59e6fd9865e168cbbea18fbd74d07c274946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In commit [1], the only 'engicam' board config present on the 2025.02.x
branch was removed.

On the master branch the 'px30core' board is present because it was
added in commit [2] not picked on LTS branch.

So the DEVELOPERS entry for Jagan Teki that match every 'engicam' board
was not removed.

This patch removes this entry to remove the post commit hook warning.

[1] 13eb6c293e configs/engicam_imx6*: remove defconfigs, broken
[2] 6e6bd098c3 configs/engicam_px30_core_defconfig: new defconfig

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2278fa45f6..7bbd190b4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1464,7 +1464,6 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
-F:	board/engicam/
 F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-zero-plus2/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
