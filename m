Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81325C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37CA741775;
	Wed, 22 Feb 2023 17:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CA741775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aB6tRxLdHusk; Wed, 22 Feb 2023 17:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AE784175D;
	Wed, 22 Feb 2023 17:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE784175D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A52F21BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 601AF81423
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 601AF81423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8h9V-2lX3XJY for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B1881FFF
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94B1881FFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 828FA867D2; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:46:15 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 253ee5b11f643a08fa7d144c5d5abeb4fb6ce1a7
X-Git-Newrev: d91470731e28e3c6c42e95e5c405b6e8ff975feb
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.828FA867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-headers:
 remove bogus symbol BR2_PACKAGE_HOST_LINUX_HEADERS
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

commit: https://git.buildroot.net/buildroot/commit/?id=d91470731e28e3c6c42e95e5c405b6e8ff975feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The package host-linux-headers does not exist and there were never
references to this symbol in the tree, do drop it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 367bd65f3c216426e2fc21742dbff11ea8d896d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f6654f8578..775ec2cb67 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -1,8 +1,5 @@
 comment "Kernel Header Options"
 
-config BR2_PACKAGE_HOST_LINUX_HEADERS
-	bool
-
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
