Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CFEE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E871840C88;
	Mon, 11 Sep 2023 10:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E871840C88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0dkc8-AFnpp; Mon, 11 Sep 2023 10:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F5B640CAB;
	Mon, 11 Sep 2023 10:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F5B640CAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80C0A1BF955
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6484740C58
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6484740C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2JVNILoiEL0 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:34:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9088B40B55
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9088B40B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F25186C5D; Mon, 11 Sep 2023 10:34:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 12:32:02 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 43e8ac7a6ae2548d98bb1686b3ad19443594cc05
X-Git-Newrev: 0c93b9ac47ed15abcc34688721f32eeebf196c36
X-Patchwork-Hint: ignore
Message-Id: <20230911103401.7F25186C5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] board/zynq/post-image.sh:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c93b9ac47ed15abcc34688721f32eeebf196c36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
