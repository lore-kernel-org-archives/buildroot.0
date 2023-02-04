Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8474C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 22:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E6B820D8;
	Sat,  4 Feb 2023 22:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E6B820D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97cInhuGiRSB; Sat,  4 Feb 2023 22:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95359820D1;
	Sat,  4 Feb 2023 22:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95359820D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3141BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 22:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5545640926
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 22:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5545640926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsC8joWhSMVl for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 22:35:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A58DE404ED
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 22:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A58DE404ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A9C8836A3; Sat,  4 Feb 2023 22:35:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 23:32:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
X-Git-Newrev: 9717b303683ba7ec035de004c6f2ddd195d07808
X-Patchwork-Hint: ignore
Message-Id: <20230204223549.8A9C8836A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sexpect: requires MMU
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
