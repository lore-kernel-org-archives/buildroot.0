Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43979C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF3C360B3F;
	Mon, 13 Nov 2023 11:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF3C360B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWNLxBn921s5; Mon, 13 Nov 2023 11:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC4760B7C;
	Mon, 13 Nov 2023 11:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC4760B7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1D141BF3BF
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 11:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB99660B7C
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 11:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB99660B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKpl8noVvkuk for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 11:20:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1472760B3F
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 11:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1472760B3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F156687098; Mon, 13 Nov 2023 11:20:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 12:17:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4d2805c7fca53a2d079d4053c41e941d6c38c65
X-Git-Newrev: 3b654626316613a74d0c40cdec6379a2cb399857
X-Patchwork-Hint: ignore
Message-Id: <20231113112019.F156687098@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add missing
 systemd-overlay-fstab
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b654626316613a74d0c40cdec6379a2cb399857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 083e65a67c84f83a3403c92c51d89f8c94907c55 introduced tests for the
various read-only root options under systemd, but while applying the
fs-overlay that is used in one of the tests wasn't included. Include it
now.

Fixes: 083e65a67c84f83a3403c92c51d89f8c94907c55
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/init/systemd-overlay-fstab/etc/fstab | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/init/systemd-overlay-fstab/etc/fstab b/support/testing/tests/init/systemd-overlay-fstab/etc/fstab
new file mode 100644
index 0000000000..d5c84406db
--- /dev/null
+++ b/support/testing/tests/init/systemd-overlay-fstab/etc/fstab
@@ -0,0 +1,2 @@
+/dev/root / auto ro 0 1
+other-var-backing-store /run/buildroot/mounts/var tmpfs defaults
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
