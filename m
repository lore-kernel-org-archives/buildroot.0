Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921DDEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E9FA40C53;
	Mon, 11 Sep 2023 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E9FA40C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQRIdcPN0DGE; Mon, 11 Sep 2023 10:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9574B40CC9;
	Mon, 11 Sep 2023 10:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9574B40CC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA05B1BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFA186103B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA186103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgKzYvdhvQa4 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1983F60DF4
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1983F60DF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A1BC86C6C; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 12:32:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fda8cb53f81e8796b4762c6daba89d4e00606e2d
X-Git-Newrev: eebbfb5f286e55ae11df49b5ff5b85d313c14707
X-Patchwork-Hint: ignore
Message-Id: <20230911103506.0A1BC86C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] board/zynq/post-image.sh:
 correct comment text
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

commit: https://git.buildroot.net/buildroot/commit/?id=eebbfb5f286e55ae11df49b5ff5b85d313c14707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7dc8dffe3a83dbd33abb0a0c7c3a24ce5cfe73cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynq/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 627c8ac41a..192354b5be 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
