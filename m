Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4059ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9053541626;
	Fri, 16 Sep 2022 11:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9053541626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qyMqygUg5v0; Fri, 16 Sep 2022 11:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A49C541621;
	Fri, 16 Sep 2022 11:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A49C541621
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA081BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1836B842B6
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1836B842B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1YWYV2bMWpa for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DA6C84294
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA6C84294
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D5D683CC2; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:18:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bc57f83c202ab157d5cdc15d21bb37dd33578402
X-Git-Newrev: 683f64176c3dbb96f3e5d116ac1174fc3febc2cd
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.3D5D683CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Config.in.legacy: add
 missing select
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

commit: https://git.buildroot.net/buildroot/commit/?id=683f64176c3dbb96f3e5d116ac1174fc3febc2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

BR2_LINUX_KERNEL_CUSTOM_LOCAL was moved to legacy handling during release
2016.11 but does not select BR2_LEGACY.
Add the select, like done by all other symbols in the file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e07fcf80bc5347075629b222402ad29008de64b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 97d6197aeb..cfbe2921cc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3839,6 +3839,7 @@ config BR2_PACKAGE_ELEMENTARY
 
 config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	bool "Linux kernel local directory option removed"
+	select BR2_LEGACY
 	help
 	  The option to select a local directory as the source of the
 	  Linux kernel has been removed. It hurts reproducibility of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
