Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AA4ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB9641CB7;
	Fri, 16 Sep 2022 11:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB9641CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2-J0SIGWGsZ; Fri, 16 Sep 2022 11:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62BB418E9;
	Fri, 16 Sep 2022 11:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62BB418E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C60C1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3215F60C07
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3215F60C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q23WXSPRKml3 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 623FD61212
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623FD61212
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5265383CC9; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:21:04 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ed208006659a68c3c091b356e5dd85aa290e2919
X-Git-Newrev: 1303b4595687a0e22b4e88d024e27b8a2806d5d1
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.5265383CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tcf-agent: drop
 bogus BR2_powerpcle
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

commit: https://git.buildroot.net/buildroot/commit/?id=1303b4595687a0e22b4e88d024e27b8a2806d5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The inexistent symbol is referenced by commit from 2018:
'd0d04b4c5a tcf-agent: new package'

Cc: Eugene Tarassov <eugene@largest.net>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 52c000f3ab12773c96dc0df89eea8b606d34a117)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcf-agent/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e58642b0..8c7aab0c0b 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc || BR2_powerpcle
+	default "powerpc"    if BR2_powerpc
 	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
