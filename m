Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10613C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6A684EC45;
	Mon, 20 Feb 2023 23:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A684EC45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LBm85mY-u6A; Mon, 20 Feb 2023 23:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFC14ECA3;
	Mon, 20 Feb 2023 23:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFC14ECA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 732331BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6198341797
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6198341797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSv-EO5q0t9r for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BA2D41745
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA2D41745
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 559A7828C8; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 23:32:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
X-Git-Newrev: 9717b303683ba7ec035de004c6f2ddd195d07808
X-Patchwork-Hint: ignore
Message-Id: <20230220205245.559A7828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sexpect: requires MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=9717b303683ba7ec035de004c6f2ddd195d07808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable when MMU is not available for target.

Fixes:
http://autobuild.buildroot.net/results/a2b69fdf67d520aa4d2718bd688d88d102842cdf

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sexpect/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sexpect/Config.in b/package/sexpect/Config.in
index bdf5c3bbf5..e558af26f0 100644
--- a/package/sexpect/Config.in
+++ b/package/sexpect/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SEXPECT
 	bool "sexpect"
+	depends on BR2_USE_MMU # fork()
 	help
 	  sexpect is another implementation of Expect which is
 	  specifically designed for Shell scripts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
